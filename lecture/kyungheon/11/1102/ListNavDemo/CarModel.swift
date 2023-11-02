//
//  CarModel.swift
//  ListNavDemo
//
//  Created by lkh on 11/2/23.
//

import Foundation

struct Car : Codable, Identifiable {
    var id: String
    var name: String

    var description: String
    var isHybrid: Bool

    var imageName: String
}

// JSON 데이터 로딩
var carData: [Car] = loadJson("carData.json")

// 데이터 저장소 구조체를 추가
class CarStore : ObservableObject {

    @Published var cars: [Car]

    init(cars: [Car] = []) {
        self.cars = cars
    }
}
