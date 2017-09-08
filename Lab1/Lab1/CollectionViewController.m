//
//  CollectionViewController.m
//  Lab1
//
//  Created by Luke Hansen on 9/6/17.
//  Copyright © 2017 Luke Hansen. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "SearchCollectionReusableView.h"
#import "TableViewController.h"
#import "DataModel.h"
@interface CollectionViewController () <UISearchBarDelegate, UICollectionViewDelegate>
@property (strong, nonatomic) DataModel* dataModel;
@end

@implementation CollectionViewController

-(DataModel *)dataModel{
    if(!_dataModel){
        _dataModel = [DataModel sharedInstance];
    }
    return _dataModel;
}

static NSString * const reuseIdentifier = @"CollectCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    BOOL isVC = [[segue destinationViewController] isKindOfClass:[TableViewController class]];
    
    if(isVC){
        CollectionViewCell* cell = (CollectionViewCell*)sender;
        TableViewController *tVc = [segue destinationViewController];
        tVc.pokeIndex = [self.collectionView indexPathForCell:cell];
    }
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%lu",(unsigned long)[self.dataModel.pokemonData count]);
    return [self.dataModel.pokemonData count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.pokeSprite.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.dataModel.pokemonData[indexPath.row][@"id"]]];
    cell.pokeNameLabel.text = self.dataModel.pokemonData[indexPath.row][@"name"];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionViewHeader" forIndexPath:indexPath];
        return headerView;
    }
    
    return [[SearchCollectionReusableView alloc] init];
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

#pragma mark <UISearchBarDelegate>

-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    //sort by whats in the search bar
    if(searchBar.text!=nil || ![searchBar.text isEqual:@""]){
        [self.collectionView reloadData];
    }
}

//- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    TableViewController* tVc = [self.storyboard instantiateViewControllerWithIdentifier:@"PokePage"];
//    tVc.pokeIndex = indexPath;
//    [self.navigationController pushViewController:tVc animated:YES];
//}


@end
