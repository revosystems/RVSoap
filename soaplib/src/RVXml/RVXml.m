//
//  RVXml.m
//  RVPMS
//
//  Created by Jordi Puigdellívol on 14/4/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVXml.h"
#import "RVCollection.h"

@implementation RVXml

+(NSString*)build:(NSString*)filename values:(NSDictionary*)values{
    NSString *path  = [[NSBundle mainBundle] pathForResource:filename ofType:@"xml"];
    NSString *xml   = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    return [self.class parse:xml values:values];
}


+(NSString*)parse:(NSString*)xml values:(NSDictionary*)values{
    __block NSString* result = xml;
    [values each:^(NSString* key, NSString* value) {
        result = [result replace:str(@"{{%@}}",key) with:value];
    }];
    return result;
}
@end
