//
//  ViewController.m
//  CounterApp
//
//  Created by Mattia Merenda on 14/04/23.
//

#import "ViewController.h"
#import "MDCounter.h"
#import "SecondViewController.h"

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
    
    self.title = @"First";
    
    self.counterLabel.text = @"-";
    self.counter = [[MDCounter alloc] init];
    
    /*
     Serve per evitare di scrivere ogni volta
        self.counterLabel.text = [NSString stringWithFormat:@"%d", self.counter.asInt];
     la quale istruzione va a modificare il Label del contatore.
     In questo modo devo solo inviare la notifica direttamente dal metodo in MDCounter.m
     */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI:)
                                                 name:CounterChangedNotification
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

// this method is executed when a notification is received; the argument of the method is the notification (instance of NSNotification class)
- (void)updateUI:(NSNotification*)notification{
    
    // the notification argument holds information about the notification that was reeceived
    // property name -> name of the notification (in our case CounterChangedNotification)
    // property userInfo -> NSDictionary of key/value pairs (the keys are defined as global constants in the MDCOunter class interface)
    
    NSLog(@"Received %@. Counter changed %@ -> %@",
          notification.name,    // the name property of the notification (in our case CounterChangedNotification)
          [notification.userInfo objectForKey:CounterChangedNotificationOldValueKey],
          [notification.userInfo objectForKey:CounterChangedNotificationNewValueKey]
          );
    
    // update the UI accordingly
    self.counterLabel.text = [NSString stringWithFormat:@"%d", self.counter.value];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"GoToSecondViewController"]) {
        if([segue.destinationViewController isKindOfClass:[SecondViewController class]]) {
            SecondViewController *svc = (SecondViewController *)segue.destinationViewController;
            svc.data = [NSString stringWithFormat:@"Segue executed at %@", [NSDate date]];
} }
}

@end
