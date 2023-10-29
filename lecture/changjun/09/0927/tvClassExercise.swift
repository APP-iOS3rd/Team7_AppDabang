//
//  tvClassExercise.swift
//  prac2
//
//  Created by phang on 2023/09/27.
//

import Foundation

// MARK: - Class 예제 06

class TV {
    private var name: String
    private var year: Int
    private var size: Int
    
    init(name: String, year: Int, size: Int) {
        self.name = name
        self.year = year
        self.size = size
    }
    
    func show() -> String {
        return "\(name)에서 만든 \(year)년형의 \(size)인치 TV"
    }
}
