//
//  WeatherApp.swift
//  Weather
//
//  Created by 박선구 on 11/15/23.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherView()
                .environmentObject(Network())
        }
    }
}
