//
//  RVSoapResponseParser.m
//  RVPMS
//
//  Created by Pau Benet Prat on 18/04/2017.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVSoapResponseParser.h"
#import "XMLDictionary.h"

@implementation RVSoapResponseParser

- (NSDictionary *) parse:(NSData *) response action:(NSString*) action {
    [NSException raise:@"Should not call the abstract" format:@"Should not call the abstract"];
    return nil;
}

@end
