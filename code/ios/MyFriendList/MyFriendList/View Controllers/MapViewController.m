//
//  MapViewController.m
//  MyFriendList
//
//  Created by Simone Cirani on 30/04/21.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "GeoFriend+MapAnnotation.h"
#import "FriendTableDetailTableViewController.h"

@interface MapViewController ()<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (void) centerMapToLocation:(CLLocationCoordinate2D)location
                        zoom:(double)zoom;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mapView.delegate = self;
    
    // i valori di latitudine e longitudine ed il livello di zoom iniziale dovrebbero essere
    // passati esternamente come property (come fatto con la lista degli amici)
    [self centerMapToLocation:CLLocationCoordinate2DMake(44.801700, 10.328012)
                         zoom:0.1];
    
    [self.friends enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[GeoFriend class]]){
            GeoFriend *gf = (GeoFriend *)obj;
            [self.mapView addAnnotation:gf];
        }
    }];
    
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView
             viewForAnnotation:(id<MKAnnotation>)annotation{
    
    static NSString *AnnotationIdentifer = @"MapAnnotationView";
    
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifer];
    
    if(!view){
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                               reuseIdentifier:AnnotationIdentifer];
        view.canShowCallout = YES;
    }
    
    view.annotation = annotation;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
    imageView.image = [UIImage imageNamed:@"userinfo"];
    view.leftCalloutAccessoryView = imageView;
    view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoDark];
    
    return view;
    
}

- (void) mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    if([view.leftCalloutAccessoryView isKindOfClass:[UIImageView class]]){
        UIImageView *imageView = (UIImageView *)view.leftCalloutAccessoryView;
        id<MKAnnotation> annotation = view.annotation;
        if([annotation isKindOfClass:[GeoFriend class]]){
            GeoFriend *gf = (GeoFriend *)annotation;
            if(gf.thumbnail != nil){
                dispatch_queue_t queue = dispatch_queue_create("imageDownload", NULL);
                dispatch_async(queue, ^{
                    NSURL *url = [NSURL URLWithString:gf.thumbnail];
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    UIImage *image = [UIImage imageWithData:data];
                    dispatch_queue_t mainQueue = dispatch_get_main_queue();
                    dispatch_async(mainQueue, ^{
                        imageView.image = image;
                    });
                });
            }
        }
    }
}

- (void) mapView:(MKMapView *)mapView
  annotationView:(MKAnnotationView *)view
calloutAccessoryControlTapped:(UIControl *)control{
    if([control isEqual:view.rightCalloutAccessoryView]){
        [self performSegueWithIdentifier:@"ShowFriendFromMap" sender:view];
    }
}

- (void) centerMapToLocation:(CLLocationCoordinate2D)location
                        zoom:(double)zoom{
    MKCoordinateRegion mapRegion;
    mapRegion.center = location;
    mapRegion.span.latitudeDelta = zoom;
    mapRegion.span.longitudeDelta = zoom;
    [self.mapView setRegion:mapRegion];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowFriendFromMap"]){
        if([segue.destinationViewController isKindOfClass:[FriendTableDetailTableViewController class]]){
            FriendTableDetailTableViewController *vc = (FriendTableDetailTableViewController *)segue.destinationViewController;
            if([sender isKindOfClass:[MKAnnotationView class]]){
                MKAnnotationView *view = (MKAnnotationView *)sender;
                id<MKAnnotation> annotation = view.annotation;
                if([annotation isKindOfClass:[Friend class]]){
                    Friend *f = (Friend *)annotation;
                    vc.theFriend = f;
                }
            }
        }
    }
}

@end
