//
//  QHMQTTManager.h
//  QuhwaMqttSmartHome
//
//  Created by Tyson on 2020/3/4.
//  Copyright © 2020 Tisoon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MQTTClient.h"
#import "MQTTSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface QHMQTTManager : NSObject <MQTTSessionManagerDelegate,MQTTSessionDelegate,UITextFieldDelegate> 

/**
 创建QHMQTT管理者

 @return <#return value description#>
 */
+ (QHMQTTManager *)shareManager;


/// 连接MQTT服务器
/// @param celintID <#celintID description#>
- (void)connectServersWithClientID:(NSString *)celintID;

/// 断开MQTT服务器连接
- (void)disconnectServers;

/// 订阅
/// @param topicsDic <#topicsDic description#>
- (void)SubscribeToTopicWithTopicsDic:(NSDictionary *)topicsDic;

/**
 发送消息

 @param dic <#dic description#>
 */
- (void)sendMessageWithMessageDic:(NSDictionary *)dic CLIENTID:(NSString *)clientId;




@end


NS_ASSUME_NONNULL_END
