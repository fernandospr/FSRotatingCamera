//
//  FSRotatingCamera.m
//  FSRotatingCamera
//
//  Created by Fernando Sproviero on 27/12/13.
//  Copyright (c) 2013 FS. All rights reserved.
//

#import "FSRotatingCamera.h"

#define DEFAULT_HEADING 0
#define DEFAULT_PITCH 45
#define DEFAULT_ALTITUDE 700
#define DEFAULT_HEADING_STEP 10

@interface FSRotatingCamera()

@property (nonatomic, weak) MKMapView *mapView;
@property (nonatomic, assign) BOOL rotating;
@property (nonatomic, assign) double headingStep;

@end

@implementation FSRotatingCamera

- (id)initWithMapView:(MKMapView *)mapView {
    self = [self init];
    if (self) {
        self.rotating = NO;
        self.mapView = mapView;
    }
    return self;
}

- (void)startRotatingWithCoordinate:(CLLocationCoordinate2D)coordinate heading:(CLLocationDirection)heading pitch:(CGFloat)pitch altitude:(CLLocationDistance)altitude headingStep:(double)headingStep {
    MKMapCamera *camera = [MKMapCamera new];
    camera.centerCoordinate = coordinate;
    camera.heading = heading;
    camera.pitch = pitch;
    camera.altitude = altitude;
    [self.mapView setCamera:camera animated:YES];
    self.rotating = YES;
    self.headingStep = headingStep;
}

- (void)startRotatingWithCoordinate:(CLLocationCoordinate2D)coordinate {
    [self startRotatingWithCoordinate:coordinate heading:DEFAULT_HEADING pitch:DEFAULT_PITCH altitude:DEFAULT_ALTITUDE headingStep:DEFAULT_HEADING_STEP];
}

- (void)startRotating {
    [self startRotatingWithCoordinate:self.mapView.centerCoordinate];
}

- (void)stopRotating {
    self.rotating = NO;
}

- (BOOL)isStopped {
    return !self.rotating;
}

- (void)continueRotating {
    MKMapCamera *camera = [self.mapView.camera copy];
    camera.heading = fmod(camera.heading + self.headingStep, 360);
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.mapView.camera = camera;
    } completion:nil];
}

@end
