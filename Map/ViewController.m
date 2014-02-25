//
//  ViewController.m
//  Map
//
//  Created by shuichi.wada on 2014/02/24.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nowLocation:(id)sender {
    lm = [[CLLocationManager alloc] init];
    
    lm.delegate = self;
    lm.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    lm.distanceFilter  = kCLDistanceFilterNone;
    
    [lm startUpdatingLocation];
    [lm startUpdatingHeading];
}

- (IBAction)ctrlZoom:(id)sender {
    UISegmentedControl *segment = sender;
    
    switch (segment.selectedSegmentIndex) {
        case 2:
            zoom_lv = 0.003;
            break;
            
        case 1:
            zoom_lv = 0.05;
            break;
            
        case 0:
            zoom_lv = 1.00;
            break;
            
        default:
            zoom_lv = 0.05;
            break;
    }
    
    MKCoordinateRegion region = _mapView.region;
    
    region.center.latitude  = region.center.latitude;
    region.center.longitude = region.center.longitude;
    
    region.span.latitudeDelta  = zoom_lv;
    region.span.longitudeDelta = zoom_lv;
    
    [_mapView setRegion:region animated:YES];
}

- (IBAction)gotoDogenzaka:(id)sender {
    MKCoordinateRegion region = _mapView.region;
    region.center.latitude  = 35.6563344;
    region.center.longitude = 139.69604330000004;
    zoom_lv = 0.003;
    region.span.latitudeDelta  = zoom_lv;
    region.span.longitudeDelta = zoom_lv;
    [_mapView setRegion:region animated:YES];
}

- (IBAction)gotoYoyogi:(id)sender {
    MKCoordinateRegion region = _mapView.region;
    region.center.latitude  = 35.6850911;
    region.center.longitude = 139.70092780000004;
    zoom_lv = 0.003;
    region.span.latitudeDelta  = zoom_lv;
    region.span.longitudeDelta = zoom_lv;
    [_mapView setRegion:region animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation* location = [locations lastObject];
    MKCoordinateRegion region = _mapView.region;
    region.center.latitude  = location.coordinate.latitude;
    region.center.longitude = location.coordinate.longitude;
    
    last_latitude  = region.center.latitude;
    last_longitude = region.center.longitude;
    
    region.span.latitudeDelta  = zoom_lv;
    region.span.longitudeDelta = zoom_lv;
    
    [_mapView setRegion:region animated:YES];
    [lm stopUpdatingLocation];
}



@end
