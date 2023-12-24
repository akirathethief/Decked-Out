//
//  LocationView.swift
//  Decked Out
//
//  Created by Nick Rinehart on 10/23/23.
//

import SwiftUI
import CoreLocation
import CoreLocationUI
import MapKit

struct LocationView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var searchResults: [MKMapItem] = []
    @State private var position: MapCameraPosition = .automatic
    @State private var selectedResult: MKMapItem?
    var body: some View {
        VStack {
            Map(selection: $selectedResult) {
                UserAnnotation()
                ForEach(searchResults, id: \.self) { result in
                    Marker(item: result)
                }
            }
            LocationButton() {
                locationManager.requestLocation()
                search(for: "Games")
            }
            .frame(height: 44)
            .padding()
        }
    }
    
    func search(for query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(center: locationManager.location ?? CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125))
        
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
        }
    }
}

#Preview {
    LocationView()
}
