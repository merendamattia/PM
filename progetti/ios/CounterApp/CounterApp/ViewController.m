//
//  ViewController.m
//  CounterApp
//
//  Created by Mattia Merenda on 14/04/23.
//

#import "ViewController.h"
#import "MDCounter.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (strong, nonatomic) MDCounter *counter;
@end

@implementation ViewController

// Lavoriamo sempre con `self`
// Quindi non usiamo `_counter` ma `self.counter`
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.counterLabel.text = @"-";
    self.counter = [[MDCounter alloc] init];
    
    /*
     Serve per evitare di scrivere ogni volta
        self.counterLabel.text = [NSString stringWithFormat:@"%d", self.counter.asInt];
     la quale istruzione va a modificare il Label del contatore.
     In questo modo devo solo inviare la notifica direttamente dal metodo in MDCounter.m
     */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:@"CounterChanged"
                                               object:self.counter];
    
}

//IBAction = void
- (IBAction)buttonTapped:(UIButton *)sender {
    NSLog(@"Tapped event!"); // Stampa log nella console
    
    [self.counter increment];
    // equivalente a: self setCounter:@(self.counter.intValue + 1);
    
    // self.counterLabel.text = [NSString stringWithFormat:@"%d", self.counter.asInt];
}

- (IBAction)buttonResetCounter:(UIButton *)sender {
    NSLog(@"Counter reset!");
    [self.counter reset];
    
    // self.counterLabel.text = [NSString stringWithFormat:@"%d", self.counter.asInt];
}

- (void)updateUI{
    self.counterLabel.text = [NSString stringWithFormat:@"%d", self.counter.asInt];
}

// Override metodo setCounter
/*
- (void)setCounter:(NSNumber *)counter{
    _counter = @(_counter.intValue + 1);
    self.counterLabel.text = [NSString stringWithFormat:@"%d", _counter.intValue];
}*/

@end
