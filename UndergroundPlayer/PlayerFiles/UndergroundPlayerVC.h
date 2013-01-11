//
//  UndergroundPlayerVC.h
//  UndergroundPlayer
//
//  Created by nataliepo on 1/11/13.
//  Copyright (c) 2013 Twenty Ninth Street Publishing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface UndergroundPlayerVC : UIViewController {
    AVAudioPlayer * audioPlayer;
}


@property (weak, nonatomic) IBOutlet UIButton *startStopButton;
@property (weak, nonatomic) IBOutlet UILabel  *songInfoLabel;


-(IBAction)startStopButtonPressed:(id)sender;

-(id)init;

@end


