//
//  LocationViewModel.swift
//  Mappy
//
//  Created by Harun Gunes on 05/08/2023.
//

import Foundation

class LocationViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init() {
        self.locations = LocationServices.locations
    }
}
