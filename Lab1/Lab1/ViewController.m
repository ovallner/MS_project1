//
//  ViewController.m
//  Lab1
//
//  Created by Luke Hansen on 9/5/17.
//  Copyright © 2017 Luke Hansen. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"
#import "ModalViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [DataModel sharedInstance].pokemonData;
    
    
}

-(void)showModal:(id)sender {
    ModalViewController *modalView = [[ModalViewController alloc] init];
    
    modalView.modalPresentationStyle = UIModalPresentationFormSheet;
    modalView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:modalView animated:YES completion:nil];
}

-(void)logTimerCompletion {
    NSLog(@"Timer finished!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
