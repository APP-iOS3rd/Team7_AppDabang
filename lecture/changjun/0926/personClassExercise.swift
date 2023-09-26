//
//  personClassExercise.swift
//  prac2
//
//  Created by phang on 2023/09/26.
//

import Foundation

// MARK: -  Person / Class 예제 04

class Person {
    private var name: String
    private var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func getName() {
        print("이름: \(name)")
    }
    
    func setName(newName: String) {
        name = newName
    }
    
    func getAge() {
        print("나이: \(age)")
    }
    
    func setAge(newAge: Int) {
        age = newAge
    }
    
}
