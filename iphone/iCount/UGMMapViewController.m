//
//  UGMMapViewController.m
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import "UGMMapViewController.h"
#import "UGMAnnotation.h"
#import "MKMapView+Zooming.h"

@interface UGMMapViewController ()

@end

@implementation UGMMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Map";
    // Do any additional setup after loading the view.
    self.mapView.showsUserLocation = YES;
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.delegate = self;
    
    // center on seattle
    CLLocationDegrees lat = 47.598900;
    CLLocationDegrees lon = -122.321692;
    CLLocation *someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    
    // Create annotations
    UGMAnnotation *annotation = [[UGMAnnotation alloc]init];
    annotation.coordinate = someLocation.coordinate;
    annotation.subtitle = @"Jan 2nd - I5 Bridge";
    annotation.title = @"Josh S.";
    annotation.image = @"doorway";
    [self.mapView addAnnotation:annotation];
    
    lat = 47.598448;
    lon = -122.325624;
    someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    
    annotation = [[UGMAnnotation alloc]init];
    annotation.coordinate = someLocation.coordinate;
    annotation.subtitle = @"April 3rd - Hing Hay Park";
    annotation.title = @"Jesus J.";
    annotation.image = @"van_small";
    [self.mapView addAnnotation:annotation];
    
    lat = 47.600988;
    lon = -122.324615;
    someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    
    annotation = [[UGMAnnotation alloc]init];
    annotation.coordinate = someLocation.coordinate;
    annotation.subtitle = @"June 7th - Yesler Overpass";
    annotation.title = @"Karen A.";
    annotation.image = @"van_small";
    [self.mapView addAnnotation:annotation];
    
    lat = 47.600648;
    lon = -122.332962;
    someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];

    annotation = [[UGMAnnotation alloc]init];
    annotation.coordinate = someLocation.coordinate;
    annotation.subtitle = @"March 4th - Red Square";
    annotation.title = @"Igor L. ";
    annotation.image = @"doorway";
    [self.mapView addAnnotation:annotation];
    [self.mapView zoomToFitAnnotationsAnimated:YES];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If the annotation is the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    }
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[UGMAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKAnnotationView*    pinView = (MKAnnotationView*)[mapView
                                                                 dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                      reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.canShowCallout = YES;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            button.frame = CGRectMake(0, 0, 23, 23);
            pinView.rightCalloutAccessoryView = button;
            NSString *imageValue = ((UGMAnnotation*)annotation).image;
            UIImage *imageToUse =[UIImage imageNamed:imageValue];
            pinView.image = imageToUse;
            
            //
            UIView *leftCAV = [[UIView alloc] initWithFrame:CGRectMake(0,0,23,23)];
            //[leftCAV addSubview : [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"van"]]];
//            [leftCAV addSubview : yourFirstLabel];
//            [leftCAV addSubview : yourSecondLabel];
            pinView.leftCalloutAccessoryView = leftCAV;

        }
        else{
            pinView.annotation = annotation;
        }
        
        return pinView;
    }
    
    return nil;
}

-(void)calloutTapped:(MKPinAnnotationView*)pinView{
    [self performSegueWithIdentifier:@"ShowReportSegue" sender:pinView];
}

- (void)mapView:(MKMapView *)map annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    [self performSegueWithIdentifier:@"ShowReportSegue" sender:view];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
