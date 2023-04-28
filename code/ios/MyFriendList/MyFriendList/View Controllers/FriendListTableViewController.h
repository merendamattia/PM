//
//  FriendListTableViewController.h
//  MyFriendList
//
//  Created by Simone Cirani on 23/04/21.
//

#import <UIKit/UIKit.h>
#import "FriendDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendListTableViewController : UITableViewController

@property (nonatomic, strong) id<FriendDataSource> dataSource;

@end

NS_ASSUME_NONNULL_END
