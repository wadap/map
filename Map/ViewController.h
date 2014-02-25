//
//  ViewController.h
//  Map
//
//  Created by shuichi.wada on 2014/02/24.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>{
    CLLocationManager *lm;
    double zoom_lv;
    double last_latitude;
    double last_longitude;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *select_zoom;

- (IBAction)nowLocation:(id)sender;
- (IBAction)ctrlZoom:(id)sender;


- (IBAction)gotoDogenzaka:(id)sender;
- (IBAction)gotoYoyogi:(id)sender;

@end
