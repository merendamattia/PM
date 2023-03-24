#import "rettangolo.m"

#import <Foundation/Foundation.h>

int main() {
    
    Rettangolo *test = [[Rettangolo alloc] base:10 altezza:5];
    
    NSLog(@"%f", [test area]);
    NSLog(@"%f", [test perimetro]);
    
    /*
    printf("Area: %f", [test area]);
    printf("Perimetro: %f", [test perimetro]);
    */
    
    return 0;
}
