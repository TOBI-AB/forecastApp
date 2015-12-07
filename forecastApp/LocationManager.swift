//
//  LocationManager.swift
//  forecastApp
//
//  Created by GhaffarEtt on 07/12/2015.
//  Copyright © 2015 GhaffarEtt. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    var latitude: Double
    var longtitude: Double
}

typealias locationClosure = (currentLocation: Location) -> Void

class LocationManager: NSObject {
    var m = CLLocationManager()
    var onLocationFound: locationClosure
   
    init(closure: locationClosure) {
        onLocationFound = closure
        super.init()
        m.delegate = self
        m.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        m.requestAlwaysAuthorization()
        m.startUpdatingLocation()
    }
    
    func startUpdatingLocation() {
        m.startUpdatingLocation()
    }
    func stopUpdatingLocation() {
        m.stopUpdatingLocation()
    }
}



extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        AlertHandling().showAlertWith(error.localizedDescription)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let lastLocation = locations.last as CLLocation? else {
            return
        }
        
        self.onLocationFound(currentLocation: Location(latitude: lastLocation.coordinate.latitude, longtitude: lastLocation.coordinate.longitude))
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .Denied:
            AlertHandling().showAlertWith("Denied")
        case .NotDetermined:
            AlertHandling().showAlertWith("Not Determined")
        case .Restricted:
            AlertHandling().showAlertWith("Restricted")
        case .AuthorizedWhenInUse:
            startUpdatingLocation()
        default:
            startUpdatingLocation()
        }
    }
}





