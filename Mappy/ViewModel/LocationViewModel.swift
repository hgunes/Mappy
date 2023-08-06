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
    
    @Published var showLocationList = false
    
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
    
    func toggleList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(_ location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
    
    func nextButtonPressed() {
        
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            
            print("Couldn't load the next location")
            return
        }
        
        let nextIndex = currentIndex + 1
        
        guard locations.indices.contains(nextIndex) else {
            
            guard let firstLocation = locations.first else { return }
            showNextLocation(firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(nextLocation)
    }
}
