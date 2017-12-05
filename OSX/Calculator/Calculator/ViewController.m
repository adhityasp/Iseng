//
//  ViewController.m
//  Calculator
//
//  Created by Adhitya Surya Pratama on 11/6/16.
//  Copyright © 2016 Adhitya Surya Pratama. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (nonatomic) BOOL isTyping;
@property (nonatomic) BOOL isAllowed;
@property (nonatomic, strong) CalculatorModel *model;
@property (weak, nonatomic) IBOutlet UILabel *stackDisplay;

@end

@implementation ViewController
@synthesize display = _display;
@synthesize model = _model;
@synthesize isTyping = _isTyping;
@synthesize isAllowed = _isAllowed;

-(CalculatorModel *) model{
    if(!_model) _model = [[CalculatorModel alloc] init];
    return _model;
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *digit = sender.currentTitle;
    NSInteger numberOfDots = [[self.display.text componentsSeparatedByString:@"."]count]-1;
    if(numberOfDots <= 0) self.isAllowed = YES;
    else if(numberOfDots > 0) self.isAllowed = NO;
    
    if(self.isTyping){
        if([digit isEqualToString:@"."]){
            if(self.isAllowed == YES){
                self.display.text  = [self.display.text stringByAppendingString:digit];
            }
        }
        else{
            self.display.text  = [self.display.text stringByAppendingString:digit];
        }
    }
    else{
        self.display.text  = digit;
        self.isTyping = YES;
    }
}

- (IBAction)equalsPressed{
    printf("Equals");
    [self.model pushOperand:[self.display.text doubleValue]];
    id programStack = [self.model program];
    if(programStack){
        self.stackDisplay.text = @" ";
        for (int i = 0; i < [programStack count]; i++){
            if([[programStack objectAtIndex:i] isKindOfClass:[NSNumber class]]){
                self.stackDisplay.text = [self.stackDisplay.text stringByAppendingString:[NSString stringWithFormat:@"%@ ", (NSString *)[programStack objectAtIndex:i]]];
            }
            else if([[programStack objectAtIndex:i] isKindOfClass:[NSString class]]){
                self.stackDisplay.text = [self.stackDisplay.text stringByAppendingString:[NSString stringWithFormat:@"%@ ", (NSString *)[programStack objectAtIndex:i]]];
            }
        }
    }
    self.isTyping = NO;
}

- (IBAction)operatorPressed:(UIButton *)sender {
    printf("Operator");
    if(self.isTyping) {
        [self equalsPressed];
    }
    NSString *operation = [sender currentTitle];
    double result = [self.model operate:operation];
    self.display.text = [NSString stringWithFormat:@"%g",result];
    id programStack = [self.model program];
    if(programStack){
        self.stackDisplay.text = @" ";
        for (int i = 0; i < [programStack count]; i++){
            if([[programStack objectAtIndex:i] isKindOfClass:[NSNumber class]]){
                self.stackDisplay.text = [self.stackDisplay.text stringByAppendingString:[NSString stringWithFormat:@"%@ ", (NSString *)[programStack objectAtIndex:i]]];
            }
            else if([[programStack objectAtIndex:i] isKindOfClass:[NSString class]]){
                if([[programStack objectAtIndex:i] isEqualToString:@"C"]){
                    self.stackDisplay.text = @" ";
                }else{
                    self.stackDisplay.text = [self.stackDisplay.text stringByAppendingString:[NSString stringWithFormat:@"%@ ", (NSString *)[programStack objectAtIndex:i]]];
                }
            }
        }
    }
}

@end
