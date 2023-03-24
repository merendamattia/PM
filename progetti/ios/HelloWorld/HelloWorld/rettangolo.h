#ifndef rettangolo_h
#define rettangolo_h

@interface Rettangolo : NSObject {
    @private
    double _base;
    double _altezza;
}

@property double base;
/*
 Equivale a scrivere questo:
-(double)base;
-(void)setBase:(double)b;
*/
@property double altezza;

@property (readonly) double area;
@property (readonly) double perimetro;

@end


#endif /* rettangolo_h */
