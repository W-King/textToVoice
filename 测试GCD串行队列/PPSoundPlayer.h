//
//  PPSoundPlayer.h
//
//  Created by pipixia on 2018/1/3.
//  Copyright © 2018年 pipixia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface PPSoundPlayer : NSObject
{
    ///声音设置
    NSMutableDictionary *soundSet;
    ///配置文件路径
    NSString *path;
}
///语速
@property (nonatomic, assign) float rate;
///音量
@property (nonatomic, assign) float volume;
///音调
@property (nonatomic, assign) float pitchMultiplier;
///自动播放
@property (nonatomic, assign) BOOL autoPlay;

+ (PPSoundPlayer *)soundPlayerInstance;

- (void)play:(NSString *)text;

//- (void)setDefault;

- (void)writeSoundSet;

- (void)stopSpeaking;

@end
