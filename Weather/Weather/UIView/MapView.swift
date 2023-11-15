//
//  MapView.swift
//  WeatherApp
//
//  Created by 박선구 on 11/14/23.
//

import SwiftUI
import MapKit




struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: [])
            .frame(width: 350, height: 300)
            .cornerRadius(10)
    }
}

#Preview {
    MapView()
}
