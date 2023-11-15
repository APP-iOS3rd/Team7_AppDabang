//
//  WeatherView.swift
//  WeatherApp
//
//  Created by 박선구 on 11/14/23.
//

import SwiftUI

struct WeatherView: View {

    @EnvironmentObject var network: Network
    @State private var selection = 1
    @State private var title = "일정 추가"
    
    var bgColor : Color = .black
    
    //국가
    var country: String {network.weather.sys.country}
    
    //좌표
    var coord1: Double {network.weather.coord.lat}
    var coord2: Double {network.weather.coord.lon}
    
    //날씨
    var clouds: String { String(format: "%.1f", (network.weather.clouds.all))}
    var wind: String { String(format: "%.1f", (network.weather.wind.speed))}
    
    //
    var weatherMain: String {network.weather.weather.first?.main ?? ""}
    var weatherDescription: String {network.weather.weather.first?.description ?? ""}
    
    
//    var temp: String { String(format: "%.1f", (network.weather.main.temp - 273.15)) }
    
    //온도
    var temp: String { String(format: "%.1f", (network.weather.main.temp - 273.15)) }
    var tempMin: String { String(format: "%.1f", (network.weather.main.tempMin - 273.15)) }
    var tempMax: String { String(format: "%.1f", (network.weather.main.tempMax - 273.15)) }
    
    //아이콘
    var icon: String {network.weather.weather.first?.icon ?? "" }
    var humidity: Int {network.weather.main.humidity}
    
    
    var body: some View {
        NavigationStack{
            Text("\(country)")
            Text("서울특별시")
                .font(.headline)
            
            HStack{
                Text("\(coord1)")
                Text("\(coord2)")
            }
            .font(.subheadline)
            
            TabView(selection: $selection) {
                VStack{
                    //                Text("\(country)")
                    //                Text("서울특별시")
                    //                    .font(.headline)
                    //
                    //                HStack{
                    //                    Text("\(coord1)")
                    //                    Text("\(coord2)")
                    //                }
                    //                .font(.subheadline)
                    
                    Spacer()
                    
                    VStack{
                        HStack{
                            Image(systemName: SelectIcon())
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(SelectColor())
                            Text("\(weatherMain)")
                                .font(.largeTitle)
                        }
                        .padding()
                        //                .foregroundColor(SelectColor())
                        
                        VStack{
                            Text("\(temp) ℃")
                                .font(.largeTitle)
                            HStack{
                                Text("\(tempMin)℃")
                                Text(" ~ ")
                                Text("\(tempMax)℃")
                            }
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    HStack{
                        Spacer()
                        //                    Text("구름양")
                        Image(systemName: "cloud")
                        Text("\(clouds)")
                        Spacer()
                        //                    Text("풍속")
                        Image(systemName: "wind")
                        Text("\(wind)m/s")
                        Spacer()
                        //                    Text("습도")
                        Image(systemName: "humidity")
                        Text("\(humidity)")
                        Spacer()
                    }
                }
                .tag(1)
                .onAppear{
                    network.getWeather()
                }
                
                MapView()
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            //        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            
            Text("")
                .frame(width: 350, height: 2)
                .background(SelectColor())
            
            todoListVIew()
        }
    }
    
    func SelectIcon () -> String{
//        var icons: String = ""
        
        if icon == "01d" || icon == "01n" {
            return "sun.max.fill"
        } else if icon == "02d" || icon == "02n" {
            return "cloud.sun.fill"
        } else if icon == "03d" || icon == "03n"{
            return "cloud.fill"
        } else if icon == "04d" || icon == "04n"{
            return "cloud.fill"
        } else if icon == "09d" || icon == "09n"{
            return "cloud.heavyrain.fill"
        } else if icon == "10d" || icon == "10n"{
            return "sun.rain.fill"
        } else if icon == "11d" || icon == "11n"{
            return "cloud.bolt.fill"
        } else if icon == "13d" || icon == "13n"{
            return "cloud.snow.fill"
        } else if icon == "50d" || icon == "50n"{
            return "cloud.fog.fill"
        } else {
            return "sun.horizon.fill"
        }
    }
    
    func SelectColor () -> Color{
//        var icons: String = ""
        
        if icon == "01d" || icon == "01n" {
            return .red
        } else if icon == "02d" || icon == "02n" {
            return .blue
        } else if icon == "03d" || icon == "03n"{
            return .gray
        } else if icon == "04d" || icon == "04n"{
            return .gray
        } else if icon == "09d" || icon == "09n"{
            return .blue
        } else if icon == "10d" || icon == "10n"{
            return .yellow
        } else if icon == "11d" || icon == "11n"{
            return .orange
        } else if icon == "13d" || icon == "13n"{
            return .gray
        } else if icon == "50d" || icon == "50n"{
            return .gray
        } else {
            return .black
        }
    }
    
    
//    mutating func dateFormatter(){
//        let nowDate = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "hh:mm"
//        let str = dateFormatter.string(from: nowDate)
//        
//        if str >= "06:00" && str <= "18:00" {
//            return bgColor = .mint
//            
//        } else if str >= "18:00" && str <= "06:00" {
//            return bgColor = .indigo
//        } else {
//            return bgColor = .red
//        }
//    }
    
}



#Preview {
    WeatherView()
        .environmentObject(Network())
}
