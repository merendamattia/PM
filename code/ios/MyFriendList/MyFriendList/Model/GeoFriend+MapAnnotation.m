//
//  GeoFriend+MapAnnotation.m
//  MyFriendList
//
//  Created by Simone Cirani on 30/04/21.
//

#import "GeoFriend+MapAnnotation.h"

@implementation GeoFriend (MapAnnotation)

- (CLLocationCoordinate2D)coordinate{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = self.location.latitude;
    coordinate.longitude = self.location.longitude;
    return coordinate;
}

- (NSString *)title{
    return self.displayName;
}

- (NSString *)subtitle{
    return [NSString stringWithFormat:@"last seen @ %@",self.location.name];
}

@end
