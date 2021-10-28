package com.litewallet.plugin;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.apache.commons.io.IOUtils;
import android.util.Log;
import android.content.Context;
import android.util.Base64;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.io.InputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import com.rust.litewalletjni.LiteWalletJni;

public class LiteWallet extends CordovaPlugin {
    //Refresh network parameters approx every 15 seconds
    //Fixit: Reduce the number of calls from Skull-Island wallet
    static int iSyncCounter=0;
    static int iInfoCounter=0;
    static int iListCounter=0;
    
    String sSaplingoutput64="";
    String sSaplingspend64="";
    
    @Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {

        Context context = this.cordova.getActivity().getApplicationContext();   
                
          if ((sSaplingoutput64.length()==0) || (sSaplingspend64.length()==0 )) {           
              InputStream saplingOutputFile = getClass().getClassLoader().getResourceAsStream("saplingoutput_base64");                                           
              sSaplingoutput64 = IOUtils.toString(saplingOutputFile, StandardCharsets.ISO_8859_1);
              saplingOutputFile.close();
            
              InputStream saplingSpendFile = getClass().getClassLoader().getResourceAsStream("saplingspend_base64");
              sSaplingspend64 = IOUtils.toString(saplingSpendFile, StandardCharsets.ISO_8859_1);
              saplingSpendFile.close();                         
          }
        }
        catch(Exception e)
        {
          Log.e ("LITEWALLET","execute() load sapling parameters exception\n"+e.toString() );
          e.printStackTrace();
          callbackContext.error("Error: Sapling parameters could not be loaded.");
          return false;
        }
        

        if (action.equals("sync")) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("sync", "")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() sync exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: Sync error");
                  }
                }
            });
            return true;

        } else if (action.equals("syncStatus")) {
            //Throttle back on the nuber of sync requests 
            //FIXIT Reduce the calls in the main thread
            iSyncCounter++;
            if (iSyncCounter<30)
            {              
              callbackContext.success( 0 ); // Thread-safe.
              return true;
            }
            iSyncCounter=0;
            
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("syncstatus", "")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() syncStatus exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: syncStatus error");
                  }
                }
            });
            return true;

        } else if (action.equals("rescan")) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("rescan", "")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() rescan exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: rescan error");
                  }
                }
            });
            return true;

        } else if (action.equals("clear")) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("clear", "")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() clear exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: clear error");
                  }
                }
            });
            return true;

        } else if (action.equals("info")) {        
            //Throttle back on the nuber of info requests -- Must fix in the main code thats calling it
            //all the time
            iInfoCounter++;
            if (iInfoCounter<30)
            {
              callbackContext.success( 0 ); // Thread-safe.
              return true;
            }
            iInfoCounter=0;
            
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("info", "")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() info exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: Request info error");
                  }
                }
            });
            return true;

        } else if (action.equals("encryptionstatus")) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("encryptionstatus", "")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() encryptionstatus exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: encryptionstatus error");
                  }                    
                }
            });

            return true;

        } else if (action.equals("balance")) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("balance", "")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() balance exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: balance error");
                  }                    
                }
            });

            return true;

        } else if (action.equals("notes")) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("notes", "")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() notes exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: notes error");
                  }                     
                }
            });

            return true;

        } else if (action.equals("privateKey")) {
            final String arg1 = data.getString(0);
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("export", arg1)); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() privateKey exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: privateKey error");
                  }                     
                }
            });

            return true;

        } else if (action.equals("newZAddress")) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("new", "z")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() new ZAddress exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: new ZAddress error");
                  }                      
                }
            });

            return true;

        } else if (action.equals("newTAddress")) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("new", "t")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() new TAddress exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: new TAddress error");
                  }                       
                }
            });

            return true;

        } else if (action.equals("seed")) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("seed", "")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() seed exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: seed error");
                  }                    
                }
            });

            return true;

        } else if (action.equals("send")) {
            final String arg1 = data.getString(0);
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("send", arg1)); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() send exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: send error");
                  }                     
                }
            });

            return true;

        } else if (action.equals("height")) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("height", "")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() height exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: height error");
                  }                    
                }
            });

            return true;

        } else if (action.equals("list")) {
            //Throttle back on the nuber of info requests -- Must fix in the main code thats calling it
            //all the time
            iListCounter++;
            if (iListCounter<30)
            {
              callbackContext.success( 0 ); // Thread-safe.
              return true;
            }
            iListCounter=0;
            
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("list", "")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() list exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: list error");
                  }                  
                }
            });

            return true;

        } else if (action.equals("encrypt")) {
            final String arg1 = data.getString(0);
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("encrypt", arg1)); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() encrypt exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: encrypt error");
                  }                      
                }
            });

            return true;

        } else if (action.equals("decrypt")) {
            final String arg1 = data.getString(0);
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("decrypt", arg1)); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() decrypt exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: decrypt error");
                  }                      
                }
            });

            return true;

        } else if (action.equals("lock")) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("lock", "")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() lock exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: lock error");
                  }
                }
            });

            return true;

        } else if (action.equals("unlock")) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.execute("unlock", "")); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() unlock exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: unlock error");
                  }                    
                }
            });
            return true;

        } else if (action.equals("save")) {
            final String arg1 = data.getString(0);
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                    boolean saved = LiteWalletJni.walletSave(arg1, context);
                    String jsonText = new String();
                    JSONObject obj = new JSONObject();
                    try {
                        obj.put("saved", saved);
                        jsonText = obj.toString();
                    } catch (JSONException e) {
                        e.printStackTrace();
                        callbackContext.success("Error: JSON error!!!");
                    }
                    callbackContext.success(jsonText); // Thread-safe.
                }
            });
            return true;

        } else if (action.equals("getseedphrase")) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.getseedphrase()); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() getseedphrase exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: getseedphrase error");
                  }                      
                }
            });

            return true;

        } else if (action.equals("checkseedphrase")) {
            final String arg1 = data.getString(0);
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                    callbackContext.success(LiteWalletJni.checkseedphrase(arg1)); // Thread-safe.
                  } catch (Exception e) {
                    Log.e ("LITEWALLET","execute() checkseedphrase exception\n"+e.toString() );
                    e.printStackTrace();
                    callbackContext.error("Error: checkseedphrase error");
                  }                     
                }
            });

            return true;

        } else if (action.equals("exists")) {
            final String arg1 = data.getString(0);
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                    boolean exists = LiteWalletJni.walletExists(arg1, context);
                    String jsonText = new String();
                    JSONObject obj = new JSONObject();
                    try {
                        obj.put("exists", exists);
                        jsonText = obj.toString();
                    } catch (JSONException e) {
                        e.printStackTrace();
                        callbackContext.success("Error: JSON error!!!");
                    };
                    callbackContext.success(jsonText); // Thread-safe.
                }
            });
            return true;

        } else if (action.equals("initalize")) {            
            final String arg1 = data.getString(0);
            final String arg2 = data.getString(1);
            final String arg3 = data.getString(2);
            
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                      if ((sSaplingoutput64.length()==0) || (sSaplingspend64.length()==0 )) {           
                          InputStream saplingOutputFile = getClass().getClassLoader().getResourceAsStream("saplingoutput_base64");
                          sSaplingoutput64 = IOUtils.toString(saplingOutputFile, StandardCharsets.ISO_8859_1);
                          saplingOutputFile.close();
                          
                          InputStream saplingSpendFile = getClass().getClassLoader().getResourceAsStream("saplingspend_base64");
                          sSaplingspend64 = IOUtils.toString(saplingSpendFile, StandardCharsets.ISO_8859_1);
                          saplingSpendFile.close();                         
                      }
                      callbackContext.success(LiteWalletJni.initalize(arg1, arg2, arg3, sSaplingoutput64, sSaplingspend64, context));
                  }
                  catch(Exception e) {
                      Log.e ("LITEWALLET","execute() initalize exception\n"+e.toString() );
                      e.printStackTrace();
                      callbackContext.error("Error: Wallet initialzation error!!!");
                  }
                }
            });

            return true;

        } else if (action.equals("newWallet")) {
            final String arg1 = data.getString(0);
            final String arg2 = data.getString(1);

            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                  try {
                      if ((sSaplingoutput64.length()==0) || (sSaplingspend64.length()==0 )) {           
                          InputStream saplingOutputFile = getClass().getClassLoader().getResourceAsStream("saplingoutput_base64");
                          sSaplingoutput64 = IOUtils.toString(saplingOutputFile, StandardCharsets.ISO_8859_1);
                          saplingOutputFile.close();
                          
                          InputStream saplingSpendFile = getClass().getClassLoader().getResourceAsStream("saplingspend_base64");
                          sSaplingspend64 = IOUtils.toString(saplingSpendFile, StandardCharsets.ISO_8859_1);
                          saplingSpendFile.close();                         
                      }
                      callbackContext.success(LiteWalletJni.walletNew(arg1, arg2, sSaplingoutput64, sSaplingspend64, context));
                  }
                  catch(Exception e) {
                      Log.e ("LITEWALLET","execute() newWallet exception\n"+e.toString() );
                      e.printStackTrace();
                      callbackContext.error("Error: New wallet error!!!");
                  }
                }
            });
            return true;

        } else if (action.equals("restoreWallet")) {
            final String arg1 = data.getString(0);
            final String arg2 = data.getString(1);
            final String arg3 = data.getString(2);
            final String arg4 = data.getString(3);
            
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                    try {
                        if ((sSaplingoutput64.length()==0) || (sSaplingspend64.length()==0 )) {           
                            InputStream saplingOutputFile = getClass().getClassLoader().getResourceAsStream("saplingoutput_base64");
                            sSaplingoutput64 = IOUtils.toString(saplingOutputFile, StandardCharsets.ISO_8859_1);
                            saplingOutputFile.close();
                          
                            InputStream saplingSpendFile = getClass().getClassLoader().getResourceAsStream("saplingspend_base64");
                            sSaplingspend64 = IOUtils.toString(saplingSpendFile, StandardCharsets.ISO_8859_1);
                            saplingSpendFile.close();                         
                        }
                        callbackContext.success(LiteWalletJni.walletRestore(arg1, arg2, arg3, arg4, sSaplingoutput64, sSaplingspend64, context)); // Thread-safe.
                    }
                    catch(Exception e) {
                      Log.e ("LITEWALLET","execute() restoreWallet exception\n"+e.toString() );
                      e.printStackTrace();
                      callbackContext.error("Error: Restore wallet error!!!");
                    }
                }
            });
            return true;

        } else {
            Log.e ("LITEWALLET","execute() Unsupported action: "+action); 
            return false;
        }
    }
}
