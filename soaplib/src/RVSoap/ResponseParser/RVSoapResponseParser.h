//
//  RVSoapResponseParser.h
//  RVPMS
//
//  Created by Pau Benet Prat on 18/04/2017.
//  Copyright © 2017 Revo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RVSoapResponseParser : NSObject

- (NSDictionary *) parse:(NSData *) response action:(NSString*) action;

@end
