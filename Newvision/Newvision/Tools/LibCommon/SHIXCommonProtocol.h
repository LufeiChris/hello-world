//
//  SHIXCommonProtocol.h
//  icbbell
//
//  Created by zhaogenghuai on 2018/12/18.
//  Copyright © 2018年 zhaogenghuai. All rights reserved.
//

#ifndef SHIXCommonProtocol_h
#define SHIXCommonProtocol_h
#import <Foundation/Foundation.h>
@protocol SHIXCommonProtocol <NSObject>
@optional

 
#pragma mark--  透传数据回调
- (void) JsonData: (NSString *) json
               DID:(NSString *)did;

- (void) TransData:(Byte*)data length:(int)length DID:(NSString *)did HEAD:(AV_HEAD)t;



@end

#endif /* SHIXCommonProtocol_h */
