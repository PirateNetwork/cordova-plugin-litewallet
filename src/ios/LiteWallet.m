#include "LiteWallet.h"
#include "rust.h"
#import <Cordova/CDVPlugin.h>
@implementation LiteWallet

- (void)sync:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"sync" UTF8String];
        char *cmdArg = (char*)[@"" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");

        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)syncStatus:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"syncstatus" UTF8String];
        char *cmdArg = (char*)[@"" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");

        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)syncStop:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"stop" UTF8String];
        char *cmdArg = (char*)[@"" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");

        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)rescan:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"rescan" UTF8String];
        char *cmdArg = (char*)[@"" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)clear:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"clear" UTF8String];
        char *cmdArg = (char*)[@"" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)info:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"info" UTF8String];
        char *cmdArg = (char*)[@"" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)encryptionstatus:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"encryptionstatus" UTF8String];
        char *cmdArg = (char*)[@"" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)balance:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"balance" UTF8String];
        char *cmdArg = (char*)[@"" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)notes:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"notes" UTF8String];
        char *cmdArg = (char*)[@"" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)privateKey:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"privateKey" UTF8String];
        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);

        NSString* arg = [[command arguments] objectAtIndex:0];
        char *cmdArg = (char*)[arg UTF8String];
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)newZAddress:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"new" UTF8String];
        char *cmdArg = (char*)[@"z" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)newTAddress:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"new" UTF8String];
        char *cmdArg = (char*)[@"t" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)seed:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"seed" UTF8String];
        char *cmdArg = (char*)[@"" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)send:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"send" UTF8String];
        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);

        NSString* arg = [[command arguments] objectAtIndex:0];
        char *cmdArg = (char*)[arg UTF8String];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)height:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"height" UTF8String];
        char *cmdArg = (char*)[@"" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)list:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"list" UTF8String];
        char *cmdArg = (char*)[@"" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)encrypt:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"encrypt" UTF8String];
        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);

        NSString* arg = [[command arguments] objectAtIndex:0];
        char *cmdArg = (char*)[arg UTF8String];

        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)decrypt:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"decrypt" UTF8String];
        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);

        NSString* arg = [[command arguments] objectAtIndex:0];
        char *cmdArg = (char*)[arg UTF8String];
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)lock:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"lock" UTF8String];
        char *cmdArg = (char*)[@"" UTF8String];

        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)unlock:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command

        char *executeCmd = (char*)[@"unlock" UTF8String];
        NSString *cmd = [NSString stringWithUTF8String:executeCmd];
        NSLog(@"Executing Command %@", cmd);

        NSString* arg = [[command arguments] objectAtIndex:0];
        char *cmdArg = (char*)[arg UTF8String];
        NSString* resultMsg = [NSString stringWithUTF8String:execute(executeCmd, cmdArg)];
        NSLog(@"Command complete");
        //rust_free(executeCmd);
        //rust_free(cmdArg);

        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)getseedphrase:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        NSLog(@"Executing Command getseedphrase");
        NSString* resultMsg = [NSString stringWithUTF8String:getseedphrase()];
        NSLog(@"Command complete");
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)checkseedphrase:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command
        NSLog(@"Executing Command seed");
        char *seed = (char*)[[[command arguments] objectAtIndex:0] UTF8String];
        NSString* resultMsg = [NSString stringWithUTF8String:checkseedphrase(seed)];
        NSLog(@"Command complete");
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)checkserver:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        //Execute command
        NSLog(@"Executing Command checkserver");
        char *uri = (char*)[[[command arguments] objectAtIndex:0] UTF8String];
        NSString* resultMsg = [NSString stringWithUTF8String:checkserver(uri)];
        NSLog(@"Command complete");
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)initalize:(CDVInvokedUrlCommand*)command
{
    // Check command.arguments here.
    [self.commandDelegate runInBackground:^{
        NSLog(@"Executing Command initfromb64");
        //Get variables from the JS front end
        NSString* coin = [[command arguments] objectAtIndex:0];
        NSString* serverUri = [[command arguments] objectAtIndex:1];

        //Load param files
        NSString* outputpath = [[NSBundle mainBundle] pathForResource:@"saplingoutput_base64" ofType:@""];
        NSString* sapling_output = [NSString stringWithContentsOfFile:outputpath encoding:NSUTF8StringEncoding error:NULL];
        NSString* spendpath = [[NSBundle mainBundle] pathForResource:@"saplingspend_base64" ofType:@""];
        NSString* sapling_spend = [NSString stringWithContentsOfFile:spendpath encoding:NSUTF8StringEncoding error:NULL];

        //Check the file system for the folder needed
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        NSString* savePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString* walletPath = [savePath stringByAppendingPathComponent:@"/wallets/"];

        //Get the name of the coin for the wallet.dat file name and check if it exists
        NSString* coinFile = [coin stringByAppendingString:@"wallet.dat"];
        NSString* walletFile = [walletPath stringByAppendingString:coinFile];

        //Check if wallet file exist
        BOOL isDir;
        if (![fileManager fileExistsAtPath:walletFile isDirectory:&isDir] || isDir) {
              NSString* resultMsg = @"{\"initalized\": false,\"error\": \"file not found\"}";
              CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
              [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
              return;
        }

        //Get the base64 wallet string from the save wallet.dat
        NSData *data = [fileManager contentsAtPath:walletFile];
        NSString *b64Wallet = [data base64EncodedStringWithOptions:0];

        //Cast to C-String
        char *saplingOutputRust = (char*)[sapling_output UTF8String];
        char *saplingSpendRust = (char*)[sapling_spend UTF8String];
        char *serverUriRust = (char*)[serverUri UTF8String];
        char *b64WalletRust = (char*)[b64Wallet UTF8String];

        //Pass to rust
        NSString* output = [NSString stringWithUTF8String:initfromb64(serverUriRust, b64WalletRust, saplingOutputRust, saplingSpendRust)];
        NSLog(@"Command complete");
        //cleanup
        //rust_free(saplingOutputRust);
        //rust_free(saplingSpendRust);
        //rust_free(serverUriRust);
        //rust_free(b64WalletRust);

        //Return the result to cordova
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:output];
        // The sendPluginResult method is thread-safe.
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)newWallet:(CDVInvokedUrlCommand*)command
{
    // Check command.arguments here.
    [self.commandDelegate runInBackground:^{
        //Get variables from the JS front end
        NSString* serverUri = [[command arguments] objectAtIndex:0];

        //Load param files
        NSString* outputpath = [[NSBundle mainBundle] pathForResource:@"saplingoutput_base64" ofType:@""];
        NSString* sapling_output = [NSString stringWithContentsOfFile:outputpath encoding:NSUTF8StringEncoding error:NULL];
        NSString* spendpath = [[NSBundle mainBundle] pathForResource:@"saplingspend_base64" ofType:@""];
        NSString* sapling_spend = [NSString stringWithContentsOfFile:spendpath encoding:NSUTF8StringEncoding error:NULL];

        //Cast to C-String
        char *saplingOutputRust = (char*)[sapling_output UTF8String];
        char *saplingSpendRust = (char*)[sapling_spend UTF8String];
        char *serverUriRust = (char*)[serverUri UTF8String];

        //Pass to rust
        NSLog(@"Executing Command initnew");
        NSString* output = [NSString stringWithUTF8String:initnew(serverUriRust, saplingOutputRust, saplingSpendRust)];
        NSLog(@"Command complete");
        //cleanup
        //rust_free(saplingOutputRust);
        //rust_free(saplingSpendRust);
        //rust_free(serverUriRust);

        //Return the result to cordova
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:output];
        // The sendPluginResult method is thread-safe.
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)restoreWallet:(CDVInvokedUrlCommand*)command
{
    // Check command.arguments here.
    [self.commandDelegate runInBackground:^{
        //Get variables from the JS front end
        NSString* serverUri = [[command arguments] objectAtIndex:0];
        NSString* seed = [[command arguments] objectAtIndex:1];
        NSString* birthday = [[command arguments] objectAtIndex:2];

        //Load param files
        NSString* outputpath = [[NSBundle mainBundle] pathForResource:@"saplingoutput_base64" ofType:@""];
        NSString* sapling_output = [NSString stringWithContentsOfFile:outputpath encoding:NSUTF8StringEncoding error:NULL];
        NSString* spendpath = [[NSBundle mainBundle] pathForResource:@"saplingspend_base64" ofType:@""];
        NSString* sapling_spend = [NSString stringWithContentsOfFile:spendpath encoding:NSUTF8StringEncoding error:NULL];

        //Cast to C-String
        char *saplingOutputRust = (char*)[sapling_output UTF8String];
        char *saplingSpendRust = (char*)[sapling_spend UTF8String];
        char *serverUriRust = (char*)[serverUri UTF8String];
        char *seedRust = (char*)[seed UTF8String];
        char *birthdayRust = (char*)[birthday UTF8String];

        //Pass to rust
        NSLog(@"Executing Command initfromseed");
        NSString* output = [NSString stringWithUTF8String:initfromseed(serverUriRust, seedRust, birthdayRust, saplingOutputRust, saplingSpendRust)];
        NSLog(@"Command complete");
        //cleanup
        //rust_free(saplingOutputRust);
        //rust_free(saplingSpendRust);
        //rust_free(serverUriRust);
        //rust_free(seedRust);
        //rust_free(birthdayRust);

        //Return the result to cordova
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:output];
        // The sendPluginResult method is thread-safe.
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}


- (void)save:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        NSLog(@"Executing Command save");
        //Get the current full wallet as a string
        NSString* wallet = [NSString stringWithUTF8String:save()];

        //convert string to NSData
        NSData *data = [[NSData alloc] initWithBase64EncodedString:wallet options:0];

        //Check the file system for the folder needed
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        NSString* savePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString* walletPath = [savePath stringByAppendingPathComponent:@"/wallets/"];

        //Check if wallet folder exist, create if it doesn't
        BOOL isDir;
        if (![fileManager fileExistsAtPath:walletPath  isDirectory:&isDir]) {
            if(![fileManager createDirectoryAtPath:walletPath withIntermediateDirectories:NO attributes:nil error:NULL]) {
                //save failed
                NSString* resultMsg = @"{\"save\": false}";
                CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
                [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
                return;
            }
        }

        //Get the name of the coin for the wallet.dat file name and check if it exists
        NSString* coin = [[command arguments] objectAtIndex:0];
        NSString* coinFile = [coin stringByAppendingString:@"wallet.dat"];
        NSString* walletFile = [walletPath stringByAppendingString:coinFile];

        //Write file
        NSError *error = nil;
        if (![data writeToFile:walletFile options:NSDataWritingAtomic error:&error]) {
            //Save failed
            NSString* resultMsg = @"{\"save\": false}";
            CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
            return;
        }

        //Return to front-end save completed successfully
        NSString* resultMsg = @"{\"save\": true}";
        NSLog(@"Command complete");
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)exists:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        NSLog(@"Executing Command exists");
        //Check the file system for the folder needed
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        NSString* savePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString* walletPath = [savePath stringByAppendingPathComponent:@"/wallets/"];

        //Get the name of the coin for the wallet.dat file name and check if it exists
        NSString* coin = [[command arguments] objectAtIndex:0];
        NSString* coinFile = [coin stringByAppendingString:@"wallet.dat"];
        NSString* walletFile = [walletPath stringByAppendingString:coinFile];

        //Check if wallet folder exist, create if it doesn't
        BOOL isDir;
        if (![fileManager fileExistsAtPath:walletFile isDirectory:&isDir] || isDir) {
              NSString* resultMsg = @"{\"exists\": false}";
              CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
              [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
              return;
        }

        //Return to front-end save completed successfully
        NSString* resultMsg = @"{\"exists\": true}";
        NSLog(@"Command complete");
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMsg];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

@end
