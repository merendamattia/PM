//
//  FriendList.m
//  MyFriendList
//
//  Created by Simone Cirani on 23/04/21.
//

#import "FriendList.h"

@interface FriendList ()

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation FriendList

- (instancetype)init{
    if(self = [super init]){
        _list = [[NSMutableArray alloc] init];
    }
    return self;
}

- (long)size{
    return self.list.count;
}

- (NSArray *)getAll{
    return self.list;
}

- (void)add:(Friend *)f{
    [self.list addObject:f];
}

- (Friend *)getAtIndex:(NSInteger)index{
    return [self.list objectAtIndex:index];
}

@end
