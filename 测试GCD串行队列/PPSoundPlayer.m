//
//  PPSoundPlayer.m
//
//  Created by pipixia on 2018/1/3.
//  Copyright © 2018年 pipixia. All rights reserved.
//

#import "PPSoundPlayer.h"

static PPSoundPlayer *soundPlayer = nil;
static AVSpeechSynthesizer *player = nil;
static dispatch_queue_t queue = NULL;

@implementation PPSoundPlayer

+ (PPSoundPlayer *)soundPlayerInstance
{
    if (soundPlayer == nil)
    {
        soundPlayer = [[PPSoundPlayer alloc] init];
        player = [[AVSpeechSynthesizer alloc] init];
        queue = dispatch_queue_create("text", NULL);
        [soundPlayer initSoundSet];
        [soundPlayer setDefault];
    }
    return soundPlayer;
}

//播放声音
- (void)play:(NSString *)text
{
    if(text)
    {
        dispatch_async(queue, ^{
            AVSpeechUtterance *u=[[AVSpeechUtterance alloc]initWithString:text];//设置要朗读的字符串
            u.voice=[AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];//设置语言
            u.volume = self.volume;  //设置音量（0.0~1.0）默认为1.0
            u.rate = self.rate;  //设置语速
            u.pitchMultiplier = self.pitchMultiplier;  //设置语调
            
            
            [player speakUtterance:u];
        });
    }
}

//初始化配置
- (void)initSoundSet
{
    path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"SoundSet.plist"];
    soundSet=[NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    if(soundSet==nil)
    {
        soundSet=[NSMutableDictionary dictionary];
        [soundPlayer setDefault];
        [soundPlayer writeSoundSet];
    }
    else
    {
        self.autoPlay = [[soundSet valueForKeyPath:@"autoPlay"] boolValue];
        self.volume = [[soundSet valueForKeyPath:@"volume"] floatValue];
        self.rate = [[soundSet valueForKeyPath:@"rate"] floatValue];
        self.pitchMultiplier = [[soundSet valueForKeyPath:@"pitchMultiplier"] floatValue];
    }
}

 //恢复默认设置
- (void)setDefault
{
    self.volume = 0.7;
    self.rate = 0.5;
    self.pitchMultiplier = 1.0;
}

 //将设置写入配置文件
-(void)writeSoundSet
{
    [soundSet setValue:[NSNumber numberWithBool:self.autoPlay] forKey:@"autoPlay"];
    [soundSet setValue:[NSNumber numberWithFloat:self.volume] forKey:@"volume"];
    [soundSet setValue:[NSNumber numberWithFloat:self.rate] forKey:@"rate"];
    [soundSet setValue:[NSNumber numberWithFloat:self.pitchMultiplier] forKey:@"pitchMultiplier"];
    [soundSet writeToFile:path atomically:YES];
}

- (void)stopSpeaking{
    [player stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}
@end
