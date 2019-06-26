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
    return [self.class make:[RVXml build:filename values:nil]];
}

-(NSString*)build{
    NSString* result = [self.xml    replace:@"{{action}}"  with:self.action];
    return             [result      replace:@"{{content}}" with:self.content];
}

-(RVSoapRequest*)withAction:(NSString*)action{
    self.action = action;
    return self;
}

-(RVSoapRequest*)withUrl:(NSString*)url action:(NSString*)action andBody:(NSDictionary*)values{
    self.url = url;
    return [[self withAction:action] withBody:values];
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
