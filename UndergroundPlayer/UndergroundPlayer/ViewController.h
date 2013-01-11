//
//  ViewController.h
//  UndergroundPlayer
//
//  Created by nataliepo on 1/11/13.
//  Copyright (c) 2013 Twenty Ninth Street Publishing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UndergroundPlayerVC;
@class AudioPlayerCollectionViewCell;
@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate> {
   
    
    UndergroundPlayerVC * player;
       AudioPlayerCollectionViewCell * cell;
}

@property (weak, nonatomic) IBOutlet UICollectionView *audioCollectionView;


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;





@end
