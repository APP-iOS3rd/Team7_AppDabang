//  Created by 박선구 on 2023/09/25.

import Foundation


//MARK: -
//MARK: 09/26
//MARK: 369게임

//for cnt in 0..<100 { //cnt는 count의 줄임말
//    let a = cnt / 10 //10의 자리
//    let b = cnt % 10 //1의 자리
//    print("\(a)\(b)", terminator: "")
//
//    if (a % 3 == 0) && (a != 0){    //10의 자리 a가 3의 배수일 경우
//        print("*", terminator: "")
//    }
//    if (b % 3 == 0) && (b != 0){   //1의 자리 b가 3의 배수일 경우
//        print("*", terminator: "")
//    }
//    print()
//}

//MARK: -
//MARK: 함수예제 1

//func addNumber(fm : Int, sm : Int) -> Int {
//   fm + sm
//}
//
//
//print("1번째 수: ", terminator: "")
//var a = Int(readLine()!)!
//print("2번째 수: ", terminator: "")
//var b = Int(readLine()!)!
//
//print("연산결과: \(addNumber(fm: a, sm: b))")

//MARK: -
//MARK: 함수예제 2

//func largerNumbers(fm : Int, sm : Int) {
//    if fm > sm {
//        return print("결과확인: ",fm)
//    }else if fm == sm{
//        return print("0")
//    }else {
//        return print("결과확인: ",sm)
//    }
//}
//
//print("1번째 수: ", terminator: "")
//let a = Int(readLine()!)!
//print("2번째 수: ", terminator: "")
//let b = Int(readLine()!)!
//
//largerNumbers(fm: a, sm: b)

//MARK: -
//MARK: 함수예제 2 (강사님ver)

//func largerNumbers (a: Int , b: Int) -> Int{
//    if a == b {
//        return 0
//    }
//    return a > b ? a : b
//}
//
//print("1번째 수: ", terminator: "")
//let a = Int(readLine()!)!
//print("2번째 수: ", terminator: "")
//let b = Int(readLine()!)!
//
//let c = largerNumbers(a: a, b: b)
//print("큰 수 확인: \(c)")

//MARK: -
//MARK: 함수예제 3

//func close10(num1 : Int, num2 : Int) {
//    if abs(10 - num1) > abs(10 - num2) {
//        return print("10에 가까운 수: \(num2)")
//    }else if abs(10 - num1) == abs(10 - num2) {
//        return print("10에 가까운 수: 0")
//    }else{
//        return print("10에 가까운 수: \(num1)")
//    }
//}
//
//print("1번째 수: ", terminator: "")
//let a = Int(readLine()!)!
//print("2번째 수: ", terminator: "")
//let b = Int(readLine()!)!
//
//close10(num1: a, num2: b)

//MARK: -
//MARK: 함수예제 4

//func powerN(base: Int, n: Int) {
//    var result = 0
//
//    result = Int(pow(Float(base), Float(n)))  //pow = 제곱
//    return print("결과 확인: \(result)")
//}
//
//print("1번째 수: ", terminator: "")
//let a = Int(readLine()!)!
//print("2번째 수: ", terminator: "")
//let b = Int(readLine()!)!
//
//powerN(base: a, n: b)

//MARK: -
//MARK: 함수예제 5

//func getAbsoluteValue(num1 : Int, num2 : Int) {
//    var result = 0
//    result = num1 - num2
//    return print("결과 확인: \(abs(result))")
//}
//
//print("1번째 수: ", terminator: "")
//let a = Int(readLine()!)!
//print("2번째 수: ", terminator: "")
//let b = Int(readLine()!)!
//
//getAbsoluteValue(num1: a, num2: b)

//MARK: -
//MARK: 함수예제: 6
//두 개의 정수를 인자(매개변수)로 넘겨받아 앞의 정수가 뒤의 정수로 나누어지는지를 판별하는 isDivide( ) 를 작성하세요.

//func isDivide(a : Int, b : Int) -> Bool{
//    if b == 0{
//        return false
//    }
//    return (a % b == 0)
//}
//print("1번째 수: ", terminator: "")
//let a = Int(readLine()!)!
//print("2번째 수: ", terminator: "")
//let b = Int(readLine()!)!
//
//let c : Bool = isDivide(a: a, b: b)


//MARK: -
//MARK: 함수예제 7 (보충필요)
//약수를 구하는 getDivisor() 를 구현하세요

//func getDivisor(num : Int) {
//    print("\(num)의 약수: ", terminator: "")
//    for q in 1...num {
//        if num % q == 0 {
//            print("\(q)", terminator: " ")
//            if q == num {
//                print("\n")
//            }
//        }
//    }
//}
//    print("정수입력: ", terminator: "")
//    let a = Int(readLine()!)!
//
//    getDivisor(num: a)
//
//
//
//MARK: -
//MARK: 함수예제 7 (강사님ver)

//func getDivisor (a: Int) -> String {
//    var str = "\(a)의 약수: "
//    for i in 1...a {
//        if isDivide(a: a, b: i) {
//            str += "\(i) "
//        }
//    }
//    return str
//}
//
//print("정수 입력: ", terminator: "")
//let a = Int(readLine()!)!
//
//let c: String = getDivisor(a: a)
//print(c)

//MARK: -
//MARK: 함수예제 8 (강사님Ver)
//func getSumofDivisors(a: Int) -> Int {
//    var sum = 0
//    for i in 1...a {
//        if isDivide(a: a, b: i) {
//            sum += i
//        }
//    }
//    return sum
//}

//let a: Int = 10
//
//let c: Int = getSumofDivisors(a: a)
//print("\(a)의 약수의 합: \(c)")

//MARK: -
//MARK: 함수예제 9 (보충필요)
//startValue...endValue까지의 숫자 중 완전수를 출력하는 getPerfectNumber() 를 구현하세요
//완전수 = 자신을 제외한 약수들의 합이 자신인 것
//
//let a: Int = 100
//let b: Int = 41
//
//var str = ""
//for i in 2...1000{
//    let c: Int = getSumofDivisors(a: i)
//    if c - a == a{
//       str += "\(i) "
//    }
//}
//print(str)

//MARK: -
//MARK: 함수예제 10

//권지원님 코드
//func getPrimeNumber(first: Int, last: Int) {
//    print("\(first)~\(last)까지의 소수: " ,terminator: "")
//    for i in first...last {
//        var result = "F"
//        if i == 2 {
//
//        } else {
//            for j in 2...(i-1) {
//                if i % j == 0 {
//                    result = "T"
//                    break
//                }
//            }
//        }
//        if result == "F" {
//            print(i, terminator: " ")
//        }
//    }
//    print()
//}
//
//getPrimeNumber(first: 2, last: 30)

//MARK: -
//MARK: 클래스

//class piggbank {
//    var bank = 0
//    func inputMoney(money: Int) -> Int {  //입금
//        showMoney()
//        if money > 0 {
//            bank += money
//            return bank
//        }else{
//            return bank
//        }
//    }
//    func outputMoney(bMoney: Int) -> String {  //출금
//        showMoney()
//        if bMoney > 0 && bank > bMoney{
//            bank -= bMoney
//            return String(bank)
//        }else if bank < bMoney{
//            return "잔액이 부족합니다."
//        }else{
//            return String(0)
//        }
//    }
//    func showMoney(){  //현재 잔액
//        print("현재 잔액: \(bank)")
//    }
//}
//
//let a : Int = 15000
//let b : Int = 9000
//
//let myBank = piggbank()
//print("입금:\(a), 현재잔액: \(myBank.inputMoney(money: a))\n")
//print("출금:\(b), 현재잔액: \(myBank.outputMoney(bMoney: b))\n")

//MARK: -
//MARK: 객체를 이용하여 입력된 학생의 정보를 출력하기

//let student1 = Student(name: "홍길동", number: "20200677", age: 22, scoreSwift: 50, scoreiOS: 89, scoreWeb: 77)
//let student2 = Student(name: "김영희", number: "20190541", age: 26, scoreSwift: 90, scoreiOS: 85, scoreWeb: 70)
//
//class Student {
//    var name: String
//    var number: String
//    var age: Int
//    var scoreSwift: Int
//    var scoreiOS: Int
//    var scoreWeb: Int
//
//    init(name: String, number: String, age: Int, scoreSwift: Int, scoreiOS: Int, scoreWeb: Int) {
//        self.name = name
//        self.number = number
//        self.age = age
//        self.scoreSwift = scoreSwift
//        self.scoreiOS = scoreiOS
//        self.scoreWeb = scoreWeb
//    }
//    func show() {
//        print("\(name)님 안녕하세요")
//        print("[ \(number), \(age)살 ]")
//        print("\(name)님의 Swift 점수는 \(scoreSwift)점 입니다.")
//        print("\(name)님의 iOS 점수는 \(scoreiOS)점 입니다.")
//        print("\(name)님의 Web 점수는 \(scoreWeb)점 입니다.")
//        print("=======================================\n")
//    }
//}
//
//student1.show()
//student2.show()
