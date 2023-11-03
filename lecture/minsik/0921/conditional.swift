//
//  main.swift
//  Swift_sample
//
//  Created by 조민식 on 2023/09/21.
//

import Foundation

// p.2

let num = Int(readLine()!)!

if num % 3 == 0 && num % 5 == 0 {
    print("3과 5의 배수입니다")
}

// p.3

let grade = Int(readLine()!)!

if grade >= 60 {
    print("합격입니다")
}else{
    print("불합격입니다")
}

// p.4

while true {
    print("정수 입력:",terminator: " ")
    guard let input = Int(readLine()!) else {
        print("입력이 올바르지 않습니다.")
        break
    }
    if input == 0 {
        print("0입니다.")
    }else if input > 0 {
        print("\(input) 양수입니다")
    }else if input < 0 {
        print("\(input) 음수입니다")
    }

}

// p.5

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

print(input.max() ?? "비교가 불가능 합니다.")

// p.6

var intarray: Array<Int> = []

print("1과목 소프트웨어 설계:",terminator: " ")
intarray.append(Int(readLine()!)!)
print("2과목 소프트웨어 개발:",terminator: " ")
intarray.append(Int(readLine()!)!)
print("3과목 데이터베이스 구축:",terminator: " ")
intarray.append(Int(readLine()!)!)
print("4과목 프로그래밍 언어 활용:",terminator: " ")
intarray.append(Int(readLine()!)!)
print("5과목 정보시스템 구축 관리:",terminator: " ")
intarray.append(Int(readLine()!)!)

let total = intarray.reduce(0, +)
intarray.sort()

if total >= 60 {
    if intarray[0] < 8{
        print("불합격입니다!")
    }else{
        print("합격입니다!")
    }
}else{
    print("불합격입니다!")
}
