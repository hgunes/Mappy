//
//  LocationViewModel.swift
//  Mappy
//
//  Created by Harun Gunes on 05/08/2023.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    @Published var mapLocation: Location {
        didSet {
            updateRegion(mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationServices.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        updateRegion(locations.first!)
    }
    
    private func updateRegion(_ location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
}
