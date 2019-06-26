//
//  ViewController.m
//  Tip Calculator
//
//  Created by samason1 on 6/25/19.
//  Copyright © 2019 samason1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipField;
@property (weak, nonatomic) IBOutlet UILabel *totalField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onTap:(id)sender {
    //Checkking to see if trigger works by printing hello in command line
    //NSLog(@"Hello");
    
    //YES = true ; NO = false
    [self.view endEditing : YES];
    
}
- (IBAction)onEdit:(id)sender {
    
    double bill = [self.billLabel.text doubleValue];
    
    //NS = Next Step
    //asterick (*) - everything that is not a primitive type (number) at declaration has to have a star in front
    //NSArrays can only contain objects; @() is short way for creating an object called an NS number
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill+ tip;
    
    
    self.tipField.text= [NSString stringWithFormat:@"%.2f", tip];
    self.totalField.text= [NSString stringWithFormat:@"%.2f", total];
    
}

- (IBAction)onEditBegin:(id)sender {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billLabel.frame = CGRectMake(self.billLabel.frame.origin.x, self.billLabel.frame.origin.y + 30, self.billLabel.frame.size.width, self.billLabel.frame.size.height);
    }];
    
    [UIView animateWithDuration:1 animations:^{
        //0 = not visible; 1 = visible
        self.tipField.alpha = 0;
    }];
}
- (IBAction)onEditEnd:(id)sender {
    
    CGRect newFrame = self.billLabel.frame;
    newFrame.origin.y -= 30;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billLabel.frame=newFrame;
    }];
    
    [UIView animateWithDuration:1 animations:^{
        //0 = not visible; 1 = visible
        self.tipField.alpha = 1;
    }];
}

@end
