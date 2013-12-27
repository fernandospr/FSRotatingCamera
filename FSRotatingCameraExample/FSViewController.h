//
//  FSViewController.h
//  FSRotatingCameraExample
//
//  Created by Fernando Sproviero on 27/12/13.
//  Copyright (c) 2013 FS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface FSViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *startStopRotating;
- (IBAction)startStopAction:(id)sender;

@end
