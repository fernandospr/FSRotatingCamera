//
//  FSViewController.m
//  FSRotatingCameraExample
//
//  Created by Fernando Sproviero on 27/12/13.
//  Copyright (c) 2013 FS. All rights reserved.
//

#import "FSViewController.h"
#import "FSRotatingCamera.h"

#define DEFAULT_COORDINATE CLLocationCoordinate2DMake(37.78275123, -122.40416442)

@interface FSViewController()<MKMapViewDelegate>

@property (nonatomic, strong) FSRotatingCamera *rotCamera;
@property (nonatomic, assign) BOOL rotating;

@end

@implementation FSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.startStopRotating setTitle:@"Start" forState:UIControlStateNormal];

    self.mapView.centerCoordinate = DEFAULT_COORDINATE;
    self.mapView.delegate = self;
    self.mapView.showsBuildings = YES;
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = DEFAULT_COORDINATE;
    annotationPoint.title = @"Center";
    [self.mapView addAnnotation:annotationPoint];
    
    self.rotCamera = [[FSRotatingCamera alloc] initWithMapView:self.mapView];
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    if ([self.rotCamera isStopped] == NO) {
        [self.rotCamera continueRotating];
    }
}

- (IBAction)startStopAction:(id)sender {
    if ([self.startStopRotating.titleLabel.text isEqualToString:@"Start"] == YES) {
        [self.startStopRotating setTitle:@"Stop" forState:UIControlStateNormal];
        [self.rotCamera startRotatingWithCoordinate:DEFAULT_COORDINATE];
    } else {
        [self.startStopRotating setTitle:@"Start" forState:UIControlStateNormal];
        [self.rotCamera stopRotating];
    }
}

@end
