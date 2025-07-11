#import <Foundation/Foundation.h>
#import "RVSoapResponseParser.h"

@interface RVSoapRequest : NSObject

@property(strong,nonatomic) NSDictionary* headers;
@property(strong,nonatomic) NSString* xml;

@property(strong,nonatomic) NSString* action;
@property(strong,nonatomic) NSString* content;
@property(strong,nonatomic) NSString* url;

@property(strong,nonatomic) RVSoapResponseParser* responseParser;


/**
 * Creates a request where body is a xml string. It needs to contain the texts {{action}} and {{content}} that will be replaced with the values
 */
+(RVSoapRequest*)make:(NSString*)body;

/**
 * It creates a new request from the filename.xml. It needs to contain the texts {{action}} and {{content}} that will be replaced with the values
 */
+(RVSoapRequest*)fromTemplate:(NSString*)filename;

/**
 * It creates a new request from an static filename.xml and it replaces the dynamic {{values}}.
 */
+(RVSoapRequest*)fromTemplate:(NSString*)filename withValues:(NSDictionary*)values;


/**
 Generates the request xml to be sent replacing action and content 
 */
-(NSString*)build;

/** 
 Sets the action
 */
-(RVSoapRequest*)withAction:(NSString*)action;

/**
 Sets the url
 */
-(RVSoapRequest*)withUrl:(NSString*)url;

/**
 * Sets the body loaded from a template replacing the values
 */
-(RVSoapRequest*)withBodyTemplate:(NSString*)filename values:(NSDictionary*)values;

/**
 Sets the content autogenerated with the params dict
 */
-(RVSoapRequest*)withBody:(NSDictionary*)params;

/**
 Combines both withAciton and WithBody bunctions
 */
-(RVSoapRequest*)withUrl:(NSString*)url action:(NSString*)action andBody:(NSDictionary*)values;
@end
