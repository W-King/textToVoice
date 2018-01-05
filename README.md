# textToVoice

引入#import "PPSoundPlayer.h"

[[PPSoundPlayer soundPlayerInstance] play:text];
text为播放的内容
播放是队列
退出后 [[PPSoundPlayer soundPlayerInstance] stopSpeaking];
