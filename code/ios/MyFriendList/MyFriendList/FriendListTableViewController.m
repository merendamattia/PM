//
//  FriendListTableViewController.m
//  MyFriendList
//
//  Created by Simone Cirani on 23/04/21.
//

#import "FriendListTableViewController.h"
#import "FriendList.h"
#import "FriendTableDetailTableViewController.h"

@interface FriendListTableViewController ()

@property (nonatomic, strong) FriendList *friends;

@end

@implementation FriendListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"I miei amici";
    
    self.friends = [[FriendList alloc] init];
    
    [self.friends add:[[Friend alloc] initWithFirstname:@"Beltran" lastname:@"Jendrich" email:@"bjendrich0@dmoz.org"]];
    [self.friends add:[[Friend alloc] initWithFirstname:@"Yale" lastname:@"Hallifax" email:@"yhallifax1@nhs.uk"]];
    [self.friends add:[[Friend alloc] initWithFirstname:@"Adda" lastname:@"Cowlas" email:@"acowlas2@nationalgeographic.com"]];
    [self.friends add:[[Friend alloc] initWithFirstname:@"Rodina" lastname:@"Cornish" email:@"rcornish3@histats.com"]];
    [self.friends add:[[Friend alloc] initWithFirstname:@"Bobbye" lastname:@"Dunkerley" email:@"bdunkerley4@hibu.com"]];
    [self.friends add:[[Friend alloc] initWithFirstname:@"Kincaid" lastname:@"Dunican" email:@"kdunican5@globo.com"]];
    [self.friends add:[[Friend alloc] initWithFirstname:@"Renae" lastname:@"Pedracci" email:@"rpedracci6@simplemachines.org"]];
    [self.friends add:[[Friend alloc] initWithFirstname:@"Langston" lastname:@"McDonell" email:@"lmcdonell7@cam.ac.uk"]];
    [self.friends add:[[Friend alloc] initWithFirstname:@"Noak" lastname:@"Cuppitt" email:@"ncuppitt8@ebay.com"]];
    [self.friends add:[[Friend alloc] initWithFirstname:@"Prentice" lastname:@"Geddes" email:@"pgeddes9@wix.com"]];
    
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
}

@end
