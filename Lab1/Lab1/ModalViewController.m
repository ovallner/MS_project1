//
//  ModalViewController.m
//  Lab1
//
//  Created by Oscar on 9/8/17.
//  Copyright © 2017 Luke Hansen. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeCounter;
@property (nonatomic) NSInteger count;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(incrementCounter)
                                   userInfo:nil
                                    repeats:YES];

}
- (IBAction)closeModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)switchClicked:(UISwitch *)sender {
    if([sender isOn]){
        self.view.backgroundColor = [UIColor yellowColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)count {
    if(!_count)
        _count = 0;
    return _count;
}

-(void)incrementCounter {
    self.count++;
    self.timeCounter.text = [NSString stringWithFormat:@"%ld", self.count];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
