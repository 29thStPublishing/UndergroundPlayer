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
    }
    
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Set the song.
    songInfoLabel.text = @"";
    
    [startStopButton setTitle:@"Play" forState:UIControlStateNormal];
    [self addSongToPlayer];
    
    
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

-(IBAction)startStopButtonPressed:(id)sender {
    NSLog(@"start/stop button pressed.\n");
    
    if (audioPlayer.isPlaying) {
        // startStopButton.titleLabel.text = @"Play";
        [startStopButton setTitle:@"Play" forState:UIControlStateNormal];

        
        [audioPlayer pause];
        
    }
    else {
        //startStopButton.titleLabel.text = @"Pause";
        [startStopButton setTitle:@"Pause" forState:UIControlStateNormal];

        [audioPlayer play];
    }
          
}

-(void)addSongToPlayer {
    
    
    
    NSString * file_basename = [[UndergroundPlayerVC allowedAudioFiles] objectAtIndex:0];
    
    
    // update the playing label
    songInfoLabel.text = file_basename;
    
    NSString * music_file_path = [[NSBundle mainBundle] pathForResource:file_basename ofType:@"mp3"];
    NSError * error;
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music_file_path] error:&error];
    if (error) {
        NSLog(@"Error Loading music file: %@\n", [error description]);
        return;
    }
    
    
}



+(NSArray*)allowedAudioFiles {
    return @[@"duck", @"cow", @"finch"];
}
@end
