//
//  DomainToIP.h
//  onebyoneHealth
//
//  Created by Tempo on 2018/7/26.
//  Copyright © 2018年 CN.QUHWA.TEMPO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DomainToIP : NSObject

/**
 域名解析IP

 @param hostName <#hostName description#>
 @return <#return value description#>
 */
+ (NSString*)queryIpWithDomain:(const NSString*)hostName;

@end
