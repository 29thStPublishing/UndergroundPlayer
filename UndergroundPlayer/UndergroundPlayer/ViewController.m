//
//  ViewController.m
//  UndergroundPlayer
//
//  Created by nataliepo on 1/11/13.
//  Copyright (c) 2013 Twenty Ninth Street Publishing. All rights reserved.
//

#import "ViewController.h"
#import "UndergroundPlayerVC.h"
#import "AudioPlayerCollectionViewCell.h" 




@implementation ViewController
@synthesize audioCollectionView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.audioCollectionView registerClass:[AudioPlayerCollectionViewCell class] forCellWithReuseIdentifier:@"audioCell"];

    
    player = [[UndergroundPlayerVC alloc] init];
    
    // set the frame
    float y_offset = 500;
    
    [player.view setFrame:CGRectMake((self.view.frame.size.width - player.view.frame.size.width) / 2,
                                     y_offset,
                                     player.view.frame.size.width,
                                     player.view.frame.size.height)];
    
    [self.view addSubview:player.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidUnload {
    player = nil;
}






-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //  return [[self imageData] count];
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    // NSMutableArray *sectionArray = [[self imageData] objectAtIndex:section];
    return [[UndergroundPlayerVC playlistFileBasenamesforTim]  count];
    
}





-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Setup cell identifier
    /*
     static NSString *cellIdentifier = @"audioPlayerCollectionViewCell";
     cell = (CVCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
     
     
     NSString *data = [imageArray objectAtIndex:indexPath.row];
     NSString *cellData = [[NSBundle mainBundle] pathForResource:data ofType:@"png"];
     
     
     [cell.imgContainer setImage:[UIImage imageWithContentsOfFile:cellData]];
     
     */
    
    
    //return cell;
    
    static NSString *cellIdentifier = @"audioCell";
    cell = (AudioPlayerCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSString *data = [[UndergroundPlayerVC playlistFileBasenamesforTim] objectAtIndex:indexPath.row];
    
    
    [cell.songInfoLabel setText:data];
    
    
    
    // NSString *cellData = [[NSBundle mainBundle] pathForResource:data ofType:@"wav"];
    
    
   
    
    // [cell setImage:[UIImage imageWithContentsOfFile:cellData]];
    
    
    //  NSString * file_basename = [[UndergroundPlayerVC playlistFileBasenames] objectAtIndex:index];
    
    /*
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
     
     */
    
    return cell;

 }














@end


