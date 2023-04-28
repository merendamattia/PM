//
//  Poi.h
//  MyFriendList
//
//  Created by Simone Cirani on 30/04/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
// Se utilizzo queste due "guardie" mi aspetto di non avere valori nulli

@interface Poi : NSObject

- (instancetype) initWithName:(NSString *)name
                     latitude:(double)latitude
                    longitude:(double)longitude;

// Solo l'inizializzatore puo' fare un set delle variabili perche' queste sono readonly
@property (nonatomic, strong) NSString *name;
@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;

@end

NS_ASSUME_NONNULL_END
