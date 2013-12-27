//
//  FSRotatingCamera.h
//  FSRotatingCamera
//
//  Created by Fernando Sproviero on 27/12/13.
//  Copyright (c) 2013 FS. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface FSRotatingCamera : NSObject

- (id)initWithMapView:(MKMapView *)mapView;

// Starts rotating the camera around the current MKMapView centerCoordinate
- (void)startRotating;

// Starts rotating the camera around the coordinate
- (void)startRotatingWithCoordinate:(CLLocationCoordinate2D)coordinate;

// Starts rotating the camera around the coordinate, using heading, pitch, altitude and headingStep
- (void)startRotatingWithCoordinate:(CLLocationCoordinate2D)coordinate heading:(CLLocationDirection)heading pitch:(CGFloat)pitch altitude:(CLLocationDistance)altitude headingStep:(double)headingStep;

// Should be called in your MKMapView's delegate method, mapView:regionDidChangeAnimated:
- (void)continueRotating;

// Will stop rotating the camera
// You will have to call any of the startRotating methods to start again.
- (void)stopRotating;

- (BOOL)isStopped;

@end
