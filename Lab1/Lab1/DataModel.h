//
//  DataModel.h
//  Lab1
//
//  Created by Oscar on 9/8/17.
//  Copyright © 2017 Luke Hansen. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface DataModel : UIResponder <UIApplicationDelegate>
+(DataModel*) sharedInstance;
-(NSDictionary*) getPokemonByID: (int) idNum;
@property (strong, nonatomic) NSMutableArray *pokemonData;
@end
