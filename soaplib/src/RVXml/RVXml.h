//
//  RVXml.h
//  RVPMS
//
//  Created by Jordi Puigdellívol on 14/4/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RVXml : NSObject

+(NSString*)build:(NSString*)filename values:(NSDictionary*)values;

@end
