//
//  main.swift
//  Swift_Sample
//
//  Created by 박호건 on 2023/09/21.
//

import Foundation

//print("초 입력: ", terminator: "")
//var cho = Int(readLine()!)!
//
//var hour = cho / 3600
//var minute = (cho % 3600) / 60
//var seconds = cho % 60
//print(hour,"시" ,minute,"분",seconds,"초")


// 시급계산기
//print("노동 시간 입력:", terminator: "")
//var nodong = Int(readLine()!)!
//print("총 임금은",nodong > 8 ? (8 * 5000) + (nodong - 8) * Int(5000 * 1.5) : nodong * 5000 ,"원 입니다.")


// 홀수인지 짝수인지
//print("점수를 입력하세요: ", terminator: "")
//var number = Int(readLine()!)!
//print((number % 2 == 0) ? "\(number)는(은) 짝수입니다." : "\(number)는(은) 홀수입니다.")

// 큰 수 - 작은 수
//print("첫 번째 정수 입력:", terminator: "")
//var number1 = Int(readLine()!)!
//print("두 번째 정수 입력:", terminator: "")
//var number2 = Int(readLine()!)!
//print("두 수의 차:", number1 >= number2 ? number1 - number2 : number2 - number1)

// 예제 10
//print("농구공의 개수를 입력하세요: ", terminator: "")
//var ball = Int(readLine()!)!
//print("필요한 상자의 수:" ,ball % 5 == 0 ? ball / 5 : ball / 5 + 1)

// 조건문 예제
//func input(_ message: String) -> Int {
//    print(message, terminator: "")
//    return Int(readLine()!)!
//}
//
//let age = input("입력: ")
//if age >= 20 {
//    print("성인입니다.")
//}

// num이 3의 배수면서 5의 배수면 -> "3과 5의 배수입니다."
//func input(_ message: String) -> Int{
//    print(message, terminator: "")
//    return Int(readLine()!)!
//}
//
//let num = input("입력: ")
//if num % 3 == 0 && num % 5 == 0 {
//    print("3과 5의 배수입니다.")
//}

// grade >= 60 -> 합격
// grade < 60 -> 불합격
//func input(_ message: String) -> Int{
//    print(message, terminator: "")
//    return Int(readLine()!)!
//}
//
//let grade = input("입력: ")
//if grade >= 60 {
//    print("합격입니다.")
//}else{
//    print("불합격입니다.")
//}

// 양수, 음수, 0 판별
//func input(_ message: String) -> Int{
//print(message, terminator: "")
//return Int(readLine()!)!
//}
//
//let num = input("정수 입력: ")
//if num > 0 {
//    print(num, "양수입니다.")
//}else if num == 0 {
//    print(num, "입니다.")
//}else{
//    print(num, "음수입니다.")
//}

// num1과 num2중 큰 수를 출력
//func input(_ message: String) -> Int{
//print(message, terminator: "")
//return Int(readLine()!)!
//}
//
//let num1 = input("1번: ")
//let num2 = input("1번: ")
//if num1 > num2 {
//    print(num1)
//}else{
//    print(num2)
//}


// Int형 타입의 변수 5개
// 한과목이라도 8개 미만이면 불합격
// 총 개수가 60개 이상이면 합격
//func input(_ message: String) -> Int{
//    print(message, terminator: "")
//    return Int(readLine()!)!
//}
//
//let a = input("1과목 소프트웨어 설계: ")
//let b = input("2과목 소프트웨어 개발: ")
//let c = input("3과목 데이터베이스 구축: ")
//let d = input("4과목 프로그래밍 언어 활용: ")
//let e = input("5과목 정보시스템 구축관리: ")
//var sum = a + b + c + d + e
//let cut = a < 8 || b < 8 || c < 8 || d < 8 || e < 8
//
//if sum >= 60 {
//    if cut {
//        print("불합격입니다.")
//    }else {
//        print("합격입니다")
//    }
//    
//}else{
//    print("불합격입니다.")
//}
