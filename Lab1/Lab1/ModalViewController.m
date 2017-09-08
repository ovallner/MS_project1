//
//  ModalViewController.m
//  Lab1
//
//  Created by Oscar on 9/8/17.
//  Copyright © 2017 Luke Hansen. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) NSArray* pickerColorsNames;
@property (strong, nonatomic) NSArray* pickerColors;
@property (strong, nonatomic) UIPickerView* pickerView;
@property (strong, nonatomic) IBOutlet UILabel *stepperValue;
@property (strong, nonatomic) IBOutlet UILabel *sliderValue;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segControlValue;
@property (strong, nonatomic) IBOutlet UILabel *segControlLabel;
@property (nonatomic) NSInteger count;

@property (strong, nonatomic) IBOutlet UILabel *timeCounter;


@end

@implementation ModalViewController

-(UIPickerView*)pickerView{
    if (!_pickerView){
        _pickerView = [[UIPickerView alloc] init];
    }
    return _pickerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.text = @"White";
    self.pickerView.delegate = self;
    UIToolbar* toolBar = [[UIToolbar alloc] init];
    toolBar.barStyle = UIBarStyleDefault;
    toolBar.translucent = YES;
    [toolBar sizeToFit];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] init];
    doneButton.title = @"Done";
    doneButton.style = UIBarButtonItemStylePlain;
    doneButton.target = self;
    doneButton.action = @selector(closePicker:);
    [toolBar setItems:@[doneButton] animated:NO];
    toolBar.userInteractionEnabled = YES;
    self.textField.inputView = self.pickerView;
    self.textField.inputAccessoryView = toolBar;
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(incrementCounter)
                                   userInfo:nil
                                    repeats:YES];
}



- (NSArray*) pickerColors{
    if(!_pickerColors){
        _pickerColors = [NSArray arrayWithObjects:[UIColor whiteColor],[UIColor redColor],[UIColor blueColor],[UIColor yellowColor], nil];
    }
    return _pickerColors;
}

-(NSArray*) pickerColorsNames{
    if(!_pickerColorsNames){
        _pickerColorsNames = @[@"White",@"Red",@"Blue",@"Yellow"];
    }
    return _pickerColorsNames;
}


- (IBAction)closeModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)switchClicked:(UISwitch *)sender {
    if([sender isOn]){
        self.view.backgroundColor = [UIColor yellowColor];
        self.textField.text = @"Yellow";
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
        self.textField.text = @"White";
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Picker Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.pickerColors count];
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.pickerColorsNames[row];

}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.view.backgroundColor = self.pickerColors[row];
    self.textField.text = self.pickerColorsNames[row];
}

-(void) closePicker: (id)sender{
    [self.textField resignFirstResponder];
    //self.pickerView.hidden = YES;
    
    
}
- (IBAction)stepperChanged:(UIStepper *)sender {
    self.stepperValue.text = [NSString stringWithFormat:@"%d",(int)sender.value];
}

- (IBAction)sliderChanged:(UISlider *)sender {
    self.sliderValue.text = [NSString stringWithFormat:@"%d",(int)(sender.value*100-50)];
}

- (IBAction)languageChanged:(UISegmentedControl *)sender {
    
    if(sender.selectedSegmentIndex==0){
        self.segControlLabel.text = @"🍔";
    } else {
        self.segControlLabel.text = @"🌮";
    }
}

-(void)incrementCounter {
    self.count++;
    self.timeCounter.text = [NSString stringWithFormat:@"%ld", self.count];
}




@end
