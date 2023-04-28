//
//  FriendTableDetailTableViewController.m
//  MyFriendList
//
//  Created by Simone Cirani on 23/04/21.
//

#import "FriendTableDetailTableViewController.h"

@interface FriendTableDetailTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firstnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

- (void)loadAvatar;

@end

@implementation FriendTableDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.theFriend.displayName;
    self.firstnameLabel.text = self.theFriend.firstname;
    self.lastnameLabel.text = self.theFriend.lastname;
    self.emailLabel.text = self.theFriend.email;
    self.avatarImageView.image = [UIImage imageNamed:@"userinfo"];
    [self loadAvatar];
    
}

- (void) loadAvatar{
    if(self.theFriend.avatar != nil){
        dispatch_async(dispatch_queue_create("avatarDownload", NULL), ^{
            NSURL *url = [NSURL URLWithString:self.theFriend.avatar];
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.avatarImageView.image = image;
            });
        });
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch(section){
        case 0: return @"Avatar";
        case 1: return @"Dati anagrafici";
        case 2: return @"Contatti";
        default: return nil;
    }
}

@end
