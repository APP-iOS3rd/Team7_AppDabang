//
//  studentClassExercise.swift
//  prac2
//
//  Created by phang on 2023/09/26.
//

import Foundation

// MARK: -  Student / Class 예제 01 ~ 03

class Student {
    private var name: String
    private var number: String
    private var age: Int
    private var scoreSwift: Int
    private var scoreiOS: Int
    private var scoreWeb: Int
    
    init(name: String, number: String, age: Int, scoreSwift: Int, scoreiOS: Int, scoreWeb: Int) {
        self.name = name
        self.number = number
        self.age = age
        self.scoreSwift = scoreSwift
        self.scoreiOS = scoreiOS
        self.scoreWeb = scoreWeb
    }
    
    func show() {
        let multiLineText = """
                            \(self.name)님 안녕하세요.
                            [ \(self.number), \(self.age)살 ]
                            \(self.name)님의 Swift 점수는 \(self.scoreSwift)점 입니다.
                            \(self.name)님의 iOS 점수는 \(self.scoreiOS)점 입니다.
                            \(self.name)님의 Web 점수는 \(self.scoreWeb)점 입니다.
                            """
        print(multiLineText)
    }
    
}
