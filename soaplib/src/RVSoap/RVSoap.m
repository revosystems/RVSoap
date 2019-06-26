//
//  RVSoap.m
//  RVPMS
//
//  Created by Jordi Puigdellívol on 14/4/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVSoap.h"
#import "RVHttp.h"
#import "RVSoapResponseParser.h"
#import "RVCollection.h"

@implementation RVSoap

+(void)call:(RVSoapRequest*)request completion:(void (^)(NSDictionary* result, NSURLResponse* response, NSError* error))completion{
    [RVHttp post:request.url body:[request build] headers:request.headers completion:^(RVHttpResponse *response) {
        
        if (response.error) {
            NSLog(@"Err: %@", response.errorMessage);
            return completion(nil, response.response, response.error);
        }
        
        NSDictionary* result = [request.responseParser parse:response.data action:request.action];
        
        if ( isEqual(result, @"false") ) {
            NSLog(@"Error post: %@", response.errorMessage);
            return completion(nil, response.response, response.error);
        }
        
        NSLog(@"Data: %@", result);
        return completion(result, response.response, nil);
    }];
}

@end
