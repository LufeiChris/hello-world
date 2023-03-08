//
//  common.h
//  common
//
//  Created by zhaogenghuai on 2019/6/13.
//  Copyright © 2019年 zhaogenghuai. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface common : NSObject

+ (void)convertFormat:(NSString *)path ToPath:(NSString *)toPath;

+ (void)convertBFormat:(NSString *)path ToPath:(NSString *)toPath;

+ (void)MQTTConnect;

@end
