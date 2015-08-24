//
//  ViewController.m
//  KiddishMath
//

//  Copyright (c) 2015 Rahul. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    IBOutlet UIButton *btnPlay;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
     [self.navigationController setNavigationBarHidden:YES];
    
    btnPlay.layer.cornerRadius  = 8.0;
    btnPlay.layer.masksToBounds = NO;
 
    
    btnPlay.layer.shadowColor = [UIColor blackColor].CGColor;
    btnPlay.layer.shadowOpacity = 0.8;
    btnPlay.layer.shadowRadius = 12;
    btnPlay.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);

}
@end
