//
//  Person.h
//  Contact
//
//  Created by Adhitya Surya Pratama on 8/30/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    NSString *name;
    int age;
    int weight;
    int height;
    NSString *phoneNumber;
}

- (void) printContactInfo;
- (void) insertContactInfo;

@end
