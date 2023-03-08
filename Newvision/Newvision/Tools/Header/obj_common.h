/*
 *  obj_common.h
 *  IpCameraClient
 *
 *  Created by jiyonglong on 12-4-26.
 *  Copyright 2012 __MyCompanyName__. All rights reserved.
 *
 */
#define BUILD_WHO 0


#define STR_MAC "mac"
                  
#define STR_NAME "deviceName"
#define STR_IPADDR "ipaddr"
#define STR_PORT "port"
#define STR_USER "username"
#define STR_PWD "devicePwd"
#define STR_IMG "img"
#define STR_DID "deviceCode" 
#define STR_DEVID "deviceId"
#define STR_PPPP_STATUS "status"
#define STR_SW_STATUS "powerState"
#define STR_PPPP_MODE "ppppmode"
#define STR_AUTHORITY "authority"
#define STR_ALARM "alarm"
#define STR_MODEL  "modal"
#define STR_ISADD  "isadd"



#define OLD_STR_NAME "name"
#define OLD_STR_USER "user"
#define OLD_STR_PWD "pwd"
#define OLD_STR_IMG "img"
#define OLD_STR_DID "did"
#define OLD_STR_PPPP_STATUS "ppppstatus"




#define  USER_ADMIN 3
#define  USER_VISITOR 2
#define  USER_OPERATOR 1
#define  USER_NOTAUTHORITY 0


#define STR_SSID "ssid"
#define STR_MAC "mac"
#define STR_SECURITY "security"
#define STR_DB0 "db0"
#define STR_SIGNAL "signal"
#define STR_CHANNEL "channel"

#define STR_LOCALIZED_FILE_NAME "IpCameraClient"

#define COLOR_BASE_RED  119.0
#define COLOR_BASE_GREEN 119.0
#define COLOR_BASE_BLUE 119.0

#define COLOR_HIGH_LIGHT_RED 120
#define COLOR_HIGH_LIGHT_GREEN 120
#define COLOR_HIGH_LIGHT_BLUE 120

#define COLOR_IMAGEVIEW_RED 255
#define COLOR_IMAGEVIEW_GREEN 160
#define COLOR_IMAGEVIEW_BLUE 0


#define BTN_NORMAL_RED 0
#define BTN_NORMAL_GREEN 0x4e
#define BTN_NORMAL_BLUE 0x93

#define BTN_DONE_RED 0x13
#define BTN_DONE_GREEN 0x45
#define BTN_DONE_BLUE 0x70

#define CELL_SEPERATOR_RED 220
#define CELL_SEPERATOR_GREEN 220
#define CELL_SEPERATOR_BLUE 220

 

typedef struct _STRU_REC_FILE_HEAD
{
    int head;
    int version;
    int videoformat;
    int audioformat;
    int reserved;
    char szosd[44];
    
}STRU_REC_FILE_HEAD, *PSTRU_REC_FILE_HEAD;

typedef struct _STRU_DATA_HEAD
{
    int head;
    int format;
    int dataformat;
    int datalen;
    int timestamp;
    int timezone;
    int devicetime;
    char streamid;
}STRU_DATA_HEAD,*PSTRU_DATA_HEAD;

typedef struct _STU_TM{
    int tm_sec;
    int tm_min;
    int tm_hour;
    int tm_mday;
    int tm_mon;
    int tm_year;
    int tm_wday;
    int tm_yday;
    
}STRU_TM,*PSTRU_TM;

