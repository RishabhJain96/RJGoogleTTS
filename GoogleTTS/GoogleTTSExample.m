//
//  ViewController.m
//  GoogleTTS
//
//  Created by Rishabh Jain on 12/24/13.
//  Copyright (c) 2013 RJVK Productions. All rights reserved.
//

#import "GoogleTTSExample.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface GoogleTTSExample ()

@end

@implementation GoogleTTSExample
@synthesize tts, player;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    tts = [[GoogleTTS alloc] init];
    NSLog(@"Here");
    [tts convertTextToSpeech:@"test" withCompletion:^(NSMutableData *data) {
        NSLog(@"Playing Speech");
        NSString *download = [NSTemporaryDirectory() stringByAppendingPathComponent:@"Temp.mp3"];
        [data writeToFile:download atomically:YES];
        
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:download] error:nil];
        [player setDelegate:self];
        [player play];
    }];
}

#pragma mark - 
#pragma mark - AVAudioPlayer Delegate Methods

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"Finished Playing");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
