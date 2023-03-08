
#ifndef _DEFINE_H_
#define _DEFINE_H_

//#define TEST_APP


#ifndef _DEF_STRU_AV_HEAD
#define _DEF_STRU_AV_HEAD
typedef struct tag_AV_HEAD
{
    //    unsigned int           startcode;    //  0xa815aa55
    //    char                type;
    //    char              streamid;
    //    unsigned short     militime;    //  diff time
    //    unsigned int         sectime;    //  diff time
    //    unsigned int        frameno;    //  frameno
    //    unsigned int         len;            //  data len
    //    unsigned char        version;        // version
    //    unsigned char        sessid;
    //    unsigned char        other[2];
    //    unsigned int        nowframe;
    //    unsigned int        allframe;
    
    unsigned int     startcode; //  0xa815aa55
    char    type;       //0:I frame 1:p frame
    char         streamid;   //0:video  1:audio
    unsigned short      militime;
    unsigned int   sectime;
    unsigned int     frameno;
    unsigned int   len;
    unsigned char  version; //
    unsigned char  resolution;//0:640*480 1:320*240 3:1080*720 4:1920*1080
    unsigned char  sessid;
    unsigned char  currsit;
    unsigned char  endflag;
    char    byzone;
    char                framerate;
    unsigned char       other;
    unsigned int        totalFrame;
    
}AV_HEAD,*PAV_HEAD;
#endif

#define MAX_FRAME_LENGTH 209715200 //200 * 1024 * 1024 ; 200KB
#define MAX_AUDIO_DATA_LENGTH 2048

typedef enum tag_ENUM_FRAME_TYPE
{
    ENUM_FRAME_TYPE_I = 0,
    ENUM_FRAME_TYPE_P = 1,
    ENUM_FRAME_TYPE_MJPEG = 3
}ENUM_FRAME_TYPE;

typedef enum {    MEDIA_CODEC_UNKNOWN            = 0x00,
    MEDIA_CODEC_VIDEO_MPEG4        = 0x4C,
    MEDIA_CODEC_VIDEO_H263        = 0x4D,
    MEDIA_CODEC_VIDEO_H264        = 0x4E,
    MEDIA_CODEC_VIDEO_MJPEG        = 0x4F,
    MEDIA_CODEC_VIDEO_HEVC      = 0x50,
    MEDIA_CODEC_AUDIO_AAC       = 0x88,   // 2014-07-02 add AAC audio codec definition
    MEDIA_CODEC_AUDIO_G711U     = 0x89,   //g711 u-law
    MEDIA_CODEC_AUDIO_G711A     = 0x8A,   //g711 a-law
    MEDIA_CODEC_AUDIO_ADPCM     = 0X8B,
    MEDIA_CODEC_AUDIO_PCM        = 0x8C,
    MEDIA_CODEC_AUDIO_SPEEX        = 0x8D,
    MEDIA_CODEC_AUDIO_MP3        = 0x8E,
    MEDIA_CODEC_AUDIO_G726      = 0x8F,}ENUM_CODECID;

typedef enum tag_ENUM_VIDEO_MODE
{
    ENUM_VIDEO_MODE_MJPEG,
    ENUM_VIDEO_MODE_H264,
    ENUM_VIDEO_MODE_UNKNOWN
}ENUM_VIDEO_MODE;


typedef enum tag_ENUM_H264_H265
{
    ENUM_FRAME_TYPE_H264 = 0,
    ENUM_FRAME_TYPE_H265 = 1
}ENUM_H264_H265;



typedef enum tag_ENUM_STREAM
{
    ENUM_STREAM_MAIN_H264 = 0,
    ENUM_STREAM_SUB_H264 = 1,
    ENUM_STREAM_MAIN_JPEG = 2,
    ENUM_STREAM_SUB_JPEG = 3,
    ENUM_STREAM_RECORD = 4,
    ENUM_STREAM_MOBILE = 10,
}ENUM_STRAM;

const int MSG_TYPE_CONNECT_FAILED = 0;  /* ����ʧ�� */
const int MSG_TYPE_INIT_NET_ERROR = 1;  /* ��ʼ������ʧ�� */
const int MSG_TYPE_SEND_ERROR = 2; /* ����ʧ�� */
const int MSG_TYPE_RECV_ERROR = 3; /* ����ʧ�� */


/* ���ӳ�ʱʱ��(��) */
#define CONNECT_TIME_OUT   10

/* Select ʱ�� */
#define SELECT_TIME_OUT    10

/* Select ����������������Ͽ� */
#define MAX_SELECT_TIME     20

#define VIDEO_HEAD_VALUE 0xFF00FF

//��Ƶ�����У�ÿ����Ƶ���ݵ�ͷ��
struct VIDEO_BUF_HEAD
{
    //    unsigned int head; /* ͷ���������0xFF00FF */
    //    unsigned int timestamp; //ʱ����������¼������¼���ʱ����������ʵʱ��Ƶ����Ϊ0
    //    unsigned int sectime;
    //    unsigned int len;    /*����*/
    //    unsigned int frametype;
    //    unsigned int timezone;
    //    unsigned int devicetime;
    //    unsigned int datetype;
    //    unsigned int frameno;
    
    
//    unsigned int     head; //  0xa815aa55
//    char    type;       //0:I frame 1:p frame
//    char         streamid;   //0:video  1:audio
//    unsigned short      militime;
//    unsigned int   sectime;
//    unsigned int     frameno;
//    unsigned int   len;
//    unsigned char  version;
//    unsigned char  resolution;//0:640*480 1:320*240 3:1080*720 4:1920*1080
//    unsigned char  sessid;
//    unsigned char  currsit;
//    unsigned char  endflag;
//    char    byzone;
//    char                framerate;
//    unsigned char       other;
//    unsigned int        totalFrame;
    
    unsigned int     startcode; //  0xa815aa55
    char    type;       //0:I frame 1:p frame
    char         streamid;   //0:video  1:audio
    unsigned short      militime;
    unsigned int   sectime;
    unsigned int     frameno;
    unsigned int   len;
    unsigned char  version; //
    unsigned char  resolution;//0:640*480 1:320*240 3:1080*720 4:1920*1080
    unsigned char  sessid;
    unsigned char  currsit;
    unsigned char  endflag;
    char    byzone;
    char                framerate;
    unsigned char       other;
    unsigned int        totalFrame;
    
}SVIDEO_BUF_HEAD, *PVIDEO_BUF_HEAD;




//����ʵ����������
#define MAX_PLAY_INSTANCE   64

#define KS 1024

//��Ƶ�����С
#define VBUF_SIZE      10*KS*KS

//��Ƶ�����С
#define ABUF_SIZE      5*KS*KS

//����ʱ����
#define RE_CONNECT_INTERVAL 30

//�������ʱ����
#define MAX_RECONNECT_INTERVAL 300

//��С����ʱ����
#define MIN_RECONNECT_INTERVAL 10

//���¼��ʱ�䣨�֣�
#define MAX_RECORD_TIME 15

//¼���ļ�������С��MB��
#define MAX_RECORD_FILE_SIZE 50

//¼��ģʽ
#define RECORD_ONE_TIME 1 //¼��һ��
#define RECORD_REPEAT 2 //�ظ�¼��

#define RECORD_MODE RECORD_ONE_TIME


//����֡�ʵ���Ƶ֡����Ŀ
#define FRAMERATE_CNT   30

//�ļ�����ʱ���ļ���С����Сֵ(�ֽ�)

#define LK 1024

#define RECORD_FILE_MIN_SIZE 64*KS

//�����ٶ�
#define PLAY_SPEED_SLOW16 -16
#define PLAY_SPEED_SLOW8  -8
#define PLAY_SPEED_SLOW4  -4
#define PLAY_SPEED_SLOW2  -2
#define PLAY_SPEED_NORMAL 0
#define PLAY_SPEED_FAST2  2
#define PLAY_SPEED_FAST4  4
#define PLAY_SPEED_FAST8  8
#define PLAY_SPEED_FAST16 16

#ifndef SAFE_DELETE
#define SAFE_DELETE(p)\
{\
    if((p) != NULL)\
    {\
        delete (p);\
        (p) = NULL;\
    }\
}
#endif

#endif
