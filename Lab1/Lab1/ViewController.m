//
//  ViewController.m
//  Lab1
//
//  Created by Luke Hansen on 9/5/17.
//  Copyright © 2017 Luke Hansen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray *pokemonData;


@end

@implementation ViewController

-(NSMutableArray*)pokemonData{
    if(!_pokemonData) {
        _pokemonData = [NSMutableArray new];
        NSMutableString *urlString;
        NSURL *url;
        /*NSDictionary *emptyDict = [[NSMutableDictionary init] alloc];
        for(int i =0; i < 20; i++){
            [_pokemonData addObject: emptyDict];
        }*/
        for(int i = 1; i <=20; i++){
            
            urlString = [NSMutableString stringWithFormat:@"https://pokeapi.co/api/v2/pokemon/%d/", i];
            url = [NSURL URLWithString:urlString];
            NSURLSessionConfiguration *defaultConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
            NSURLSession *sessionWithoutADelegate = [NSURLSession sessionWithConfiguration:defaultConfiguration];
            
            [[sessionWithoutADelegate dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                if(error)
                    NSLog(@"%@", error);
                else{
                    NSDictionary __block *pokemonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
                    [_pokemonData addObject:pokemonDict];
                    //_pokemonData[i] = pokemonDict;
                }
            }] resume];
            
            
            
        }
    }
    return _pokemonData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"I sleep");
    
    
    NSDate *methodStart = [NSDate date];
    
    /* ... Do whatever you need to do ... */
    
    while([self.pokemonData count] < 20) {
        [NSThread sleepForTimeInterval:1.0f];
    }
    
    NSDate *methodFinish = [NSDate date];
    NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
    NSLog(@"executionTime of = %f", executionTime);
    
    
    NSLog(@"asdf %@", self.pokemonData[19][@"name"]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
