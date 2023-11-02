//  Created by 박선구 on 2023/09/23.
//  23.09.22 수업예제

import Foundation

//MARK: -

////  조건문 예제 12번
////  월을 입력받아 봄, 여름, 가을, 겨울 중 맞는 계절을 알려주는 프로그램을 만드세요
//
//print("월 입력: ", terminator: " ")
//let month = Int(readLine()!)!
//
//if month == 12 || month == 1 || month == 2{
//    print("\(month)월은 겨울입니다")
//}else if month == 3 || month == 4 || month == 5 {
//    print("\(month)월은 봄입니다.")
//}else if month == 6 || month == 7 || month == 8 {
//    print("\(month)월은 여름입니다.")
//}else if month == 9 || month == 10 || month == 11{
//    print("\(month)월은 가을입니다.")
//}else{
//    print("!!월을 적어주세요!!")
//}

//MARK: -

////  조건문 예제 13번, 14번
////  금액을 입력하고 메뉴를 고른 뒤 잔돈을 출력
////  입력한 금액이 선택한 메뉴의 가격보다 부족하면 돈이 부족하다는 문장을 출력하세요.

//print("금액을 입력해주세요: ", terminator: " ")
//let pay = Int(readLine()!)!
//var money = 0
//
//if pay < 500 {
//    print("구매가능한 메뉴가 없습니다.")
//}else{
//    print("메뉴를 입력해주세요.", "1. 콜라(800원)", "2. 생수(500원)", "3. 비타민워터(1500원)")
//    let menu = Int(readLine()!)!
//
//    switch menu {
//    case 1:
//        if pay > 800 {
//            money = pay - 800
//            print("잔돈: \(money)원")
//        }else{
//            print("구매하실 수 없습니다.")
//        }
//    case 2:
//        print("잔돈: \(pay - 500)원")
//    case 3:
//        if pay > 1500 {
//            money = pay - 1500
//            print("잔돈: \(money)원")
//        }else{
//            print("구매하실 수 없습니다.")
//        }
//    default:
//        print("오류")
//    }
//}

//MARK: -

////  조건문 예제 15
////  잔돈을 줄때 천원, 오백원, 백원을 몇 개 줘야 하는지 계산해보세요

//print("금액을 입력해주세요: ", terminator: " ")
//let pay = Int(readLine()!)!
//var money = 0
//
//if pay < 500 {
//    print("구매가능한 메뉴가 없습니다.")
//}else{
//    print("메뉴를 입력해주세요.", "1. 콜라(800원)", "2. 생수(500원)", "3. 비타민워터(1500원)")
//    let menu = Int(readLine()!)!
//
//    switch menu {
//    case 1:
//        if pay > 800 {
//            money = pay - 800
//            var m1000 = money / 1000
//            var x = money % 1000
//            var m500 = x / 500
//            var y = x % 500
//            var m100 = y / 100
//            print("잔돈: \(money)")
//            print("천원지폐: \(m1000)장, 500원: \(m500)개, 100원: \(m100)개")
//        }else{
//            print("구매하실 수 없습니다.")
//        }
//    case 2:
//        if pay > 500 {
//            money = pay - 500
//            var m1000 = money / 1000
//            var x = money % 1000
//            var m500 = x / 500
//            var y = x % 500
//            var m100 = y / 100
//            print("잔돈: \(money)")
//            print("천원지폐: \(m1000)장, 500원: \(m500)개, 100원: \(m100)개")
//        }else{
//            print("구매하실 수 없습니다.")
//        }
//    case 3:
//        if pay > 1500 {
//            money = pay - 1500
//            var m1000 = money / 1000
//            var x = money % 1000
//            var m500 = x / 500
//            var y = x % 500
//            var m100 = y / 100
//            print("잔돈: \(money)")
//            print("천원지폐: \(m1000)장, 500원: \(m500)개, 100원: \(m100)개")
//        }else{
//            print("구매하실 수 없습니다.")
//        }
//    default:
//        print("오류")
//    }
//}


//MARK: -
//
////  조건문 예제 15, 16 자판기 문제
//// 추가본

//print("금액을 입력해주세요: ", terminator: " ")
//let pay = Int(readLine()!)!
//
//func getchange(_ money: Int) -> (Int, Int, Int){
//    var t = money / 1000
//    var fh = money % 1000 / 500
//    var h = money % 1000 % 500 / 100
//    print("천원: \(t)장, 오백원: \(fh)개, 백원: \(h)개")
//    return (t, fh, h)
//}
//
//
//var money = 0
//
//if pay < 500 {
//    print("구매가능한 메뉴가 없습니다.")
//}else{
//    print("메뉴를 입력해주세요.", "1. 콜라(800원)", "2. 생수(500원)", "3. 비타민워터(1500원)")
//    let menu = Int(readLine()!)!
//
//    switch menu {
//    case 1:
//        if pay > 800 {
//            money = pay - 800
//            getchange(money)
//            print("잔돈: \(money)")
//        }else{
//            print("구매하실 수 없습니다.")
//        }
//    case 2:
//        if pay > 500 {
//            money = pay - 500
//            getchange(money)
//            print("잔돈: \(money)")
//        }else{
//            print("구매하실 수 없습니다.")
//        }
//    case 3:
//        if pay > 1500 {
//            money = pay - 1500
//            getchange(money)
//            print("잔돈: \(money)")
//        }else{
//            print("구매하실 수 없습니다.")
//        }
//    default:
//        print("오류")
//    }
//}

//MARK: -

//// Sring 타입의 변수 data를 선언하고 키보드로 값을 입력 받으세요
//// switch ~ case 문 사용

//(다시 해보기)
//대답하는 기계 (경헌님 코드)

//func inputLineString(_ message: String) -> String{
//    print(message, terminator: " ")
//    return String(readLine()!)
//}

////let hi = inputLineString("user:")

//print("입력: ",terminator: "")
//let greeting = (readLine())
//
//switch greeting {
//case "hello":
//    print("mac: 네, 안녕하세요!")
//case "nice meet you.":
//    print("mac: 네, 반가워요!")
//case "bye":
//    print("mac: 네, 수고하세요.")
//default:
//    print("mac: ?")
//}

//MARK: -

////   while 예제 1
////  while문을 사용하여 키보드로부터 입력 받은 수가 10보다 작을 때만 계속 정수를 입력 받으세요.

//var numIn = 0
//
//while numIn < 10 {
//    print("정수입력: ", terminator: "")
//    numIn = Int(readLine()!)!
//}
//print("종료되었습니다.")

//MARK: -

////   while 에졔 2
////  다이어트 관리 프로그램
////  현재 몸무게와 목표 몸무게를 입력 받고 주차 별 감량 몸무게를 입력 받으세요
////  목표 몸무게를 달성하면 축하한다는 문구를 출력 하고 입력을 멈추세요!

//print("현재 몸무게: ", terminator: "")
//var pWeight = Int(readLine()!)!
//
//print("목표 몸무게: ", terminator: "")
//let fWeight = Int(readLine()!)!
//
//var weak = 0
//
//while pWeight > fWeight {
//    weak += 1;
//    print("\(weak)주차 감량 몸무게: ", terminator: "")
//    var mWeight = Int(readLine()!)!
//
//    pWeight = pWeight - mWeight
//
//    if pWeight <= fWeight {
//        break
//    }
//
//}
//print("\(pWeight)kg 달성! 축하합니다!")

//MARK: -

////  while문 예제 3, 4번
////  로그인이 실패했을 경우에 계속 입력, 성공하면 종료
////
//
//let userID : String = "Hello"
//let password : Int = 1234
//
//while true{
//    print("userID: ", terminator: "")
//    let inputUserID = (readLine()!)
//    print("password: ", terminator: "")
//    let inputPassword = Int(readLine()!)!
//
//    if inputUserID == userID && inputPassword == password {
//        print("로그인 성공!")
//        break
//    }else{
//        print("아이디 또는 비밀번호가 잘못되었습니다.")
//    }
//}

//MARK: -

////while 예제5 LOGIN 프로그램
//// (아이디와 비밀번호가 틀렸을 경우 "계속 하시겠습니까?" 라는 문장을 출력)
//
//let userID : String = "Hello"
//let password : Int = 1234
//
//while true{
//    print("ID를 입력해 주세요: ", terminator: "")
//    let inputUserID = (readLine()!)
//    print("비밀번호를 입력해 주세요: ", terminator: "")
//    let inputPassword = Int(readLine()!)!
//
//    if inputUserID == userID && inputPassword == password {
//        print("로그인 성공!")
//        break
//    }else{
//        print("아이디 또는 비밀번호가 잘못되었습니다.")
//        print("계속 하시겠습니까? (Y/N) : ", terminator: "")
//        let answer = (readLine()!)
//        if answer == "Y" {
//            continue
//        }else if answer == "N"{
//            break
//        }
//    }
//}

//MARK: -

//// while문 예제 6번 계산기 프로그램
////두 정수를 입력받고 연산하기, 결과 출력 후 "계속 하시겠습니까?"를 출력
////Yes 와 No 중, Yes면 반복문 다시실행
//
//while true {
//    print("첫 번째 정수를 입력하세요: ", terminator: "")
//    let num1 = Int(readLine()!)!
//    print("두 번째 정수를 입력하세요: ", terminator: "")
//    let num2 = Int(readLine()!)!
//
//    print("1.더하기 2.빼기 : ", terminator: "")
//    let sm = Int(readLine()!)!
//
//    switch sm {
//    case 1:
//        var sum : Int = 0
//        sum = num1 + num2
//        print("더하기 연산 결과는 \(sum)입니다.")
//    case 2:
//        var minus : Int = 0
//        minus = num1 - num2
//        print("빼기 연산 결과는 \(minus)입니다.")
//    default:
//        print("종료되었습니다.")
//    }
//    print("다시 실행 하시겠습니까? (Y/N) : ", terminator: "")
//    let answer = String(readLine()!)
//    if answer == "Y" {
//        print("\n"); continue
//    }else if answer == "N"{
//        break
//    }else{
//        break
//    }
//}


