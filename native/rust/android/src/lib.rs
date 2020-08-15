#![cfg(target_os="android")]
#![allow(non_snake_case)]

#[macro_use] extern crate log;
extern crate android_logger;

use log::Level;
use android_logger::Config;

use std::ffi::{CString, CStr};
use jni::JNIEnv;
use jni::objects::{JObject, JString};
use jni::sys::{jstring};

#[no_mangle]
pub unsafe extern fn Java_com_rust_litewalletjni_LiteWalletJni_initlogging(env: JNIEnv, _: JObject) -> jstring {
    android_logger::init_once(
        Config::default().with_min_level(Level::Trace),
    );

    let ok = format!("OK");
    let output = env.new_string(ok.as_str()).unwrap();
    return output.into_inner();
}

#[no_mangle]
pub unsafe extern fn Java_com_rust_litewalletjni_LiteWalletJni_initnew(env: JNIEnv, _: JObject, j_serveruri: JString,
        j_sapling_output: JString, j_sapling_spend: JString) -> jstring {
    let server_uri = CString::from(
        CStr::from_ptr(
            env.get_string(j_serveruri).unwrap().as_ptr()
        )
    ).into_string().unwrap();

    let sapling_output = CString::from(
        CStr::from_ptr(
            env.get_string(j_sapling_output).unwrap().as_ptr()
        )
    ).into_string().unwrap();
    let sapling_spend = CString::from(
        CStr::from_ptr(
            env.get_string(j_sapling_spend).unwrap().as_ptr()
        )
    ).into_string().unwrap();

    let seed = rustlib::init_new(server_uri, sapling_output, sapling_spend);

    let output = env.new_string(seed.as_str()).unwrap();
    output.into_inner()
}


#[no_mangle]
pub unsafe extern fn Java_com_rust_litewalletjni_LiteWalletJni_initfromseed(env: JNIEnv, _: JObject, j_serveruri: JString,
        j_seed: JString, j_birthday: JString, j_sapling_output: JString, j_sapling_spend: JString) -> jstring {
    let server_uri = CString::from(
        CStr::from_ptr(
            env.get_string(j_serveruri).unwrap().as_ptr()
        )
    ).into_string().unwrap();


    let seed = CString::from(
        CStr::from_ptr(
            env.get_string(j_seed).unwrap().as_ptr()
        )
    ).into_string().unwrap();

    let birthday = CString::from(
        CStr::from_ptr(
            env.get_string(j_birthday).unwrap().as_ptr()
        )
    ).into_string().unwrap().parse::<u64>().unwrap();

    let sapling_output = CString::from(
        CStr::from_ptr(
            env.get_string(j_sapling_output).unwrap().as_ptr()
        )
    ).into_string().unwrap();
    let sapling_spend = CString::from(
        CStr::from_ptr(
            env.get_string(j_sapling_spend).unwrap().as_ptr()
        )
    ).into_string().unwrap();

    let seed = rustlib::init_from_seed(server_uri, seed, birthday, sapling_output, sapling_spend);

    let output = env.new_string(seed.as_str()).unwrap();
    output.into_inner()
}


#[no_mangle]
pub unsafe extern fn Java_com_rust_litewalletjni_LiteWalletJni_initfromb64(env: JNIEnv, _: JObject, j_serveruri: JString,
        j_base64: JString, j_sapling_output: JString, j_sapling_spend: JString) -> jstring {
    let base64 = CString::from(
        CStr::from_ptr(
            env.get_string(j_base64).unwrap().as_ptr()
        )
    ).into_string().unwrap();

    let server_uri = CString::from(
        CStr::from_ptr(
            env.get_string(j_serveruri).unwrap().as_ptr()
        )
    ).into_string().unwrap();

    let sapling_output = CString::from(
        CStr::from_ptr(
            env.get_string(j_sapling_output).unwrap().as_ptr()
        )
    ).into_string().unwrap();
    let sapling_spend = CString::from(
        CStr::from_ptr(
            env.get_string(j_sapling_spend).unwrap().as_ptr()
        )
    ).into_string().unwrap();

    let seed = rustlib::init_from_b64(server_uri, base64, sapling_output, sapling_spend);

    let output = env.new_string(seed.as_str()).unwrap();
    output.into_inner()
}

#[no_mangle]
pub unsafe extern fn Java_com_rust_litewalletjni_LiteWalletJni_save(env: JNIEnv, _: JObject) -> jstring {
    let encoded = rustlib::save_to_b64();
    let output = env.new_string(encoded.as_str()).unwrap();
    output.into_inner()
}

#[no_mangle]
pub unsafe extern fn Java_com_rust_litewalletjni_LiteWalletJni_execute(env: JNIEnv, _: JObject, j_command: JString, j_argslist: JString) -> jstring {
    let cmd = CString::from(
        CStr::from_ptr(
            env.get_string(j_command).unwrap().as_ptr()
        )
    ).into_string().unwrap();

    let args_list = CString::from(
        CStr::from_ptr(
            env.get_string(j_argslist).unwrap().as_ptr()
        )
    ).into_string().unwrap();

    let resp = rustlib::execute(cmd, args_list);

    let output = env.new_string(resp.as_str()).unwrap();
    output.into_inner()
}
