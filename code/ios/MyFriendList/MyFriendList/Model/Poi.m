//
//  Poi.m
//  MyFriendList
//
//  Created by Simone Cirani on 30/04/21.
//

#import "Poi.h"

@implementation Poi

- (instancetype) initWithName:(NSString *)name
                     latitude:(double)latitude
                    longitude:(double)longitude{
    if(self = [super init]){
        _name = [name copy];
        _latitude = latitude;
        _longitude = longitude;
    }
    return self;
}

@end
