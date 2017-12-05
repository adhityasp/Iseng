//
//  ViewController.m
//  FastTab
//
//  Created by Adhitya Surya Pratama on 8/30/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (AVAudioPlayer *) setupAudioPlayerWithFile: (NSString*) fileName type:(NSString*)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    
    NSURL *url = [NSURL fileURLWithPath:path];
    
    NSError *error;
    
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if(!player){
        NSLog(@"%@", error.description);
    }
    return player;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self gameInit];
    
    //self.view.backgroundColor = [UIColor brownColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile"]];
    score.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score"]];
    score.textColor = [UIColor whiteColor];
    
    timer.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time"]];
    timer.textColor = [UIColor whiteColor];
    
    bgm = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
    [bgm setVolume:0.5];
    [bgm play];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnPressed:(id)sender{
    //add score
    //NSLog(@"%i",count);
    count+=1;
    score.text = [NSString stringWithFormat:@"Score : %i",(int)count];
}
- (void) gameInit{
    seconds = 10;
    count = 0;
    
    score.text = [NSString stringWithFormat:@"Score : %i",(int)count];
    timer.text = [NSString stringWithFormat:@"Time : %i",(int)seconds];
    
    timers = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:NULL repeats:YES ];
}

- (void)subtractTime{
    seconds--;
    timer.text = [NSString stringWithFormat:@"Time : %i",(int)seconds];
    
    if(seconds == 0){
        [timers invalidate];
        
        UIAlertController  *alert = [UIAlertController alertControllerWithTitle:@"Time's up !" message: [NSString stringWithFormat:@"Your score is %li", (long)count] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alertBtn = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler: ^(UIAlertAction * action)
                                   {
                                       [self gameInit];
                                   }];
        
        [alert addAction:alertBtn];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}
@end
