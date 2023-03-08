//
//  DomainToIP.m
//  onebyoneHealth
//
//  Created by Tempo on 2018/7/26.
//  Copyright © 2018年 CN.QUHWA.TEMPO. All rights reserved.
//

#import "DomainToIP.h"

//域名转IP
#include <sys/types.h>
#include <sys/socket.h>

#include <arpa/inet.h>
#include <netdb.h>
//获取IP
#include <arpa/inet.h>
#include <netdb.h>
#include <net/if.h>
#include <ifaddrs.h>
#import <dlfcn.h>
#import <SystemConfiguration/SystemConfiguration.h>


@implementation DomainToIP

//域名转换IP
+ (NSString *)queryIpWithDomain:(const NSString*)hostName {
    
    
    
    const char *hostN= [hostName UTF8String];
    struct hostent* phot;
    @try {
        phot = gethostbyname(hostN);
    } @catch (NSException *exception) {
        
        return nil;
    }
    struct in_addr ip_addr;
    if (phot == NULL) {
        NSLog(@"获取失败");
        return nil;
    }
    memcpy(&ip_addr, phot->h_addr_list[0], 4);
    char ip[20] = {0}; inet_ntop(AF_INET, &ip_addr, ip, sizeof(ip));
    NSString* strIPAddress = [NSString stringWithUTF8String:ip];
//    MYLog(@"%@...ip=====%@",self,strIPAddress);
    return strIPAddress;
    
}

@end
