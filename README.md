# textToVoice

#引入#import "PPSoundPlayer.h"

1,[[PPSoundPlayer soundPlayerInstance] play:text];
2,text为播放的内容
3,播放是队列
4,退出后 [[PPSoundPlayer soundPlayerInstance] stopSpeaking];
