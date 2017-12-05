//
//  ViewController.h
//  Feet-Inches-Cm using PickerView
//
//  Created by Adhitya Surya Pratama on 12/5/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (weak, nonatomic) IBOutlet UITextField *originalHeight;
@property (weak, nonatomic) IBOutlet UITextField *resultHeight;


@end

