//
//  GoogleTTS.h
//  GoogleTTS
//
//
//
//
//  Created by Rishabh Jain on 12/24/13.
//  Copyright (c) 2013 RJVK Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoogleTTS : NSObject {
    NSMutableData *downloadedData;
}

@property (nonatomic, strong) NSMutableData *downloadedData;

typedef void (^GoogleTTSCompletionBlock)(NSMutableData *response);

- (void)convertTextToSpeech:(NSString *)string withCompletion:(GoogleTTSCompletionBlock)complete;


@end
