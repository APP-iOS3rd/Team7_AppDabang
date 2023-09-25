//
//  main.swift
//  03
//
//  Created by lkh on 2023/09/25.
//

import Foundation

// MARK: - input 관련
func inputLineInt(_ msg: String) -> Int {
    print(msg, terminator: " ")
    return Int(readLine()!)!
}

func inputLineArrayInt(_ msg: String) -> [Int] {
    print(msg, terminator: " ")
    return readLine()!.split(separator: " ").map { Int(String($0))! }
}

func inputLineString(_ msg: String) -> String {
    print(msg, terminator: " ")
    return readLine()!
}

// MARK: - while 예제 7, -1, -2
/*랜덤으로 정수 2개를 뽑아 아래와 같이 출력

사용자는 두 수의 합을 입력
두 수의 합과 입력한 수가 일치하면 “Success”
두 수의 합과 입력한 수가 일치하지 않으면 “Fail”을 출력*/

print("=== Plus Game ===")
var flag = false;
var firstNumber = Int.random(in: 1...1000)
var secondNumber = Int.random(in: 1...1000)

while true {
    if flag { // 맞춰서 새로 뽑아야한다면
        firstNumber = Int.random(in: 1...1000)
        secondNumber = Int.random(in: 1...1000)
    }
    let inputNumber = inputLineInt("\(firstNumber)+\(secondNumber)=")
    
    if inputNumber == firstNumber + secondNumber {
        print("Success")
        flag = true
    } else {
        print("Fail")
        flag = false
    }
    
    let r = inputLineString("계속 하시겠습니까? (Y/N)")
    if r == "N" {
        break;
    }
    
}

// MARK: - for 예제

// for문을 사용하여 96에서 53까지 출력하시오.
for i in stride(from: 96, through: 53, by: -1) {
    print(i, terminator: " ")
}
print()

print("==============================================")

// for문을 사용하여 21에서 57까지의 수 중 홀수만 출력하시오.

for i in stride(from: 21, through: 57, by: 2) {
    print(i, terminator: " ")
}
print()

print("==============================================")

// 정수를 입력 받아 1부터 입력 받은 정수까지 차례대로 출력하는 프로그램을 작성하시오
let rangeEnd = inputLineInt("정수입력:")
for i in 1...rangeEnd {
    print(i, terminator: " ")
}
print()

print("==============================================")

// 한 개의 자연수를 입력 받아 그 수의 배수를 차례로 10개 출력하는 프로그램을 작성하시오
let integer1 = inputLineInt("정수입력:")

for i in stride(from: integer1, through: integer1*10, by: integer1) {
    print(i, terminator: " ")
}

print()

//print("==============================================")

// 1~100까지 3의 배수의 합을 출력하세요
var res: Int = 0
for i in stride(from: 3, through: 100, by: 3) {
    res += i
}
print(res)

print("==============================================")

// MARK: - for 예제 4
// 원하는 단을 입력 받아 구구단을 출력하세요.
let dan = inputLineInt("단 입력:")

for i in 1...9 {
    print(dan, "*", i, "=", dan*i)
}
print("==============================================")

// MARK: - for 예제 5
// 구구단 1단~9단까지 출력하세요.

for i in 1...9 {
    print("===\(i)단===")
    for j in 1...9 {
        print(i, "*", j, "=", i*j)
    }
}
print("==============================================")

// MARK: - for 예제 6
// 구구단 1단~9단까지 출력하세요.

for i in 1...9 {
    print("\(i)단:", terminator: " ")
    for j in 1...9 {
        print(i, "*", j, "=", i*j, terminator: "    ")
    }
    print("")
}
print("==============================================")

// MARK: - for 에제 6 (선택)
for i in 1...9 {
    print("\(i)단:", terminator: " ")
    for j in 1...9 {
        let result = String(i*j).padding(toLength: 3, withPad: " ", startingAt: 0)
        print(i, "*", j, "=", result, terminator: " ")
    }
    print("")
}
print("==============================================")

// MARK: - for 예제 7
// 입력 받은 정수의 약수를 구하세요

let myNum = inputLineInt("정수입력:")
print("\(myNum)의 약수:", terminator: " ")
for i in 1...myNum {
    if myNum % i == 0 {
        print(i, terminator: " ")
    }
}
print("")

print("==============================================")

// MARK: - for 예제 8
// 2~30까지의 약수를 구하세요

for i in 2...30 {
    print("\(i)의 약수:", terminator: " ")
    for j in 1...myNum {
        if i % j == 0 {
            print(j, terminator: " ")
        }
    }
    print("")
}

print("==============================================")

// MARK: - for 예제 9

//*
//**
//***
//****
//*****

for i in 1...5 {
    for _ in 0..<i {
        print("*", terminator: "")
    }
    print("")
}

print("==============================================")

//*****
//****
//***
//**
//*

for i in stride(from: 5, through: 1, by: -1) {
    for _ in 0..<i {
        print("*", terminator: "")
    }
    print("")
}

print("==============================================")

// 대칭된
for i in stride(from: 5, through: 1, by: -1) {
    for _ in 0..<(i-1) {
        print(" ", terminator: "")
    }
    for _ in 0..<(5-i+1) {
        print("*", terminator: "")
    }
    print("")
}

print("==============================================")
// 다이아
for i in stride(from: 5, through: 1, by: -1) {
    for _ in 0..<(i-1) {
        print(" ", terminator: "")
    }
    for _ in 0..<(5-i+1) {
        print("*", terminator: "")
    }
    
    for _ in 0..<(5-i+1) {
        print("*", terminator: "")
    }
    
    for _ in 0..<(i-1) {
        print(" ", terminator: "")
    }
    print("")
}

for i in stride(from: 1, through: 5, by: 1) {
    for _ in 0..<(i-1) {
        print(" ", terminator: "")
    }
    for _ in 0..<(5-i+1) {
        print("*", terminator: "")
    }
    
    for _ in 0..<(5-i+1) {
        print("*", terminator: "")
    }
    
    for _ in 0..<(i-1) {
        print(" ", terminator: "")
    }
    print("")
}

print("==============================================")

// MARK: - for 예제 10
// 369게임

for i in 0...9 {
    for j in 0...9 {
        // 여기서 부터
        print("\(i)\(j)", terminator: "")
        var cnt = 0
        if (i != 0 && i % 3 == 0) {
            cnt += 1
        }
            
        if (j != 0 && j % 3 == 0) {
            cnt += 1
        }
        
        for _ in 0..<cnt {
            print("*", terminator: "")
        }
        print("")
        // 여기까지가 한 줄
    }
}
