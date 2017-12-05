//
//  CalculatorModel.h
//  Calculator
//
//  Created by Adhitya Surya Pratama on 11/6/16.
//  Copyright © 2016 Adhitya Surya Pratama. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject

- (void) pushOperand:(double) operand;
- (double) operate: (NSString *) operation;
@property (readonly) id program;

+ (double)runProgram:(id) program;
+ (NSString *) descriptionOfProgram:(id)program;
@end


