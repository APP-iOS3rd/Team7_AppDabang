//
//  CarStore.swift
//  DemoProject2
//
//  Created by phang on 11/2/23.
//

import SwiftUI

// MARK: - 데이터 저장소

class CarStore: ObservableObject {
    @Published var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
