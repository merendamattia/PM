//
//  MDCounter.h
//  CounterApp
//
//  Created by Mattia Merenda on 14/04/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MDCounter : NSObject

- (instancetype)init;
- (instancetype)initWithValue:(NSNumber *)value;

@property (strong, nonatomic) NSNumber *counter;
@property (readonly) int asInt;
- (void)increment;
- (void)reset;

@end

NS_ASSUME_NONNULL_END
