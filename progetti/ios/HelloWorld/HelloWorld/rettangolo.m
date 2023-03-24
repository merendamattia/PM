#import <Foundation/Foundation.h>
#import "rettangolo.h"

@implementation Rettangolo

// getter & setter
@synthesize base = _base;
@synthesize altezza = _altezza;

// costruttore
- (id) base:(double)base altezza:(double)altezza{
    _base = base;
    _altezza = altezza;
    return self;
}

-(double)area{
    return _base * _altezza;
}

-(double)perimetro{
    return (_base + _altezza) * 2;
}

@end
