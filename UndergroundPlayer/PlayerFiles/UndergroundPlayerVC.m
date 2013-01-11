//
//  UndergroundPlayerVC.m
//  UndergroundPlayer
//
//  Created by nataliepo on 1/11/13.
//  Copyright (c) 2013 Twenty Ninth Street Publishing. All rights reserved.
//

#import "UndergroundPlayerVC.h"



@implementation UndergroundPlayerVC

@synthesize startStopButton;
@synthesize songInfoLabel;


-(id)init {
    self = [super initWithNibName:@"UndergroundPlayer" bundle:nil];
    
    if (self) {
        audioPlayer = nil;
        active_song_index = 0;
    }
    
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set the song.
    songInfoLabel.text = @"";
    
    // Let the user do something
    [startStopButton setTitle:@"Play" forState:UIControlStateNormal];
    
    // Load the first song we have.
    [self loadSongAtIndex:active_song_index];
    
    
    // Set up the gestures
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(playPreviousSong)];
    [rightSwipe setNumberOfTouchesRequired:1];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    // next Page
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(playNextSong)];
    [leftSwipe setNumberOfTouchesRequired:1];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.view addGestureRecognizer:rightSwipe];
    [self.view addGestureRecognizer:leftSwipe];
    
    leftSwipe = nil;
    rightSwipe = nil;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidUnload {
    startStopButton = nil;
    songInfoLabel = nil;
    audioPlayer = nil;
}


-(IBAction)playNextSong {
    
    NSLog(@"(playNextSong)");
    
    if ((active_song_index + 1) == [[UndergroundPlayerVC playlistFileBasenames] count]) {
        // do nothing
        return;
    }
    
    active_song_index++;
    [self loadSongAtIndex:active_song_index];
    
}

-(IBAction)playPreviousSong {
    NSLog(@"(playPreviousSong)");
    
    if ((active_song_index - 1) < 0) {
        // do nothing
        return;
    }
    
    active_song_index--;
    [self loadSongAtIndex:active_song_index];

}


-(void)pause {
    [startStopButton setTitle:@"Play" forState:UIControlStateNormal];
    [audioPlayer pause];
}

-(void)play {
    [startStopButton setTitle:@"Pause" forState:UIControlStateNormal];
    [audioPlayer play];
}

-(IBAction)startStopButtonPressed:(id)sender {
    NSLog(@"start/stop button pressed.\n");
    
    if (audioPlayer.isPlaying) {
        [self pause];
    }
    else {
        [self play];
    }
          
}



-(void)loadSongAtIndex:(int)index {
    
    if (audioPlayer != nil) {
        [audioPlayer stop];
        audioPlayer = nil;
    }
    
    NSString * file_basename = [[UndergroundPlayerVC playlistFileBasenames] objectAtIndex:index];
    
    
    // update the playing label
    songInfoLabel.text = file_basename;
    
    NSString * music_file_path = [[NSBundle mainBundle] pathForResource:file_basename ofType:@"wav"];
    NSError * error;
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music_file_path] error:&error];
    if (error) {
        NSLog(@"Error Loading music file: %@\n", [error description]);
        return;
    }

    audioPlayer.numberOfLoops = -1;
    [self play];

    
}



+(NSArray*)playlistFileBasenames {
    return @[@"duck", @"cow", @"finch", @"sheep"];
}
@end
