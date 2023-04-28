//
//  GeoFriend.h
//  MyFriendList
//
//  Created by Simone Cirani on 30/04/21.
//

#import "Friend.h"
#import "Poi.h"

NS_ASSUME_NONNULL_BEGIN

@interface GeoFriend : Friend
// Estende la classe Friend ed include un oggetto Poi

@property (nonatomic, strong) Poi *location;

@end

NS_ASSUME_NONNULL_END
