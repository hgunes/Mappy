//
//  CustomPinView.swift
//  Mappy
//
//  Created by Harun Gunes on 06/08/2023.
//

import SwiftUI

struct CustomPinView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(Color("AccentColor"))
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color("AccentColor"))
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 35)
        }
    }
}

struct CustomPinView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPinView()
    }
}
