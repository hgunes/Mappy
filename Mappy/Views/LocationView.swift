//
//  LocationView.swift
//  Mappy
//
//  Created by Harun Gunes on 05/08/2023.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                VStack {
                    Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .frame(height: 55)
                    .frame(maxWidth: .infinity)
                }
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 20, y: 15)
                .padding()
                
                Spacer()
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
    }
}
