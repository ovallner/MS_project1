//
//  ViewController.m
//  Lab1
//
//  Created by Luke Hansen on 9/5/17.
//  Copyright © 2017 Luke Hansen. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [DataModel sharedInstance].pokemonData;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
