#import <Cordova/CDVPlugin.h>

@interface LiteWallet : CDVPlugin

- (void)sync:(CDVInvokedUrlCommand*)command;
- (void)syncStatus:(CDVInvokedUrlCommand*)command;
- (void)rescan:(CDVInvokedUrlCommand*)command;
- (void)clear:(CDVInvokedUrlCommand*)command;
- (void)info:(CDVInvokedUrlCommand*)command;
- (void)encryptionstatus:(CDVInvokedUrlCommand*)command;
- (void)balance:(CDVInvokedUrlCommand*)command;
- (void)notes:(CDVInvokedUrlCommand*)command;
- (void)privateKey:(CDVInvokedUrlCommand*)command;
- (void)newZAddress:(CDVInvokedUrlCommand*)command;
- (void)newTAddress:(CDVInvokedUrlCommand*)command;
- (void)seed:(CDVInvokedUrlCommand*)command;
- (void)send:(CDVInvokedUrlCommand*)command;
- (void)height:(CDVInvokedUrlCommand*)command;
- (void)list:(CDVInvokedUrlCommand*)command;
- (void)encrypt:(CDVInvokedUrlCommand*)command;
- (void)decrypt:(CDVInvokedUrlCommand*)command;
- (void)lock:(CDVInvokedUrlCommand*)command;
- (void)unlock:(CDVInvokedUrlCommand*)command;

- (void)getseedphrase:(CDVInvokedUrlCommand*)command;
- (void)checkseedphrase:(CDVInvokedUrlCommand*)command;
- (void)checkserver:(CDVInvokedUrlCommand*)command;
- (void)initalize:(CDVInvokedUrlCommand*)command;
- (void)newWallet:(CDVInvokedUrlCommand*)command;
- (void)restoreWallet:(CDVInvokedUrlCommand*)command;
- (void)save:(CDVInvokedUrlCommand*)command;
- (void)exists:(CDVInvokedUrlCommand*)command;

@end
