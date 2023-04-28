//
//  Friend.h
//  MyFriendList
//
//  Created by Simone Cirani on 23/04/21.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

- (instancetype)initWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname
                            email:(NSString *)email
                           avatar:(NSString *)avatar
                        thumbnail:(NSString *)thumbnail;

- (instancetype)initWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname
                            email:(NSString *)email
                           avatar:(NSString *)avatar;

- (instancetype)initWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname
                            email:(NSString *)email;

- (instancetype)initWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname;

@property (nonatomic, strong) NSString *firstname;
@property (nonatomic, strong) NSString *lastname;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *thumbnail;

@property (nonatomic, readonly) NSString *displayName;

@end
