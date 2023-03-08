
#import <Foundation/Foundation.h>

#import <AudioToolbox/AudioToolbox.h>
#import <AudioToolbox/AudioFile.h>
#include <AudioToolbox/AudioQueue.h>
#include <stdio.h>
#include <errno.h>
#include <sys/stat.h>

#define NUM_BUFFERS 3
#define _AVCODEC_MAX_AUDIO_FRAME_SIZE  3000


typedef void (*PlaybackAudioBufferCallback)(void *inUserData,AudioQueueRef inAQ,
                           AudioQueueBufferRef buffer);


#ifdef __cplusplus
class CPCMPlayer
{
public:
    CPCMPlayer(PlaybackAudioBufferCallback BuffCallback, void *param);
    ~CPCMPlayer();
    void StartPlay();
    
private:
    void StopPlay();
    int readPacketsIntoBuffer(AudioQueueBufferRef buffer);
    
private:
    AudioStreamBasicDescription m_dataFormat;
    AudioQueueRef m_queue;
    AudioStreamPacketDescription *m_packetDescs;
    AudioQueueBufferRef m_buffers[NUM_BUFFERS];
    
    int m_bPlaying;
    
    
};


#endif



