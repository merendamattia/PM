//
//  FriendTableDetailTableViewController.h
//  MyFriendList
//
//  Created by Simone Cirani on 23/04/21.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendTableDetailTableViewController : UITableViewController

@property (nonatomic, strong) Friend *theFriend;

@end

NS_ASSUME_NONNULL_END
