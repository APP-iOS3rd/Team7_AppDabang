//
//  ContentView.swift
//  ApiDemo
//
//  Created by lkh on 11/30/23.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var weatherAPI = WeatherAPI.shared
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Text("City: \(weatherAPI.cityName ?? "")")
            Text("Temperature: \(weatherAPI.weather?.main.temp ?? 0)")
            Text("Description: \(weatherAPI.weather?.weather.first?.description ?? "")")
            
        }
        .onAppear {
            self.weatherAPI.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
