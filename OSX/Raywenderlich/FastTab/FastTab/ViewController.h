//
//  ViewController.h
//  FastTab
//
//  Created by Adhitya Surya Pratama on 8/30/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController
{
    __weak IBOutlet UILabel *timer;
    __weak IBOutlet UILabel *score;
    __weak IBOutlet UIButton *tapBtn;
    NSInteger count;
    NSInteger seconds;
    NSTimer *timers;
    
    AVAudioPlayer *bgm;
    
}
- (IBAction)btnPressed:(id)sender;
@end

