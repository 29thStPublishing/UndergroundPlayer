//
//  ViewController.m
//  UndergroundPlayer
//
//  Created by nataliepo on 1/11/13.
//  Copyright (c) 2013 Twenty Ninth Street Publishing. All rights reserved.
//

#import "ViewController.h"
#import "UndergroundPlayerVC.h"




@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
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


@end


