//
//  ViewController.m
//  Feet-inches-cm converter
//
//  Created by Adhitya Surya Pratama on 10/30/16.
//  Copyright © 2016 Adhitya Surya Pratama. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *_pickerData;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pickerData = @[@"Select",@"Inch-Centimeters",@"Centimeters-Inch"];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.picker.delegate = self;
    self.picker.dataSource = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _pickerData.count;
    
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _pickerData[row];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(row == 1){
        _resultHeight.text =[NSString stringWithFormat:@"%f",_originalHeight.text.doubleValue * 2.54];
    }
    else if(row == 2){
        _resultHeight.text = [NSString stringWithFormat:@"%f",_originalHeight.text.doubleValue /2.54];
    }
}


@end

