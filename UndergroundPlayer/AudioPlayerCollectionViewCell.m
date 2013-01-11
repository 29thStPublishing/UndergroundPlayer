//
//  AudioPlayerCollectionViewCell.m
//  UndergroundPlayer
//
//  Created by Tim Moore on 1/11/13.
//  Copyright (c) 2013 Twenty Ninth Street Publishing. All rights reserved.
//

#import "AudioPlayerCollectionViewCell.h"

@implementation AudioPlayerCollectionViewCell
@synthesize songInfoLabel;
@synthesize startStopButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        audioPlayer = nil;
        active_song_index = 0;

        
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"AudioPlayerCollectionViewCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
    }
    
    return self;
    
}



/*
-(IBAction)startStopButtonPressed:(id)sender {
    NSLog(@"start/stop button pressed.\n");
    
    if (audioPlayer.isPlaying) {
        [self pause];
    }
    else {
        [self play];
    }
    
}

*/








/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
