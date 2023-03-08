//
//  QHMQTTManager.m
//  QuhwaMqttSmartHome
//
//  Created by Tyson on 2020/3/4
//  Copyright © 2020 Tisoon. All rights reserved.
//

#import "QHMQTTManager.h"
#import "DomainToIP.h"

static NSInteger mqttPort = 1883;
#define kFamilySubscriptionsSuccess @"kFamilySubscriptionsSuccess"
#define kRegloginSubscriptionsSuccess @"kRegloginSubscriptionsSuccess"
#define kMQTTSessionManagerStateConnected @"kMQTTSessionManagerStateConnected"
#define kReceiveMqttMessage @"kReceiveMqttMessage"
//mqtt服务器IP，将你要切换的服务器类型宏后面置为真(即>0即可),其余为假(置为0)
//#define DevelopSever    1 //内网测试
//#define TestSever       0 //预发布测试
//#define ProductSever    0 //正式
//
//#if DevelopSever //内网测试
//    static NSString *mqttIp = @"192.156.1.10";
//    static NSString *mqttUser = @"admin";
//    static NSString *mqttPass = @"123456";
//#elif TestSever //预发布测试
//    static NSString *mqttIp = @"192.156.1.11";
//    static NSString *mqttUser = @"admin";
//    static NSString *mqttPass = @"123456";
//#elif ProductSever //正式
//    static NSString *mqttIp = @"mqtt.quhwa.cn";
//    static NSString *mqttUser = @"quhwa";
//    static NSString *mqttPass = @"quhwa1516";
//#endif
//       测试：192.156.1.10   1883  admin  123456
//       正式：mqtt.tilvision.net  34.218.168.23  1883  quhwa quhwa1516
#define mqttIp @"mqtt.tilvision.net"

#define mqttUser @"quhwa"

#define mqttPass @"quhwa1516"

//发布主题

static NSString * kPublishTopic = @"tilvision/device/%@/sub";

static QHMQTTManager *qhManager = nil;

MQTTSessionManager *manager;

@implementation QHMQTTManager

+ (QHMQTTManager *)shareManager {
    
    if (qhManager == nil) {
        qhManager = [[QHMQTTManager alloc] init];
    }
    return qhManager;
}

- (void)connectServersWithClientID:(NSString *)clientID {
    
    
    
    /*
     * MQTTClient: create an instance of MQTTSessionManager once and connect
     * will is set to let the broker indicate to other subscribers if the connection is lost
     */
//    mqttIp = [DomainToIP queryIpWithDomain:mqttIp];
    
    
    
    
    if (manager.state == MQTTSessionManagerStateConnected) {
        NSLog(@"...MQTTSessionManagerStateConnected 已是连接状态");
        //MQTT连接通知
        [[NSNotificationCenter defaultCenter] postNotificationName:kMQTTSessionManagerStateConnected object:nil];
        return;
    }
    
    
    if (!manager) {
        
//       测试：192.156.1.10   1883  admin  123456
//       正式：mqtt.tilvision.net  34.218.168.23  1883  quhwa quhwa1516
        manager = [[MQTTSessionManager alloc] init];
        [manager connectTo:[DomainToIP queryIpWithDomain:mqttIp]
                           port:mqttPort
                            tls:false
                      keepalive:60  //心跳间隔不得大于120s
                          clean:false
                           auth:true
                           user:mqttUser
                           pass:mqttPass
                           will:false
                      willTopic:nil
                        willMsg: nil
                        willQos:MQTTQosLevelAtMostOnce
                 willRetainFlag:false
                   withClientId:clientID];
        
        
        manager.delegate = self;
        
        
        
        //添加MQTT连接状态观察者
        [manager addObserver:self
                       forKeyPath:@"state"
                          options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                          context:nil];
        
        
        
    } else {
        
        [manager connectToLast];
        
    }
   
}



#pragma mark - 监听连接状态
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    
    
    switch (manager.state) {
        case MQTTSessionManagerStateClosed:
            
//            globalVal.deviceState = 2;
            NSLog(@"连接已经关闭");
            break;
        case MQTTSessionManagerStateClosing:
            
            NSLog(@"连接正在关闭");
            break;
        case MQTTSessionManagerStateConnected:
        {
            
//            globalVal.deviceState = 1;
            NSLog(@"连接成功==============connected as %@",[UIDevice currentDevice].name);
            //MQTT连接通知
            [[NSNotificationCenter defaultCenter] postNotificationName:kMQTTSessionManagerStateConnected object:nil];
 
        }
            break;
        case MQTTSessionManagerStateConnecting:
//            globalVal.deviceState = 3;
            NSLog(@"正在连接中");
            break;
        case MQTTSessionManagerStateError:
            
            NSLog(@"error");
            break;
        case MQTTSessionManagerStateStarting:
        default:
            
            NSLog(@"开始连接");
            break;
    }
    
    
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)connectAction {
    /*
     * MQTTClient: connect to same broker again
     */
    
    [manager connectToLast];
    
}

- (void)disconnectServers {
    /*
     * MQTTClient: send goodby message and gracefully disconnect
     */
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    [manager disconnect];
    
    [manager removeObserver:self forKeyPath:@"state"];
    manager = nil;
    
}

- (void)setManagerNil {
//    manager = nil;
//    [manager removeObserver:self forKeyPath:@"state"];


}

//解除订阅
- (void)UnSubscribeToTopicWithTopicsDic:(NSDictionary *)topicsDic {
    
    manager.subscriptions = topicsDic;
    
}

//订阅
- (void)SubscribeToTopicWithTopicsDic:(NSDictionary *)topicsDic {
    manager.subscriptions = topicsDic;
    
}

#pragma mark - 发送消息
- (void)sendMessageWithMessageDic:(NSDictionary *)dic CLIENTID:(NSString *)clientId{
    
    /*
     * MQTTClient: send data to broker
     */
    //发送消息 返回值msgid大于0代表发送成功
    UInt16 msgid = [manager sendData:[[self convertToJsonStr:dic] dataUsingEncoding:NSUTF8StringEncoding]
                                    topic:[NSString stringWithFormat:@"tilvision/device/%@/sub",clientId]//发布主题
                                      qos:MQTTQosLevelAtMostOnce
                                   retain:FALSE];
    
    if (msgid > 0) {
        NSLog(@"==消息已发送");
    }
    
    
    
}

-(NSString *)convertToJsonStr:(NSDictionary *)dict

{

    NSError *error;

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];

    NSString *jsonString;

    if (!jsonData) {

        NSLog(@"%@",error);

    }else{

        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];

    }

    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];

    NSRange range = {0,jsonString.length};

    //去掉字符串中的空格

    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];

    NSRange range2 = {0,mutStr.length};

    //去掉字符串中的换行符

    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];

    return mutStr;

}


#pragma mark - MQTTSessionManagerDelegate
- (void)handleMessage:(NSData *)data onTopic:(NSString *)topic retained:(BOOL)retained {
    /*
     * MQTTClient: process received message
     */
    
    if ([topic rangeOfString:@"digihome/app/family/"].location != NSNotFound) { //家庭主题消息
        NSArray *arr = [topic componentsSeparatedByString:@"/"];
//        if (arr.count >= 4 && [arr[3] intValue] != selectedFamilyId) { //不在App当前家庭
//            MYLog(@"返回消息家庭ID=%@，不在App当前家庭",arr[3]);
//            return;
//        }
    }
    
    
    
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"===MQTT接收：%@",dataString);
    
    NSDictionary *dic = [self dictionaryWithJsonString:dataString];
    if ([[dic allKeys] containsObject:@"clientId"]) {
//        receiveClientId = dic[@"clientId"];
//        if (![receiveClientId isEqualToString:kUserId]) {
//            [self performSelector:@selector(receiveClientIdClean) withObject:nil afterDelay:0.1];
//        }
    }
    
    
    
    
    NSMutableDictionary *mutdic = [[NSMutableDictionary alloc] init];
    [mutdic setDictionary:dic];
    [mutdic setObject:topic forKey:@"topic"];
    //发送接收消息通知
    [[NSNotificationCenter defaultCenter] postNotificationName:kReceiveMqttMessage object:nil userInfo:mutdic];
    NSString * api = dic[@"api"];
    
    if ([api isEqualToString:@"unbindUser"]) {
        
//        if (!globalVal.isSelfDelete) {
//
//
//
//            BOOL b = [[NSUserDefaults standardUserDefaults] boolForKey:@"isShowCallInView"];
//
//            if (b) {
//                return;
//            }
//
//
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginNotification" object:nil];
//            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:GetString(@"insufficient_permissions") message:GetString(@"re_share_Alert") delegate:nil cancelButtonTitle:nil otherButtonTitles:GetString(@"device_upgrade_got"), nil];
//
//            [alert show];
//
//        }
        
//        globalVal.isSelfDelete = 0;
        
        
        
        
    }
    
    
    
    NSLog(@"===MQTT接收：%@",mutdic);
    
    
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }

    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(dic.allKeys.count == 0)
    {
        return nil;
    }
    return dic;
}

- (void)receiveClientIdClean {
//    receiveClientId = nil;
}

@end


