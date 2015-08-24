//
//  TimeBattleVC.m
//  MathsMagic
//


//

#import "TimeBattleVC.h"
#import "FinalScoreVC.h"

@interface TimeBattleVC ()
{
    NSMutableArray *numbers;
     NSMutableArray *numbersList2;
      NSMutableArray *decisionList;
    NSTimer *myTimer;
    int i,num1,num2,res,dummyAns;
    int score;
}
@end

@implementation TimeBattleVC
-(void)viewWillAppear:(BOOL)animated
{
   self.navigationItem.title =  @"KiddishMath";
    
    [self performSelectorOnMainThread:@selector(makeMyProgressBarMoving) withObject:nil waitUntilDone:NO];
       [self.navigationController setNavigationBarHidden:NO];
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        // iOS 6.1 or earlier
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:229.0/255.0 green:113.0/255.0 blue:111.0/255.0 alpha:1.0];
    } else {
        // iOS 7.0 or later
        self.navigationController.navigationBar.barTintColor =  [UIColor colorWithRed:229.0/255.0 green:113.0/255.0 blue:111.0/255.0 alpha:1.0];
          self.navigationController.navigationBar.tintColor  = [UIColor whiteColor];
         self.navigationController.navigationBar.translucent = NO;
    }


}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    threadProgressView.progress = 0.0;
       score = 0;
    numbers = [[NSMutableArray alloc]init];
    numbersList2 = [[NSMutableArray alloc]init];
    decisionList = [[NSMutableArray alloc]init];
    for(i=1;i<=10;i++)
        [numbers addObject:[NSString stringWithFormat:@"%d",i]];
    for(i=1;i<=6;i++)
        [numbersList2 addObject:[NSString stringWithFormat:@"%d",i]];
    
    [decisionList addObject:@"0"];
    [decisionList addObject:@"1"];
    
    lblScore.text = @"0";
    [self displayValues];
    
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"HighScore"])
    {
        lblHighScore.text =[[NSUserDefaults standardUserDefaults]objectForKey:@"HighScore"];
    }
    else
    {
        lblHighScore.text = @"0";
           [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"HighScore"];
    }
        
    // Do any additional setup after loading the view.
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
- (int)getRandomNumberForLeft
{
    return [[numbers objectAtIndex: arc4random() % [numbers count]] intValue];
}

- (int)getRandomNumberForRight
{
    return [[numbersList2 objectAtIndex: arc4random() % [numbersList2 count]] intValue];
}
- (NSString *)getRandomDecision
{
    int val =  [[decisionList objectAtIndex: arc4random() % [decisionList count]] intValue];
    if(val)
        return @"Y";
    else
        return @"N";
}

- (IBAction)didTapNo:(id)sender
{
    lblNum1.text = [NSString stringWithFormat:@"%d",[self getRandomNumberForLeft]];
     lblNum2.text = [NSString stringWithFormat:@"%d",[self getRandomNumberForRight]];
}

- (IBAction)didTapYes:(id)sender
{
    if(!score)
        [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"score"];
    
    else
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%d",score] forKey:@"score"];
   
    if([sender tag] == 2)
    {
        if(num1+num2 == res)
        {
            score++;
            lblScore.text = [NSString stringWithFormat:@"%d",score];
            int highScore =[[[NSUserDefaults standardUserDefaults]objectForKey:@"HighScore"] intValue];
            
            
            

            
            if(score>highScore)
            {
                [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%d",score] forKey:@"HighScore"];
                                lblHighScore.text =[NSString stringWithFormat:@"%d",score];
               
            }
            else
            {
                lblHighScore.text =[[NSUserDefaults standardUserDefaults]objectForKey:@"HighScore"];
            }
            
             [[NSUserDefaults standardUserDefaults]synchronize];
            NSLog(@"%d",score);
               [self displayValues];
            threadProgressView.progress = 0.0;
               [myTimer invalidate];
            [self performSelectorOnMainThread:@selector(makeMyProgressBarMoving) withObject:nil waitUntilDone:NO];
        }
        else
        {
            score = 0;
            lblScore.text = @"0";
               [myTimer invalidate];
             threadProgressView.progress = 0.0;
            [self displayValues];
            FinalScoreVC *PVC = (FinalScoreVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"FinalScoreVC"];
            PVC.modalPresentationStyle = UIModalPresentationFullScreen;
            PVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self.navigationController presentViewController:PVC animated:YES completion:nil];
        }
     
        
    }
    else if([sender tag] == 3)
    {
        if(num1+num2 != res)
        {
            score++;
            lblScore.text = [NSString stringWithFormat:@"%d",score];
            int highScore =[[[NSUserDefaults standardUserDefaults]objectForKey:@"HighScore"] intValue];
            if(score>highScore)
            {
                [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%d",score] forKey:@"HighScore"];
                lblHighScore.text =[NSString stringWithFormat:@"%d",score];
                [[NSUserDefaults standardUserDefaults]synchronize];
            }
            else
            {
                lblHighScore.text =[[NSUserDefaults standardUserDefaults]objectForKey:@"HighScore"];
            }
            NSLog(@"%d",score);
            [self displayValues];
            threadProgressView.progress = 0.0;
               [myTimer invalidate];
            [self performSelectorOnMainThread:@selector(makeMyProgressBarMoving) withObject:nil waitUntilDone:NO];
        }
        
        else
        {
            score = 0;
            lblScore.text = @"0";
             threadProgressView.progress = 0.0;
            [myTimer invalidate];
            [self displayValues];
            FinalScoreVC *PVC = (FinalScoreVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"FinalScoreVC"];
            PVC.modalPresentationStyle = UIModalPresentationFullScreen;
            PVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self.navigationController presentViewController:PVC animated:YES completion:nil];
        }

        
    }
    
    
    
}

- (void)displayValues
{
    lblNum2.text = [NSString stringWithFormat:@"%d",[self getRandomNumberForRight]];
    lblNum1.text = [NSString stringWithFormat:@"%d",[self getRandomNumberForLeft]];
    
    num1 = [lblNum1.text intValue];
    num2 = [lblNum2.text intValue];
    
   
    
    if([[self getRandomDecision] isEqualToString:@"Y"])
    {
          res = num1+num2;
        lblResult.text = [NSString stringWithFormat:@"%d",res];
        
      
    }
    
    else
    {
        res  =[self getRandomNumberForLeft];
        lblResult.text = [NSString stringWithFormat:@"%d",res];
       
    }

}

- (void)makeMyProgressBarMoving {
    
    float actual = [threadProgressView progress];
    if (actual < 1) {
        threadProgressView.progress = actual + .02;
       myTimer =  [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(makeMyProgressBarMoving) userInfo:nil repeats:NO];
        
    }
    else{
        threadProgressView.progress = 0.0;
        [myTimer invalidate];
      
        if(!score)
            [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"score"];
        
        else
            [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%d",score] forKey:@"score"];
        
           [[NSUserDefaults standardUserDefaults]
            synchronize];
        score = 0;
        lblScore.text = @"0";
        
        [self displayValues];
        FinalScoreVC *PVC = (FinalScoreVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"FinalScoreVC"];
        PVC.modalPresentationStyle = UIModalPresentationFullScreen;
        PVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self.navigationController presentViewController:PVC animated:YES completion:nil];
        
    }
    
}
- (IBAction)didTapBack:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
