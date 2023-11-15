//
//  Weather.swift
//  WeatherApp
//
//  Created by 박선구 on 11/13/23.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let greeting: String
    let instructions: [Instruction]
}

// MARK: - Instruction
struct Instruction: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
    
    static let sample = Instruction(
            coord: Coord(lon: 0, lat: 0),
            weather: [],
            base: "",
            main: Main(temp: 0, feelsLike: 0, tempMin: 0, tempMax: 0, pressure: 0, humidity: 0),
            visibility: 0,
            wind: Wind(speed: 0, deg: 0),
            clouds: Clouds(all: 0),
            dt: 0,
            sys: Sys(type: 0, id: 0, country: "", sunrise: 0, sunset: 0),
            timezone: 0,
            id: 0,
            name: "",
            cod: 0)
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
