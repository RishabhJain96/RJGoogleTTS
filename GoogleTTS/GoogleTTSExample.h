//
//  ViewController.h
//  GoogleTTS
//
//  Created by Rishabh Jain on 12/24/13.
//  Copyright (c) 2013 RJVK Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "GoogleTTS.h"

@interface GoogleTTSExample : UIViewController <AVAudioPlayerDelegate> {
    GoogleTTS *tts;
    AVAudioPlayer *player;
}

@property (nonatomic, retain) GoogleTTS *tts;
@property (nonatomic, retain) AVAudioPlayer *player;

@end
