//
//  main.m
//  Contact
//
//  Created by Adhitya Surya Pratama on 8/30/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        char next;
        NSMutableArray *people  = [[NSMutableArray alloc] init];
        do{
            Person *newPerson = [[Person alloc] init];
            [newPerson insertContactInfo];
            [newPerson printContactInfo];
            
            [people addObject:newPerson];
            
            NSLog(@"Do you want to input the next contact [y\n] ? :");
            scanf("\n%c",&next);
            
            
        }while(next == 'y');
        NSLog(@"Count: %li",[people count]);
        for (Person *sperson in people) {
            [sperson printContactInfo];
        }
        // insert code here...
        
        /* int weight = 50;
         NSString *weightString = [ NSString stringWithFormat:@"Your weight is %i", weight] ;
         NSLog(@"%@",weightString);
         
         char name[50];
         scanf("%s",name);
         
         NSString *name_string = [NSString stringWithCString:name encoding:1];
         NSLog(@"My name is %@",name_string);
         */
    }
    return 0;
}
