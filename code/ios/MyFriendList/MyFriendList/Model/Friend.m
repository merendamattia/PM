//
//  Friend.m
//  MyFriendList
//
//  Created by Simone Cirani on 23/04/21.
//

#import "Friend.h"

@implementation Friend

- (instancetype)initWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname
                            email:(NSString *)email{
    if(self = [super init]){
        _firstname = [firstname copy];
        _lastname = [lastname copy];
        _email = [email copy];
    }
    return self;
}

- (instancetype)initWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname{
    return [self initWithFirstname:firstname
                          lastname:lastname
                             email:@""];
}

- (NSString *)displayName{
    return [NSString stringWithFormat:@"%@ %@", self.firstname, self.lastname];
}

@end
