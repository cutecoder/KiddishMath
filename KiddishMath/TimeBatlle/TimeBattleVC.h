//
//  TimeBattleVC.h
//  MathsMagic
//
//  Created by Farhan on 24/07/15.

//

#import <UIKit/UIKit.h>

@interface TimeBattleVC : UIViewController

{
    IBOutlet UILabel *lblNum1;
    IBOutlet UILabel *lblNum2;
    IBOutlet UILabel *lblOperand;
    IBOutlet UILabel *lblResult;
    IBOutlet UITextField *txtResult;
    IBOutlet UIProgressView * threadProgressView;
    

    IBOutlet UILabel *lblScore;
    IBOutlet UILabel *lblHighScore;
}
- (IBAction)didTapYes:(id)sender;
- (IBAction)didTapBack:(id)sender;




@end
