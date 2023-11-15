//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by 박선구 on 11/13/23.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            WeatherView()
                .environmentObject(network)
        }
    }
}
