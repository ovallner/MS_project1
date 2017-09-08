//
//  DataModel.m
//  Lab1
//
//  Created by Oscar on 9/8/17.
//  Copyright © 2017 Luke Hansen. All rights reserved.
//

#import "DataModel.h"

@interface DataModel ()

@end

@implementation DataModel

+(DataModel*)sharedInstance{
    static DataModel * _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate,^{
        _sharedInstance = [[DataModel alloc] init];
    });
    return _sharedInstance;
}

-(NSMutableArray*)pokemonData{
    if(! _pokemonData) {
        _pokemonData = [[NSMutableArray alloc] init];
        NSMutableString *urlString;
        NSURL *url;
        
        NSURLSessionConfiguration *defaultConfiguration;
        NSURLSession *sessionWithoutADelegate;
        
        for(int i = 1; i <=20; i++){
            
            urlString = [NSMutableString stringWithFormat:@"https://pokeapi.co/api/v2/pokemon/%d/", i];
            url = [NSURL URLWithString:urlString];
            
            defaultConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
            sessionWithoutADelegate = [NSURLSession sessionWithConfiguration:defaultConfiguration];
            
            [[sessionWithoutADelegate dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                NSLog(@"Completed a url request");
                if(error)
                    NSLog(@"%@", error);
                else{
                    NSDictionary __block *pokemonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
                    [_pokemonData addObject:pokemonDict];
                }
            }] resume];
        }
    }
    return _pokemonData;
}

-(NSDictionary*)getPokemonByID: (int) idNum {
    for(int i = 0; i < [self.pokemonData count]; i++){
        if(idNum == [self.pokemonData[i][@"id"] integerValue]) {
            return self.pokemonData[i];
        }
    }
    return nil;
}


@end
