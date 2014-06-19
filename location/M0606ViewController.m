//
//  M0606ViewController.m
//  location
//
//  Created by lab506 on 2014/6/7.
//  Copyright (c) 2014年 Mango. All rights reserved.
//

#import "M0606ViewController.h"

@interface M0606ViewController ()

@end

@implementation M0606ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mapView.showsUserLocation=YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.locationManager startUpdatingLocation];
    [self.locationManager startUpdatingHeading];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.locationManager stopUpdatingLocation];
    [self.locationManager stopUpdatingHeading];
}


-(CLLocationManager*)locationManager
{
    if (_locationManager==nil) {
        _locationManager=[CLLocationManager new];
        _locationManager.delegate=self;
    }
    return _locationManager;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CLLocationManDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@",[locations lastObject]);
    //CLLocation *loc=[locations lastObject];
    //str=[NSString stringWithFormat:@"%f",loc.coordinate.latitude];
    //NSLog(@"%@",str);
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"%@",newHeading);
}

- (IBAction)show:(id)sender
{
    MKCoordinateRegion maRegion;
    maRegion=MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 1500, 1500);
    self.mapView.region=maRegion;
    
    //reverse geocode
    CLGeocoder *geocoder=[CLGeocoder new];
    CLLocationCoordinate2D coord=self.mapView.userLocation.coordinate;
    CLLocation *loc=[[CLLocation alloc] initWithLatitude:coord.latitude  longitude:coord.longitude];
    [geocoder reverseGeocodeLocation:loc completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"Geocoder failed. %@",error);
            return;
        }
        self.address.text=[placemarks[0] name];
    }];
}
@end

