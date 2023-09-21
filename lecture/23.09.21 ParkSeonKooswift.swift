//
//  main.swift
//  Swift_Sample
//
//  Created by 박선구 on 2023/09/21.
//

//import Foundation
//
//print("아무말 입력: ", terminator: "")
//
//var input = Int(readLine()!)!
//print(input)

//let orange: Int = 3729
//let number: Int = 52
//
//var box: Int = orange / number
//var left: Int = orange % number
//print("김모씨가 귤 박스를 줄 수 있는 박스의 수는? ",box)
//print("박스에 담고 남은 귤의 수는? ", left)

//let num : Int = 456;
//var numnum : Int?
//
//numnum = ((num / 10) * 10) + 1
//print(numnum!)



//print("swift", terminator: " ")
//print("ios", terminator: " ")
//print("web: ", terminator: " ")
//
//let swift : Int = Int(readLine()!)!
//let ios : Int = Int(readLine()!)!
//let web : Int = Int(readLine()!)!
//var sum = (swift + ios + web)
//var num = sum / 3
//
//print("합계: ",sum)
//print("평균: ",num)

//끔하게 (읽기 쉽게)
//print("swift", terminator: " ")
//let ios = Int(readLine()!)!
//print("ios", terminator: " ")
//let swift = Int(readLine()!)!
//print("web ", terminator: " ")
//let web = Int(readLine()!)!
//
//var sum: Int = ios + swift + web
//var avg = Float(sum) / 3.0
//
//print("합", sum)
//print("평", avg)

////연습
//let x = 10
//let y = 20
//
//print("result", x > y ? "안녕" : "잘가")



////시간구하기
//print("초 입력: ", terminator: " ")
//var stime = Int(readLine()!)!
//var mtime : Int = 0
//var htime : Int = 0
//
//mtime = (stime / 60) % 60
//htime = (stime / 60) / 60
//stime = stime % 60
//
//print("시간", htime)
//print("분", mtime)
//print("초", stime)


////노동시간
//print("노동시간: ", terminator: " ")
//var times = Int(readLine()!)!
//var money : Double = 0
//var overTime = (times - 8)
//
//if times > 8 {
//    money = ((Double(overTime) * (5000*1.5)) + (8 * 5000.0))
//}else{
//    money = Double(times) * 5000.0
//}
//print("총 임금은", Int(money),"원 입니다.")



////짝수홀수
//print("정수를 입력하세요: ", terminator: " ")
//let num = Int(readLine()!)!
//
//var num1 = num % 2
//print(num1 >= 1 ? "홀수입니다." : "짝수입니다.")

//
////두 개의 정수
//print("정수를 입력하세요: ", terminator: " ")
//let num1 = Int(readLine()!)!
//print("정수를 입력하세요: ", terminator: " ")
//let num2 = Int(readLine()!)!
//
//print("두 수의 차: ", num1 > num2 ? "\(num1 - num2)":"\(num2-num1)")


//func inputLine(_ message: String) -> Int {
//    print(message, terminator: " ")
//    return Int(readLine()!)!
//}
////
//
//
//print("초를 입력해주세요: ", terminator: " ")
//let total = Int(readLine()!)!
//
//let m = (total / 60) % 60 //분 구하기 초를 60으로 나누면 나머지가 분이다.
//let h = (total/60)/60 //시간 구하기 초를 60으로 나누고 한번더 60으로 나누면 초가 시간이 된다.
//let s = total % 60 //초는 전체초를 60으로 나누면 나온다.
//print(h , m, s)
//print("시간:",h ,"분:",m ,"초:" ,s)


////농구공 상자 문제
//print("공의 수를 입력해주세요: ", terminator: " ")
//let balls = Int(readLine()!)!
//var leftBall = 0
//var boxs = 0
//
//leftBall = balls % 5
//boxs = balls / 5
//
//print("공이 들어간 박스: ", boxs)
//print("남은 공: ", leftBall)
//
//if leftBall != 0 {
//    boxs = boxs + 1
//    print("필요한 상자의 수: ", boxs)
//}else{
//
//    print("필요한 상자의 수: ", boxs)
//}
//
//
//print("필요한 상자의 수", leftBall != 0 ? "\(boxs = boxs + 1)": boxs)




//경헌님 도움
//print("예제 6")
//print("초 입력: ", terminator: "")
//var sec = Int(readLine()!)!
//
//var m = sec / 60
//sec %= 60
//let h = m / 60
//m %= 60
//
//print("\(h)시 \(m)분 \(sec)초")
//print("----------")


////if문 예제 1
//print("정수 입력: ", terminator: " ")
//let age = Int(readLine()!)!
//
//if age >= 20 {
//    print("성인입니다.")
//}else{
//    print("어린이입니다.")
//}


////조건문예제 2번
//print("num 입력: ", terminator: " ")
//var num = Int(readLine()!)!
//var a = 0 ;var b = 0
//a = num % 3
//b = num % 5
//
//if a == 0 && b == 0{
//    print("3과 5의 배수입니다.")
//}else{
//    print("3과 5의 배수가 아닙니다.")
//}

////조건문예제 3번
//print("grade 입력: ", terminator: " ")
//let grade = Int(readLine()!)!
//
//if grade >= 60{
//    print("합격입니다.")
//}else{
//    print("불합격입니다.")
//}

////조건문예제 4번
//print("정수 입력: ", terminator: " ")
//let num = Int(readLine()!)!
//
//if num > 0{
//    print(num, "양수입니다.")
//}else if num < 0{
//    print(num, "음수입니다.")
//}else {
//    print(0,"입니다.")
//}

//조건문예제 5번
print("정수 num1 입력: ", terminator: " ")
let num1 = Int(readLine()!)!
print("정수 num2 입력: ", terminator: " ")
let num2 = Int(readLine()!)!

if num1 > num2 {
    print(num1)
}else if num1 < num2 {
    print(num2)
}else{}

////조건문예제 6번
//print("1과목 소프트웨어 설계: ", terminator: " ")
//let num1 = Int(readLine()!)!
//print("2과목 소프트웨어 개발: ", terminator: " ")
//let num2 = Int(readLine()!)!
//print("3과목 데이터베이스 구축: ", terminator: " ")
//let num3 = Int(readLine()!)!
//print("4과목 프로그래밍 언어 활용: ", terminator: " ")
//let num4 = Int(readLine()!)!
//print("5과목 정보시스템 구축관리: ", terminator: " ")
//let num5 = Int(readLine()!)!
//
//var score = num1 + num2 + num3 + num4 + num5
//
//if num1 < 8 {
//    print("불합격입니다.")
//}else if num2 < 8 {
//    print("불합격입니다.")
//}else if num3 < 8 {
//    print("불합격입니다.")
//}else if num4 < 8 {
//    print("불합격입니다.")
//}else if num5 < 8 {
//    print("불합격입니다.")
//}else if score < 60 {
//    print("불합격입니다.")
//}else{
//    print("합격입니다.")
//}


