//
//  TableViewController.m
//  Lab1
//
//  Created by Luke Hansen on 9/7/17.
//  Copyright © 2017 Luke Hansen. All rights reserved.
//

#import "TableViewController.h"
#import "DataModel.h"

@interface TableViewController ()
@property (weak,nonatomic) DataModel* dataModel;
@end

@implementation TableViewController

-(DataModel*) dataModel {
    if(!_dataModel){
        _dataModel = [DataModel sharedInstance];
    }
    return _dataModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCell" forIndexPath:indexPath];
    UITableViewCell *cell = nil;
    
    if(indexPath.section==0){
        cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell" forIndexPath:indexPath];
        cell.textLabel.text = @"Name";
        cell.detailTextLabel.text = self.dataModel.pokemonData[self.pokeIndex.row][@"name"];
    } else if (indexPath.section==1){
        cell = [tableView dequeueReusableCellWithIdentifier:@"NumberCell" forIndexPath:indexPath];
        cell.textLabel.text = @"Pokedex Number";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",self.dataModel.pokemonData[self.pokeIndex.row][@"id"]];
    } else if (indexPath.section==2){
        cell = [tableView dequeueReusableCellWithIdentifier:@"HeightCell" forIndexPath:indexPath];
        cell.textLabel.text = @"Height";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",self.dataModel.pokemonData[self.pokeIndex.row][@"height"]];
    } else if (indexPath.section==3){
        cell = [tableView dequeueReusableCellWithIdentifier:@"WeightCell" forIndexPath:indexPath];
        cell.textLabel.text = @"Weight";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",self.dataModel.pokemonData[self.pokeIndex.row][@"weight"]];
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
