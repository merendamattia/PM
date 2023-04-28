//
//  FriendDataSource.h
//  MyFriendList
//
//  Created by Simone Cirani on 30/04/21.
//

#import <Foundation/Foundation.h>

#import "FriendList.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FriendDataSource <NSObject>

- (FriendList *) getFriends;

@end

NS_ASSUME_NONNULL_END
