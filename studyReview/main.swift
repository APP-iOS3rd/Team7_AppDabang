//
//  main.swift
//  studyReview
//
//  Created by 박선구 on 2023/09/30.
//

import Foundation

//연산자 예제 1번

//let num1 = 7
//let num2 = 3
//
//print("더하기 결과: \(num1 + num2)")
//print("빼기 결과: \(num1 - num2)")
//print("곱하기 결과: \(num1 * num2)")
//print("나누기 결과: \(num1 / num2)")
//print("나머지 구하기: \(num1 % num2)") //+

//MARK: -
//MARK: 연산자 예제 2
//변수 num 값 중에서 백의 자리 이하를 버리는 코드이다. 만일 변수 num의 값이 456이라며 400이 되고, 111이라면 100이 된다.

//let num1: Int = 925
//
//var result = (num1 / 100) * 100
//print(result)

//MARK: -
//MARK: 연산자 예제 3
//제주도에 다녀온 김모 씨는 3,729개의 귤을 샀다. 김모 씨는 주위 사람들에게 귤을 나눠주려고 하는데 너무 많아서 문제가 생겼습니다.
//김모씨는 귤을 한 사람당 52개씩 박스에 담아서 나눠주려고 합니다.
//김모씨가 사람들에게 줄 수 있는 박스의 수와 남은 귤 갯수를 구해보세요.

//let orange = 3729
//let box = 52
//
//var result = orange / box
//print("나누어 줄 수 있는 박스의 수: ",result)
//result = orange % box
//print("남은 귤 갯수: ",result)

//MARK: -
//MARK: 연산자 예제 4
//변수 num 값 중에서 일의 자리를 1로 바꾸는 코드이다. 만일 변수 num의 값이 456 이라면 451이 되고, 777이라면 771이 된다.

//print("정수를 입력해주세요: ",terminator: "")
//let num = Int(readLine()!)!
//
//var result1 = ((num / 10) * 10) + 1
//print("\(result1)")

//MARK: -
//MARK: 연산자 예제 5
//Swift, iOS, Web 점수를 키보드로 부터 입력 받아 합계와 평균을 출력하세요

//print("Swift 점수: ",terminator: "")
//let swiftScore = Int(readLine()!)!
//print("iOS 점수: ",terminator: "")
//let iOSScore = Int(readLine()!)!
//print("Web 점수: ",terminator: "")
//let WebScore = Int(readLine()!)!
//
//var sum = swiftScore + iOSScore + WebScore
//var avg = Float(sum) / 3
//print("점수 합계: \(sum)\n평균: \(avg)")

//MARK: -
//MARK: 연산자 예제 6
//초를 입력 받아 [시, 분, 초] 형태로 출력하세요.

print("초 입력: ", terminator: "")
let t = Int(readLine()!)!

var m = (t/60) % 60
var h = (t/60)/60
var s = (t%60)
print("\(h)시간 \(m)분 \(s)초")

//MARK: -
//MARK: 연산자 예제 7
