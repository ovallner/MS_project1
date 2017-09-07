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
        NSError *e = nil;
        NSMutableString *urlString;
        NSURL *url;
        NSData *data;
        for(int i = 1; i <=5; i++){
            NSDictionary *pokemonDict;
            urlString = [NSMutableString stringWithFormat:@"https://pokeapi.co/api/v2/pokemon/%d/", i];
            url = [NSURL URLWithString:urlString];

            data = [NSData dataWithContentsOfURL:url];
            pokemonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&e];
            [_pokemonData addObject:pokemonDict];
            //NSLog(@"%@", _pokemonData[i-1][@"name"]);
            
        }
    }
    return _pokemonData;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSLog(@"asdf %@", self.pokemonData[3][@"name"]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
