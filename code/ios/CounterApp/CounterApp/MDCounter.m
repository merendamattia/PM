//
//  MDCounter.m
//  CounterApp
//
//  Created by Mattia Merenda on 14/04/23.
//

#import "MDCounter.h"

NSString *const CounterChangedNotification = @"CounterChangeedNotification";
NSString *const CounterChangedNotificationNewValueKey = @"CounterChangedNotificationNewValueKey";
NSString *const CounterChangedNotificationOldValueKey = @"CounterChangedNotificationOldValueKey";
NSString *const CounterChangedNotificationChangedAtKey = @"CounterChangedNotificationChangedAtKey";

@interface MDCounter()

@property (strong, nonatomic) NSNumber *counter;

@end

@implementation MDCounter

- (instancetype)initWithNumber:(NSNumber *)value{
    if(self = [super init]){
        _counter = @(value.intValue);
    }
    return self;
}

- (instancetype)init{
    return [self initWithNumber:@(0)];
}

- (instancetype)initWithInt:(int)value{
    return [self initWithNumber:@(value)];
}

- (void)increment{
    // increment just invokes setter accessor method, setting new value = old value + 1
    self.counter = @(self.counter.intValue + 1);
}

- (void)reset{
    self.counter = @(0);
}

// the setter not only updates the current value but sends a notification to inform any observer about the change
- (void)setCounter:(NSNumber *)counter{
    // 1) hold a reference to the old value
    NSNumber *oldValue = [self.counter copy];
    // 2) update the value using the instance variable (using the setter would create an infinte loop)
    _counter = @(counter.intValue);
    // 3) create a dictionary with relevant information to be inclded in the notification
    NSDictionary *info = @{
        CounterChangedNotificationNewValueKey: self.counter,    // the new value
        CounterChangedNotificationOldValueKey: oldValue,        // the old value
        CounterChangedNotificationChangedAtKey: [NSDate date]   // the timestamp at which the change occurred
    };
    // send out the notification
    [[NSNotificationCenter defaultCenter] postNotificationName:CounterChangedNotification   // notification name
                                                        object:self                         // notification sender (this object)
                                                      userInfo:info];                       // additional info
}

- (int)value{
    return self.counter.intValue;
}

@end

