//
//  FinalScoreVC.m
//  MathsMagic
//
//  Created by Farhan on 24/07/15.
//  Copyright (c) 2015 Triffort Technologies. All rights reserved.
//

#import "FinalScoreVC.h"

@interface FinalScoreVC ()

@end

@implementation FinalScoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    lblScore.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"score"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"score"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didTapHome:(id)sender
{
    [(UINavigationController *)self.presentingViewController  popViewControllerAnimated:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)didTapPlayAgain:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
