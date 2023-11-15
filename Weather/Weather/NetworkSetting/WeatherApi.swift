//
//  WeatherApi.swift
//  WeatherApp
//
//  Created by 박선구 on 11/13/23.
//

import Foundation

private var apiKey: String {
    get {
        guard let filePath = Bundle.main.path(forResource: "KeyList", ofType: "plist") else {
            fatalError("Couldn't find file 'KeyList.plist'.")
        }
        
        let plist = NSDictionary(contentsOfFile: filePath)
        
        guard let value = plist?.object(forKey: "OPENWEATHERMAP_KEY") as? String else {
            fatalError("Couldn't find key 'OPENWEATHERMAP_KEY' in 'KeyList.plist'.")
        }
        return value
    }
}
