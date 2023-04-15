//
//  MDCounter.h
//  CounterApp
//
//  Created by Mattia Merenda on 14/04/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Costanti globali per le notifiche
extern NSNotificationName const CounterChangedNotification;
extern NSString *const CounterChangedNotificationNewValueKey;
extern NSString *const CounterChangedNotificationOldValueKey;
extern NSString *const CounterChangedNotificationChangedAtKey;


@interface MDCounter : NSObject

- (instancetype)init;
- (instancetype)initWithNumber:(NSNumber *)value;
- (instancetype)initWithInt:(int)value;

@property (readonly) int value;
- (void)increment;
- (void)reset;

@end

NS_ASSUME_NONNULL_END
