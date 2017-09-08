//
//  CollectionViewCell.h
//  Lab1
//
//  Created by Luke Hansen on 9/7/17.
//  Copyright © 2017 Luke Hansen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

//@property (weak, nonatomic) IBOutlet UIImageView *pokeSprite;
//
//@property (weak, nonatomic) IBOutlet UILabel *pokeNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *pokeSprite;

@property (strong, nonatomic) IBOutlet UILabel *pokeNameLabel;


@end
