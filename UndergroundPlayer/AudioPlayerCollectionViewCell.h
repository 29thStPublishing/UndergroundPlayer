//
//  AudioPlayerCollectionViewCell.h
//  UndergroundPlayer
//
//  Created by Tim Moore on 1/11/13.
//  Copyright (c) 2013 Twenty Ninth Street Publishing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioPlayerCollectionViewCell : UICollectionViewCell
    {
        AVAudioPlayer * audioPlayer;
        int active_song_index;
    }




@property (weak, nonatomic) IBOutlet UIButton *startStopButton;
@property (weak, nonatomic) IBOutlet UILabel  *songInfoLabel;


//-(IBAction)startStopButtonPressed:(id)sender;

@end
