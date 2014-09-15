<a href='https://pledgie.com/campaigns/26743'><img alt='Click here to lend your support to: Fernando&#x27;s Open Source Projects and make a donation at pledgie.com !' src='https://pledgie.com/campaigns/26743.png?skin_name=chrome' border='0' ></a>


FSRotatingCamera
================

Class helper that uses MKMapCamera to rotate around a coordinate.

![Demo](https://github.com/fernandospr/FSRotatingCamera/raw/master/images/FSRotatingCameraExampleDemo.gif)

## Usage

Copy FSRotatingCamera folder to your project, include FSRotatingCamera.h and start using!

Steps:

* Instantiate the class

```
[[FSRotatingCamera alloc] initWithMapView:self.mapView];
```
* Call any of the startRotating methods.
* In your view controller implement the following MKMapViewDelegate method:

```
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    if ([self.rotCamera isStopped] == NO) { 
        [self.rotCamera continueRotating];
    }
}
```


See example project for more details!
