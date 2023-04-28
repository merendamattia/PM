//
//  ExampleFriendDataSource.m
//  MyFriendList
//
//  Created by Simone Cirani on 30/04/21.
//

#import "ExampleFriendDataSource.h"
#import "GeoFriend.h"
#import "Poi.h"

@interface ExampleFriendDataSource()

@property (nonatomic, strong) FriendList *friends;

- (void) addFriends;

@end

@implementation ExampleFriendDataSource

- (instancetype) init {
    if(self = [super init]){
        _friends = [[FriendList alloc] init];
        [self addFriends];
    }
    return self;
}

- (void) addFriends{
    [self.friends add:[[GeoFriend alloc] initWithFirstname:@"Lanna" lastname:@"MacKegg" email:@"lmackegg0@nasa.gov" avatar:@"https://robohash.org/dictateneturin.png?size=120x120&set=set1" thumbnail:@"https://robohash.org/dictateneturin.png?size=36x36&set=set1"]];
    [self.friends add:[[GeoFriend alloc] initWithFirstname:@"Georgina" lastname:@"Escala" email:@"gescala1@reference.com" avatar:@"https://robohash.org/porroquiaet.png?size=120x120&set=set1" thumbnail:@"https://robohash.org/porroquiaet.png?size=36x36&set=set1"]];
    [self.friends add:[[GeoFriend alloc] initWithFirstname:@"Rennie" lastname:@"Barthram" email:@"rbarthram2@yolasite.com" avatar:@"https://robohash.org/autdignissimosdolorem.png?size=120x120&set=set1" thumbnail:@"https://robohash.org/autdignissimosdolorem.png?size=36x36&set=set1"]];
    [self.friends add:[[GeoFriend alloc] initWithFirstname:@"Jenilee" lastname:@"Franscioni" email:@"jfranscioni3@cmu.edu" avatar:@"https://robohash.org/sitrepudiandaemollitia.png?size=120x120&set=set1" thumbnail:@"https://robohash.org/sitrepudiandaemollitia.png?size=36x36&set=set1"]];
    [self.friends add:[[GeoFriend alloc] initWithFirstname:@"Sibelle" lastname:@"Keatley" email:@"skeatley4@csmonitor.com" avatar:@"https://robohash.org/hicconsecteturrem.png?size=120x120&set=set1" thumbnail:@"https://robohash.org/hicconsecteturrem.png?size=36x36&set=set1"]];
    [self.friends add:[[GeoFriend alloc] initWithFirstname:@"Stormie" lastname:@"Colville" email:@"scolville5@patch.com" avatar:@"https://robohash.org/eiusetmaiores.png?size=120x120&set=set1" thumbnail:@"https://robohash.org/eiusetmaiores.png?size=36x36&set=set1"]];
    [self.friends add:[[GeoFriend alloc] initWithFirstname:@"Koressa" lastname:@"Hickeringill" email:@"khickeringill6@instagram.com" avatar:@"https://robohash.org/laudantiumbeataequia.png?size=120x120&set=set1" thumbnail:@"https://robohash.org/laudantiumbeataequia.png?size=36x36&set=set1"]];
    [self.friends add:[[GeoFriend alloc] initWithFirstname:@"Cher" lastname:@"Chapelhow" email:@"cchapelhow7@wisc.edu" avatar:@"https://robohash.org/quodautmagni.png?size=120x120&set=set1" thumbnail:@"https://robohash.org/quodautmagni.png?size=36x36&set=set1"]];
    [self.friends add:[[GeoFriend alloc] initWithFirstname:@"Catherine" lastname:@"Battle" email:@"cbattle8@businessweek.com" avatar:@"https://robohash.org/nampariaturillum.png?size=120x120&set=set1" thumbnail:@"https://robohash.org/nampariaturillum.png?size=36x36&set=set1"]];
    [self.friends add:[[GeoFriend alloc] initWithFirstname:@"Ceciley" lastname:@"Gatherell" email:@"cgatherell9@boston.com" avatar:@"https://robohash.org/remtemporibusvoluptas.png?size=120x120&set=set1" thumbnail:@"https://robohash.org/remtemporibusvoluptas.png?size=36x36&set=set1"]];

    NSArray *pois = [NSArray arrayWithObjects:
        [[Poi alloc] initWithName:@"Campus" latitude:44.7668024 longitude:10.3155069],
        [[Poi alloc] initWithName:@"Parco Ducale" latitude:44.8033536 longitude:10.3180389],
        [[Poi alloc] initWithName:@"Cittadella" latitude:44.794157 longitude:10.3228454],
        [[Poi alloc] initWithName:@"Stazione" latitude:44.803993 longitude:10.3222875],
        [[Poi alloc] initWithName:@"Pilotta" latitude:44.8044041 longitude:10.3238754],
        [[Poi alloc] initWithName:@"Piazza Garibaldi" latitude:44.8022574 longitude:10.3259139],
        [[Poi alloc] initWithName:@"Piazzale Santa Croce" latitude:44.80311 longitude:10.3163867],
        [[Poi alloc] initWithName:@"EFSA" latitude:44.8084917 longitude:10.3210537],
        [[Poi alloc] initWithName:@"Stadio" latitude:44.7946733 longitude:10.333035],
        [[Poi alloc] initWithName:@"Cattedrale" latitude:44.8011418 longitude:10.3279245],
        nil];

    for(int i = 0; i < self.friends.size; i++){
        Friend *f = [self.friends getAtIndex:i];
        if([f isKindOfClass:[GeoFriend class]]){
            GeoFriend *gf = (GeoFriend *)f;
            gf.location = [pois objectAtIndex:i];
        }
    }
}

- (FriendList *)getFriends{
    return self.friends;
}

@end
