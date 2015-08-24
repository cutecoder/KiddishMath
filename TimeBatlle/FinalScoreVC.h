//
//  FinalScoreVC.h
//  MathsMagic
//
//  Created by Farhan on 24/07/15.
//  Copyright (c) 2015 Triffort Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinalScoreVC : UIViewController

{
    IBOutlet UILabel *lblScore;
}

- (IBAction)didTapHome:(id)sender;
- (IBAction)didTapPlayAgain:(id)sender;

@end
