//
//  GoogleTTS.m
//  GoogleTTS
//
//  Created by Rishabh Jain on 12/24/13.
//  Copyright (c) 2013 RJVK Productions. All rights reserved.
//

#import "GoogleTTS.h"

@implementation GoogleTTS
@synthesize downloadedData;

void(^serverCallback)(NSMutableData *data);

- (void)convertTextToSpeech:(NSString *)string withCompletion:(GoogleTTSCompletionBlock)complete {
    NSString *search = [NSString stringWithFormat:@"http://translate.google.com/translate_tts?tl=en&q=%@", string];
    search = [search stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:search]];
    [request setValue:@"Mozilla/5.0" forHTTPHeaderField:@"User-Agent"];
    NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connect start];
    downloadedData = [[NSMutableData alloc] initWithLength:0];
    serverCallback = complete;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.downloadedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.downloadedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Failure");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    serverCallback(self.downloadedData);
}

@end
