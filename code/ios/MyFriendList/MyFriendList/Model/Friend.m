//
//  Friend.m
//  MyFriendList
//
//  Created by Simone Cirani on 23/04/21.
//

#import "Friend.h"

@implementation Friend

// Inizializzatore che prende tutti i parametri
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

// Inizializzatore che prende tutti i parametri tranne thumbnail (miniatura)
// Posso fare thumbnail:nil perchè ho rimosso le "guardie" dal file interfaccia
// NS_ASSUME_NONNULL_BEGIN ad inizio interfaccia
// NS_ASSUME_NONNULL_END a fine interfaccia
// Se utilizzo queste due "guardie" mi aspetto di non avere valori nulli
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

// Inizializzatore con solo nome, cognome ed email
// Vale lo stesso discorso anche qui
- (instancetype)initWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname
                            email:(NSString *)email{
    return [self initWithFirstname:firstname
                          lastname:lastname
                             email:email
                            avatar:nil];
}
// Inizializzatore con solo nome e cognome
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
