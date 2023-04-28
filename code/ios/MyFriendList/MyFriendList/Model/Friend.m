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
                            email:(NSString *)email
                           avatar:(NSString *)avatar
                        thumbnail:(NSString *)thumbnail{
    if(self = [super init]){
        _firstname = [firstname copy];
        _lastname = [lastname copy];
        _email = [email copy];
        _avatar = [avatar copy];
        _thumbnail = [thumbnail copy];
    }
    return self;
}

- (instancetype)initWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname
                            email:(NSString *)email
                           avatar:(NSString *)avatar{
    return [self initWithFirstname:firstname
                          lastname:lastname
                             email:email
                            avatar:avatar
                         thumbnail:nil];
}

- (instancetype)initWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname
                            email:(NSString *)email{
    return [self initWithFirstname:firstname
                          lastname:lastname
                             email:email
                            avatar:nil];
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
