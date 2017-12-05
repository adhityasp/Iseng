//
//  Roulette.m
//  SuggestMeal
//
//  Created by Adhitya Surya Pratama on 9/6/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

#import "Roulette.h"

@implementation Roulette
- (void) drawRect:(CGRect)rect{
    UIBezierPath *x = [[UIBezierPath alloc]init];
    [x moveToPoint:CGPointMake(0, 0)];
    [x moveToPoint:CGPointMake(100, 100)];
    x.lineWidth = 1.0f;
    [x stroke];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
