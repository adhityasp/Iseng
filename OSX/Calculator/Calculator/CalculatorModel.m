//
//  CalculatorModel.m
//  Calculator
//
//  Created by Adhitya Surya Pratama on 11/6/16.
//  Copyright © 2016 Adhitya Surya Pratama. All rights reserved.
//
#import "CalculatorModel.h"
@interface CalculatorModel()

@property (strong, nonatomic) NSMutableArray* programStack;


@end

@implementation CalculatorModel

@synthesize programStack = _programStack;

- (NSMutableArray * ) programStack{
    if(!_programStack) _programStack = [[NSMutableArray alloc] init];
    return _programStack;
}

- (void)pushOperand:(double) operand{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.programStack addObject:operandObject];
}

- (double) operate: (NSString *) operation{
    if([operation isEqualToString:@"C"])
        [self.programStack removeAllObjects];
    else{
        [self.programStack addObject:operation];
        return [CalculatorModel runProgram:self.program];
    }
    return 0;
}

-(id) program{
    return self.programStack.copy;
}
+(NSString *)descriptionOfProgram:(id)program{
    return @"Tes";
}

+(double)popOperandOfStack:(NSMutableArray *) stack{
    double result = 0;
    id top = [stack lastObject];
    if(top != nil) [stack removeLastObject];
    
    if([top isKindOfClass: [NSNumber class]]){
        
        result = [top doubleValue];
    }
    else if([top isKindOfClass:[NSString class]]){
        NSString *operation = top;
        if([operation isEqualToString:@"+"])
            result = [self popOperandOfStack:stack] + [self popOperandOfStack:stack];
        else if([operation isEqualToString:@"-"]){
            double pengurang = [self popOperandOfStack:stack];
            result = [self popOperandOfStack:stack] - pengurang;
        }
        else if([operation isEqualToString:@"*"])
            result = [self popOperandOfStack:stack] * [self popOperandOfStack:stack];
        else if([operation isEqualToString:@"/"]){
            double divisor = [self popOperandOfStack:stack];
            if(divisor) result = [self popOperandOfStack:stack] / divisor;
        }
        else if([operation isEqualToString:@"sin"]){
            result = sin([self popOperandOfStack:stack]);
        }
        else if([operation isEqualToString:@"cos"]){
            result = cos([self popOperandOfStack:stack]);
        }
        else if([operation isEqualToString:@"pi"]){
            result  = M_PI * [self popOperandOfStack:stack];
        }
        else if([operation isEqualToString:@"sqrt"]){
            result = sqrt([self popOperandOfStack:stack]);
        }
    }
    printf("%lf\n", result);
    return result;
}
+ (double)runProgram:(id)program{
    NSMutableArray *stack;
    if([program isKindOfClass:[NSArray class]]){
        stack = [program mutableCopy];
    }
    return [self popOperandOfStack:stack];
}


@end
