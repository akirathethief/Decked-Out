//
//  LocationViewModel.swift
//  Decked Out
//
//  Created by Nick Rinehart on 11/22/23.
//

import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
    
    func locationManager( _ manager: CLLocationManager, didFailWithError error: Error ) {
        print(error)
    }
}
