//
//  ViewController.swift
//  JPMCATMLocator
//
//  Created by Naga Murala on 1/31/18.
//  Copyright © 2018 Naga Murala. All rights reserved.
//

import UIKit
import ProjectWorldFramework
import CoreLocation
import GoogleMaps


class ATMLocatorViewController: MasterViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    //MARK:- ViewModel Initialization: Tightly coupled
    //Tightly coupling viewModel with view since viewModel is the data provider for view.
    @IBOutlet var viewModel: ATMLocatorViewModel!
    
    //PRAGMARK:- Variable initialization
    var mapView: GMSMapView?
    let locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        lm.requestWhenInUseAuthorization()
        //Make sure to start updating the location to call the delegate methods.
        lm.startUpdatingLocation()
        return lm
    }()
    
    //PRAGMARK:- ViewController overriden methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set the locationManager delegate to self, to kickoff delegate methods when location changed
        self.locationManager.delegate = self
    }
    
    //PRAGMARK:- Delegate methods: CLLocationManger
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //Let viewModel deal with fetching the latitude and longitude values and hold them. As a view(controller), ask view model to provide the values when it is needed
        viewModel.fetchNearbyLocations(locationManager: self.locationManager)
        {
            print("Hi Ajay: Executing after the network response fetch", self.viewModel.locationResponse ?? "Response not available")
            self.displayNearByATMLocationsInGMAPS()
        }
        //Make sure to stop updating the location other wise it keeps on sending the locationd details
        locationManager.stopUpdatingLocation()
        //Render the current location marker in GMAPS
        showCurrentLocationInGMAPS()
    }
    
    //PRAGMARK:- Instance Methods
    //This method takes care of displaying the current location marker in google maps. It takes care of displaying the current location title with tap gestures(event delegation model)
    func showCurrentLocationInGMAPS() {
        guard let latitude = viewModel.currentLatitude, let longitude = viewModel.currentLongitude else {
            print("SomeThing wrong: Latitude/Longitude value is nil")
            return
        }
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 10)
        //Set the frame corresponds with origin to location co-ordinates
        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        //Enables or disables the My Location button. This is a button visible on the map that, when tapped by users, will center the map on the current user location.
        mapView?.settings.myLocationButton = true
        //My Location dot and accuracy circle is enabled
        mapView?.isMyLocationEnabled = true
        self.mapView?.delegate = self
        //Set the google map to the view in root view controller view controller
        self.view = mapView
        
        //This is just to show the marker on top of current location
        let locationCoordinate = CLLocationCoordinate2DMake(latitude, longitude)
        let marker = GMSMarker(position: locationCoordinate)
        marker.appearAnimation = .pop
        marker.title = CURRENT_LOCATION
        marker.map = mapView
    }
    //This method will iterate through the location response - ATMLocations array and calls subsequent method to render the markers in GMAPS
    func displayNearByATMLocationsInGMAPS() {
        guard let locations = self.viewModel.locationResponse?.locations else { return }
        for location in locations {
            renderNearByATMLocationsWithAnimation(location: location)
        }
    }
    //This method will display each and every location as a marker in GMAPS by using CATransaction animations
    func renderNearByATMLocationsWithAnimation(location: ATMLocation) {
        //Invoke animation
        CATransaction.begin()
        //Set the delay of animation duration
        CATransaction.setValue(2, forKey: kCATransactionAnimationDuration)
        //location to location animation transition occures with the above delay
        //Camera position will goto the location to display the marker at provided location
        mapView?.animate(to: GMSCameraPosition.camera(withLatitude: (location.lat).toDouble(), longitude: (location.lng).toDouble(), zoom: 14))
        //Commit the animation
        CATransaction.commit()
        
        //This is just to show the marker on top of each location
        let locationCoordinate = CLLocationCoordinate2DMake((location.lat).toDouble(), (location.lng).toDouble())
        let marker = GMSMarker(position: locationCoordinate)
        marker.appearAnimation = .pop
        marker.title = location.name
        marker.map = mapView
    }
    
    //PRAGMARK:- DelegateMethods: GMSViewDelegate
    //Triggers when user taps on the location title window on top of the marker
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("Hi Ajay: didTapInfoWindowOf")
    }
}

