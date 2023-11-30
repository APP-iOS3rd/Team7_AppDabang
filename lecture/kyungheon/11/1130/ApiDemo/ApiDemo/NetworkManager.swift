//
//  NetworkManager.swift
//  ApiDemo
//
//  Created by lkh on 11/30/23.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
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
    let pressure, humidity, seaLevel, grndLevel: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
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
    let gust: Double
}

class WeatherAPI: ObservableObject {
    static let shared = WeatherAPI()
    private init() { }

    @Published var weather: Welcome?
    @Published var cityName: String = ""

    func fetchData() {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            print("API key 에러")
            return
        }
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=\(apiKey)") else {
            print("url 에러")
            return
        }

        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // 정상적으로 값이 오지 않았을 때 처리
                self.weather = nil
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let json = try JSONDecoder().decode(Welcome.self, from: data)
                DispatchQueue.main.async {
                    self.weather = json
                    self.cityName = json.name
                }
            } catch let error {
                print("Decoding error: \(error)")
            }
        }
        task.resume()
    }
}
