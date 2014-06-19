//
//  M0606ViewController.h
//  location
//
//  Created by lab506 on 2014/6/7.
//  Copyright (c) 2014年 Mango. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface M0606ViewController : UIViewController <CLLocationManagerDelegate>
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)show:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *address;

@end
