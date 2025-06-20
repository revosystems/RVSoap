//
//  RVSoapRequest.m
//  RVPMS
//
//  Created by Jordi Puigdellívol on 14/4/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVSoapRequest.h"
#import "RVCollection.h"
#import "RVXml.h"

@implementation RVSoapRequest

+(RVSoapRequest*)make:(NSString*)body{
    RVSoapRequest* request = [self.class new];
    request.xml            = body;
    request.responseParser = [RVSoapResponseParser new];
    return request;
}

+(RVSoapRequest*)fromTemplate:(NSString*)filename{
    return [self fromTemplate:filename withValues:nil];
}

+(RVSoapRequest*)fromTemplate:(NSString*)filename withValues:(NSDictionary*)values{
    return [self.class make:[RVXml build:filename values:values]];
}

-(NSString*)build{
    NSString* result = self.xml;
    if (self.action != nil) {
        result = [result    replace:@"{{action}}"  with:self.action];
    }
    if (self.content != nil) {
        result = [result    replace:@"{{content}}"  with:self.content];
    }

    return result;
}

-(RVSoapRequest*)withAction:(NSString*)action{
    self.action = action;
    return self;
}

-(RVSoapRequest*)withUrl:(NSString*)url{
    self.url = url;
    return self;
}

-(RVSoapRequest*)withUrl:(NSString*)url action:(NSString*)action andBody:(NSDictionary*)values{
    return [[[self withUrl:url] withAction:action] withBody:values];
}

-(RVSoapRequest*)withBodyTemplate:(NSString*)filename values:(NSDictionary*)values{
    self.content = [RVXml build:filename values:values];
    return self;
}

-(RVSoapRequest*)withBody:(NSDictionary*)params{
    self.content = [params.allKeys reduce:^id(NSString* carry, NSString* paramKey) {
        return str(@"%@<%@>%@</%@>\n", carry, paramKey, params[paramKey], paramKey);
    } carry:@""];
    return self;
}

@end
