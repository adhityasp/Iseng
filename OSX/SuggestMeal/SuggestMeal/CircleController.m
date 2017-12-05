//
//  Circle.m
//  SuggestMeal
//
//  Created by Adhitya Surya Pratama on 9/8/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

#import "CircleController.h"

@implementation CircleController

- (void)drawPie:(CGPoint)atCenter withRadius:(CGFloat) radius withSlices: (NSMutableArray*)mealList
{
    CGFloat angle = -M_PI/2;
    
    
    for (NSMutableArray* meal in mealList) {
        CGFloat sliceAngle = (CGFloat)M_PI*2/mealList.count;//bagi rata each slice
        [[UIColor blueColor] setFill];
        [[UIColor blackColor] setStroke];
        
        UIBezierPath *path = [[UIBezierPath alloc]init];
        [path moveToPoint:atCenter];
        [path addArcWithCenter:atCenter radius:radius startAngle:angle endAngle:(angle-sliceAngle) clockwise:FALSE];
        [path moveToPoint:atCenter];
        [path closePath];
        [path fill];
        [path stroke];
        
        [path moveToPoint:CGPointMake(angle/2, angle/2)];
        
        CATextLayer *textLayer = [[CATextLayer alloc] init];
        textLayer.string = @"ABC";
        textLayer.foregroundColor = [[UIColor whiteColor]CGColor];
        textLayer.font = (__bridge CFTypeRef _Nullable)([UIFont fontWithName:@"Avenir" size:5.0]);
        textLayer.fontSize = 12.0;
        textLayer.backgroundColor = [[UIColor orangeColor]CGColor];
        textLayer.frame = CGRectMake(radius-angle-sliceAngle/2, radius-sliceAngle/2, radius/2, 15);
        textLayer.contentsScale = [[UIScreen mainScreen]scale];
        [self.layer addSublayer:textLayer];

        angle = angle - sliceAngle;
    }
}

#define SCALE 0.8
- (void)drawRect:(CGRect)rect
{
    CGPoint midPoint; // set circle position
    midPoint.x = self.bounds.origin.x + self.bounds.size.width/2;
    midPoint.y = self.bounds.origin.y + self.bounds.size.height/2;
    
    CGFloat size = self.bounds.size.width/2; // set circle size
    if( self.bounds.size.height < self.bounds.size.width) size = self.bounds.size.height/2;
    size *= SCALE;
    
    [[UIColor blackColor] setStroke]; // set stroke Color
    NSMutableArray* mealList = [NSMutableArray arrayWithObjects:@"A",@"C",@"B",@"D", nil];
    [self drawPie:midPoint withRadius:size withSlices:mealList];
}


@end
