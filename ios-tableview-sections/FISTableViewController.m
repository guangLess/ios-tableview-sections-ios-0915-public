//
//  FISTableViewController.m
//  ios-tableview-sections
//
//  Created by Tom OMalley on 5/28/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISTableViewController.h"
#import "FISStudent.h"

@interface FISTableViewController ()

@property(strong,nonatomic)NSArray * students;

@end

@implementation FISTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FISStudent * guang = [[FISStudent alloc] init];
    guang.favoriteThings = @[@"making art things",@"playing silly with shane",@"",@""];
    guang.name = @"guang";
    FISStudent * ari = [[FISStudent alloc] init];
    ari.favoriteThings = @[@"finding ari", @"being a yummy bottle of water",@""];
    ari.name = @"ari";
    FISStudent * olivia = [[FISStudent alloc] init];
    olivia.favoriteThings = @[@"writing art papers",@"taking art history classes"];
    olivia.name = @"olivia";
    self.students = @[guang, ari, olivia];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return (int)self.students.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    FISStudent *student = [self.students objectAtIndex:(NSUInteger)section];
    NSInteger studentSum = (NSInteger)student.favoriteThings.count;
    
    return studentSum;

}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    FISStudent * student = [self.students objectAtIndex:(NSUInteger)section];
    
    return student.name;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"expandingCell" forIndexPath:indexPath];
    
    NSInteger * studentIndex = indexPath.row;
    NSInteger * testIndex = indexPath.section;
    NSLog(@"studentIndex %lu testindex %lu",studentIndex,testIndex);
    
    FISStudent * testStudent = [[FISStudent alloc] init];
    testStudent = self.students[(NSUInteger)testIndex];
    
    //NSIndexPath * fav = tableView.indexPathsForSelectedRows;
    
    cell.textLabel.text = testStudent.favoriteThings[(NSUInteger)studentIndex];
    
    
     //FISStudent * test = self.students[0];
    
    //cell.textLabel.text = @"Hello";
    
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
