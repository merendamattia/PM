//
//  FriendListTableViewController.m
//  MyFriendList
//
//  Created by Simone Cirani on 23/04/21.
//

#import "FriendListTableViewController.h"
#import "FriendList.h"
#import "FriendTableDetailTableViewController.h"
#import "GeoFriend.h"
#import "MapViewController.h" 

#import "ExampleFriendDataSource.h"

@interface FriendListTableViewController ()

@property (nonatomic, strong) FriendList *friends;

@end

@implementation FriendListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"I miei amici";
    self.dataSource = [[ExampleFriendDataSource alloc] init];
    if(self.dataSource != nil){
        self.friends = [self.dataSource getFriends];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friends.size;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell" forIndexPath:indexPath];
    Friend *f = [self.friends getAtIndex:indexPath.row];
    // Configure the cell...
    cell.textLabel.text = f.displayName;
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowFriendDetail"]){
        if([segue.destinationViewController isKindOfClass:[FriendTableDetailTableViewController class]]){
            FriendTableDetailTableViewController *vc = (FriendTableDetailTableViewController *)segue.destinationViewController;
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            Friend *f = [self.friends getAtIndex:indexPath.row];
            vc.theFriend = f;
        }
    }
    if([segue.identifier isEqualToString:@"ShowMap"]){
        if([segue.destinationViewController isKindOfClass:[MapViewController class]]){ // Devo importare MapViewController.h
            MapViewController *vc = (MapViewController *)segue.destinationViewController;
            NSMutableArray *mArray = [[NSMutableArray alloc] init];
            [[self.friends getAll] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if([obj isKindOfClass:[GeoFriend class]]){
                     [mArray addObject:obj];
                }
            }];
            vc.friends = mArray;
        }
    }
}

@end
