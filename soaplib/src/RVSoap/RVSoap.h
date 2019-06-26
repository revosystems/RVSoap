//
//  RVSoap.h
//  RVPMS
//
//  Created by Jordi Puigdellívol on 14/4/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RVSoapRequest.h"

@interface RVSoap : NSObject

+(void)call:(RVSoapRequest*)request completion:(void (^)(NSDictionary* result, NSURLResponse* response, NSError* error))completion;
@end
