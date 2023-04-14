//
//  MDCounter.m
//  CounterApp
//
//  Created by Mattia Merenda on 14/04/23.
//

#import "MDCounter.h"

@implementation MDCounter

- (instancetype)initWithValue:(NSNumber *)value{
    if(self = [super init]){
        _counter = @(value.intValue);
    }
    return self;
}

- (instancetype)init{
    return [self initWithValue:@(0)];
}

- (void)increment{
    self.counter = @(self.counter.intValue + 1);
    
    // Invio la notifica
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CounterChanged"
                                                        object:self];
}

- (void)reset{
    self.counter = @(0);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CounterChanged"
                                                        object:self];
}

-(int)asInt{
    return self.counter.intValue;
}


@end
