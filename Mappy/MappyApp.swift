//
//  MappyApp.swift
//  Mappy
//
//  Created by Harun Gunes on 05/08/2023.
//

import SwiftUI

@main
struct MappyApp: App {
    
    @StateObject private var vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
