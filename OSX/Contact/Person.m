//
//  Person.m
//  Contact
//
//  Created by Adhitya Surya Pratama on 8/30/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

#import "Person.h"

@implementation Person


- (void) insertContactInfo{
    char names[100];
    NSLog(@"Input your name : ");
    scanf("%s",names);
    
    name = [NSString stringWithCString:names encoding:1];
    
    NSLog(@"Input your age %@ : ", name);
    scanf("%i",&age);
    
    NSLog(@"Input your weight %@ : ", name);
    scanf("%i",&weight);
    
    NSLog(@"Input your height %@ : ", name);
    scanf("%i",&height);
    
    
}

- (void) printContactInfo{
    NSLog(@"Name : %@\nAge : %i\nWeight : %i\nHeight : %i",name,age,weight,height);
    
}
@end
