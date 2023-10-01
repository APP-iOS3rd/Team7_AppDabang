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

//print("초 입력: ", terminator: "")
//let t = Int(readLine()!)!
//
//var m = (t/60) % 60
//var h = (t/60)/60
//var s = (t%60)
//print("\(h)시간 \(m)분 \(s)초")

//MARK: -
//MARK: 연산자 예제 7
//시급계산기 입니다. 기본시급은 5,000원이고, 8시간이 넘을 경우 초과된 시간은 시급의 1.5배를 책정해줍니다. (하루 13시간 이하 근무)

//var num = 5000
//var hour = 5000 * 1.5
//
//print("노동시간 입력: ", terminator: "")
//let time = Int(readLine()!)!
//
//
//if time >= 8 {
//    var overtime = (Double(time-8) * hour)
//    var money = (Double(time) - Double(time - 8)) * Double(num)
//    print("총 입금은 \(Int(overtime + money))원 입니다.")
//}

//MARK: -
//MARK: 연산자 예제 8
//정수를 입력받아 홀수인지 짝수인지 판별하세요.(삼항연산자 이용)

//print("정수를 입력하세요: ", terminator: "")
//let num = Int(readLine()!)!
//
//print(num % 2 == 0 ? "\(num)은 짝수입니다." : "\(num)은 홀수입니다.")

//MARK: -
//MARK: 연산자 예제 9
//두 개의 정수를 입력 받아 큰 수에서 작은 수를 뺀 결과값을 출력하세요. .(삼항연산자 이용)
//func inputLine (_ message: String) -> Int {
//    print(message, terminator: " ")
//    return Int(readLine()!)!
//    }
//
//let num1 = inputLine("첫 번째 정수 입력: ")
//let num2 = inputLine("두 번째 정수 입력: ")
//
//print(num1 > num2 ? "두 수의 차: \(num1 - num2)" : "두 수의 차: \(num2 - num1)")

//MARK: -
//MARK: 연산자 예제 10
//농구공을 담기 위해 필요한 상자의 개수를 구하세요.
//상자 하나에는 농구공이 5개 들어갈 수 있습니다. 만일 농구공이 ‘23’개라면 필요한 상자의 개수는 ‘5’개입니다.

func inputLine (_ message : String) -> Int{
    print(message, terminator: "")
    return Int(readLine()!)!
}

//let balls = inputLine("농구공의 갯수를 입력하세요: ")
//var box = balls / 5
//var left = balls % 5
//
//print(left != 0 ? "필요한 상자의 수: \(box + 1)" : "필요한 상자의 수: \(box)")

//MARK: -
//MARK: 조건문 예제 1
//Int 타입의 변수 age를 선언하고 키보드로 값을 입력받으세요.
//만약 age가 20보다 크거나 같다면 “성인입니다.” 라고
//출력하는 프로그램을 만들어 보세요.

//let age = inputLine("정수를 입력하세요: ")
//
//if age >= 20 {
//    print("성인입니다.")
//}else{
//    print("성인이 아닙니다.")
//}

//MARK: -
//MARK: 조건문 예제 2
//변수 num를 선언하고 키보드로 값을 입력받으세요.
//만약 num이 3의 배수이면서 5의 배수라면 “3과 5의 배수입니다”라고 출력하는
//프로그램을 만들어보세요.

//let num = inputLine("정수를 입력하세요: ")
//
//if num % 3 == 0 && num % 5 == 0 {
//    print("3과 5의 배수입니다.")
//}else{
//    print("3과 5의 배수가 아닙니다.")
//}
//MARK: -
//MARK: 조건문 예제 3
//Int 타입의 변수 grade 를 선언하고 키보드로 값을 입력받으세요.
//만약 grade 가 60점이상이면 “합격입니다.” grade 가 60점 미만이면 “불합격입니다.” 를 출력하는 프로그램을 작성해보세요.

//let grade = inputLine("정수를 입력하세요: ")
//
//if grade >= 60 {
//    print("합격입니다.")
//}else{
//    print("불합격입니다.")
//}
//MARK: -
//MARK: 조건문 예제 4
//정수를 입력 받아 양수, 음수, 0을 판별하여 다음과 같이 출력하세요.

//let num = inputLine("정수를 입력하세요: ")
//
//if num > 0 {
//    print("양수입니다.")
//}else if num < 0 {
//    print("음수입니다.")
//}else{
//    print("0 입니다.")
//}

//MARK: -
//MARK: 조건문 예제 5
//Int 타입의 변수 num1, num2를 선언하고 키보드로 값을 입력받으세요.
//입력받은 num1과 num2 중 큰 수를 출력하는 프로그램을 만들어보세요.

//let num1 = inputLine("첫 번째 정수를 입력하세요: ")
//let num2 = inputLine("두 번째 정수를 입력하세요: ")
//
//switch num1 > num2{
//    
//case true:
//    print("더 큰 수: \(num1)")
//case false:
//    print("더 큰 수: \(num2)")
//}

//MARK: -
//MARK: 조건문 예제 6
//정보처리기사의 각 과목의 정답개수를 Int형 타입의 변수 5개를 선언하고 입력받으세요.
//한 과목이라도 8개 미만인 경우, “불합격입니다!”를 출력하고 총 개수가 60개 이상이면 “합격입니다!”를 출력하는 프로그램을 만들어보세요.

//let num1 = inputLine("1과목 소프트웨어 설계: ")
//let num2 = inputLine("2과목 소프트웨어 개발: ")
//let num3 = inputLine("3과목 데이터베이스 구축: ")
//let num4 = inputLine("4과목 프로그래밍 언어 활용: ")
//let num5 = inputLine("5과목 정보시스템 구축관리: ")
//
//if num1 < 8 || num2 < 8 || num3 < 8 || num4 < 8 || num5 < 8 {
//    print("불합격입니다.")
//}else if num1+num2+num3+num4+num5 < 60 {
//    print("불합격입니다.")
//}else{
//    print("합격입니다!")
//}

//MARK: -
//MARK: 조건문 예제 7
//다음은 디즈니랜드 입장료 계산 프로그램입니다.
//기본료는 5000원이며 인원수에 따라 지불해야하는 프로그램을 만들어보세요.
//단, 미성년자인 경우 50%할인이 적용됩니다!

//let money = 5000
//let age = inputLine("나이를 말씀해주세요: ")
//let people = inputLine("인원수를 말씀해주세요: ")
//
//if age < 20 {
//    print("총 \(people * (money/2))원 입니다.")
//}else{
//    print("총 \(people * money)원 입니다.")
//}
//MARK: -
//MARK: 조건문 예제 7 (더 해보기)

//let money = 5000
//var pay = 0
//
//let people = inputLine("인원수를 말씀해주세요: ")
//
//for i in 1...people{
//    let age = inputLine("\(i)나이를 입력해주세요: ")
//
//    if age <= 20{
//        pay += (money/2)
//    }else{
//        pay += money
//    }
//}
//
//print("총 \(pay)원 입니다.")

//MARK: -
//MARK: 조건문 예제 8
//마트 계산대 프로그램입니다.
//10000원짜리 추석선물셋트를 구입했을 때 지불해야하는 금액을 계산해 보세요.
//단, 11개 이상 구매시에는 10%할인이 됩니다!

//let set = 10000
//let num = inputLine("구매하려는 상품 갯수를 입력하세요: ")
//
//if num >= 11 {
//    print("가격은 \(Int(Double(set)*0.9) * num)원 입니다.")
//}else{
//    print("가격은 \(set * num)원 입니다.")
//}

//MARK: -
//MARK: 조건문 예제 9
//Int 타입의 변수 grade 를 선언하고 키보드로 값을 입력받으세요.
//Grade가
//90이상이면 “A학점입니다.”,
//80점 이상 90점 미만일 경우 “B학점입니다.”
//70점이상 80점 미만일 경우 “C학점입니다.” 를 출력하세요.

//let grade = inputLine("점수를 입력하세요: ")
//
//if grade > 90 {
//    print("A학점입니다.")
//}else if grade > 80 && grade < 90 {
//    print("B학점입니다.")
//}else{
//    print("C학점입니다.")
//}

//MARK: -
//MARK: 조건문 예제 10
//switch ~ case 문을 사용하여,
//data가 "hello" 일 때, "네, 안녕하세요!" 출력,
//data 가 "nice to meet you" 일 때, "네, 반가워요!" 출력,
//data가 "take care" 일 때, "네, 수고하세요!" 출력,
//그 외 다른 문장일 때는 "잘못 입력하셨습니다." 라고 출력하는 프로그램을 작성하세요.

func inputString(_ message: String) -> String{
    print(message, terminator: "")
    return readLine()!
}

//let data = inputString("")
//
//switch data {
//case "hello":
//    print("네, 안녕하세요.")
//case "nice to meet you":
//    print("네, 반가워요!")
//case "take care":
//    print("네, 수고하세요")
//default:
//    print("잘못 입력하셨습니다.")
//}

//MARK: -
//MARK: 조건문 예제 12
//월을 입력받아 봄, 여름, 가을, 겨울 중 맞는 계절을 알려주는 프로그램을 만드세요.
//12, 1, 2월 → 겨울
//3, 4, 5월 → 봄
//6, 7, 8월 → 여름
//9, 10, 11월 →가을

//let month = inputLine("월을 입력하세요: ")
//
//switch month {
//case 12, 1 ,2 :
//    print("겨울")
//case 3, 4, 5:
//    print("봄")
//case 6, 7, 8:
//    print("여름")
//case 9, 10, 11:
//    print("가을")
//default:
//    print("다시 입력해주세요.")
//}

//MARK: -
//MARK: 조건문 예제 13
//자판기 프로그램을 만들어 봅시다.
//금액을 입력하고 메뉴를 고른 뒤 잔돈을 출력해 보세요!

//let money = inputLine("금액을 입력하세요: ")
//let menu = inputLine("메뉴를 고르세요\n1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원): ")
//
//switch menu {
//case 1:
//    print("잔돈: \(money - 800)")
//case 2:
//    print("잔돈: \(money - 500)")
//case 3:
//    print("잔돈: \(money - 1500)")
//default: break
//}

//MARK: -
//MARK: 조건문 예제 14
//입력한 금액이 선택한 메뉴의 가격보다 부족하면
//돈이 부족하다는 문장을 출력하세요!

//let money = inputLine("금액을 입력하세요: ")
//let menu = inputLine("메뉴를 고르세요\n1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원): ")
//
//switch menu {
//case 1:
//    if money < 800 {
//        print("돈이 부족해요 ㅠㅠ")
//    }else{
//        print("잔돈: \(money - 800)")
//    }
//case 2:
//    if money < 500 {
//        print("돈이 부족해요 ㅠㅠ")
//    }else{
//        print("잔돈: \(money - 500)")
//    }
//case 3:
//    if money < 1500 {
//        print("돈이 부족해요 ㅠㅠ")
//    }else{
//        print("잔돈: \(money - 1500)")
//    }
//default: break
//}

//MARK: -
//MARK: 조건문 예제 15
//잔돈을 줄 때 천원을 몇 개 줘야 하는지 계산해 보세요!

//let money = inputLine("금액을 입력하세요: ")
//let menu = inputLine("메뉴를 고르세요\n1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원): ")
//
//switch menu {
//case 1:
//    if money < 800 {
//        print("돈이 부족해요 ㅠㅠ")
//    }else{
//        print("잔돈: \(money - 800)")
//        print("천원: \((money - 800)/1000)")
//    }
//case 2:
//    if money < 500 {
//        print("돈이 부족해요 ㅠㅠ")
//    }else{
//        print("잔돈: \(money - 500)")
//        print("천원: \((money - 500)/1000)")
//    }
//case 3:
//    if money < 1500 {
//        print("돈이 부족해요 ㅠㅠ")
//    }else{
//        print("잔돈: \(money - 1500)")
//        print("천원: \((money - 1500)/1000)")
//    }
//default: break
//}

//MARK: -
//MARK: 조건문 예제 16
//잔돈을 줄 때 천원, 오백원, 백원짜리를 몇 개 줘야하는지 계산해 보세요!

//let money = inputLine("금액을 입력하세요: ")
//let menu = inputLine("메뉴를 고르세요\n1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원): ")
//
//switch menu {
//case 1:
//    if money < 800 {
//        print("돈이 부족해요 ㅠㅠ")
//    }else{
//        print("잔돈: \(money - 800)")
//        print("천원: \((money - 800)/1000)")
//        print("오백원: \((money - 800)%1000/500)")
//        print("백원: \((money - 800)%1000%500/100)")
//    }
//case 2:
//    if money < 500 {
//        print("돈이 부족해요 ㅠㅠ")
//    }else{
//        print("잔돈: \(money - 500)")
//        print("천원: \((money - 500)/1000)")
//        print("오백원: \((money - 500)%1000/500)")
//        print("백원: \((money - 500)%1000%500/100)")
//    }
//case 3:
//    if money < 1500 {
//        print("돈이 부족해요 ㅠㅠ")
//    }else{
//        print("잔돈: \(money - 1500)")
//        print("천원: \((money - 1500)/1000)")
//        print("오백원: \((money - 1500)%1000/500)")
//        print("백원: \((money - 1500)%1000%500/100)")
//    }
//default: break
//}

//MARK: -
//MARK: while문 예제 1

//var result = 0
//
//while result < 10 {
//    let num = inputLine("정수 입력: ")
//    result = num
//}
//print("종료되었습니다.")

//MARK: -
//MARK: while문 예제 2
//다이어트 관리 프로그램
//현재 몸무게와 목표몸무게를 입력 받고 주차 별 감량 몸무게를 입력 받으세요.
//목표 몸무게를 달성하면 축하한다는 문구를 출력 하고 입력을 멈추세요!

//var nowWeight = inputLine("현재 몸무게: ")
//let target = inputLine("목표 몸무게: ")
//var i = 0
//
//while nowWeight > target {
//    i = i + 1
//    var weight = inputLine("\(i)주차 몸무게: ")
//    nowWeight -= weight
//}
//if nowWeight < target {
//    print("\(nowWeight)kg 달성! 축하합니다.")
//}

//MARK: -
//MARK: while문 예제 3
//로그인 프로그램을 만들어 보자.
//아이디와 비밀번호를 각각 입력 받고 일치할 경우 “로그인성공!”
//일치하지 않은 경우에는 “로그인 실패!”

//let setId = "hello"
//let setPassword = 1234
//let id = inputString("아이디를 입력해주세요: ")
//let password = inputLine("비밀번호를 입력해주세요: ")
//
//if id == setId && password == setPassword {
//    print("로그인 성공!")
//}else{
//    print("id 또는 비밀번호가 틀렸습니다.")
//}

//MARK: -
//MARK: while문 예제 4
//로그인이 실패했을 경우에 계속 입력
//로그인이 성공하면 프로그램 종료

//let setId = "hello"
//let setPassword = 1234
//
//while true {
//    let id = inputString("아이디를 입력해주세요: ")
//    let password = inputLine("비밀번호를 입력해주세요: ")
//    
//    if id == setId && password == setPassword {
//        print("로그인 성공!")
//        break
//    }else{
//        print("id 또는 비밀번호가 틀렸습니다.\n")
//        continue
//    }
//}

//MARK: -
//MARK: while문 예제 5
//Login프로그램
//아이디와 비밀번호가 틀렸을 경우 "계속 하시겠습니까?" 라는 문장을 출력하세요.
//Y를 입력하면 아이디 비밀번호 입력 계속,
//N을 입력하면 종료
//로그인 성공 시 종료


//let setId = "hello"
//let setPassword = 1234
//
//while true {
//    let id = inputString("아이디를 입력해주세요: ")
//    let password = inputLine("비밀번호를 입력해주세요: ")
//    
//    if id == setId && password == setPassword {
//        print("로그인 성공!")
//        break
//    }else{
//        print("id 또는 비밀번호가 틀렸습니다.\n")
//        let again = inputString("다시 하시겠습니까? (Y/N): ")
//        if again == "Y"{
//            continue
//        }else if again == "N"{
//            break
//        }
//    }
//}

//MARK: -
//MARK: while문 예제 6
//아이디와 비밀번호가 틀렸을 경우 "계속 하시겠습니까?" 라는 문장을 출력하세요.
//첫 번째 정수를 입력 받는다.
//두 번째 정수를 입력 받는다.
//연산자를 선택한다.
//선택한 연산자에 따라 연산결과를 출력한다.
//다시 실행할 것인가를 물어본다.
//“Y” 를 입력하면 다시 실행.
//“N”을 입력하면 반복문 종료.


//var a = true
//while a {
//let num1 = inputLine("첫 번째 정수 입력: ")
//let num2 = inputLine("두 번째 정수 입력: ")
//var result = 0
//
//let sellect1 = inputLine("1.더하기 2.빼기: ")
//    switch sellect1 {
//    case 1:
//        result = num1 + num2
//        print(result)
//        let sellect2 = inputString("다시(Y/N): ")
//        if sellect2 == "Y"{
//            continue
//        }else if sellect2 == "N"{
//            a = false
//        }
//    case 2:
//        result = num1 - num2
//        print(result)
//        let sellect2 = inputString("다시(Y/N): ")
//        if sellect2 == "Y"{
//            continue
//        }else if sellect2 == "N"{
//            a = false
//        }
//    default:
//        print("다시 입력해주세요.")
//        continue
//    }
//}

//MARK: -
//MARK: while문 예제 7

//let num1 = Int.random(in: 0...100)
//let num2 = Int.random(in: 0...100)
//var result = num1 + num2
//
//let answer = inputLine("\(num1) + \(num2) = ? ")
//
//if answer == result {
//    print("SUCCESS")
//}else{
//    print("FAIL")
//}

//MARK: -
//MARK: while문 예제 7 - 1
//사용자가 원할 때까지 반복
//Fail 후 계속하기를 선택할 시 기존 숫자를 출력

//var again = true
//let num1 = Int.random(in: 0...100)
//let num2 = Int.random(in: 0...100)
//var result = num1 + num2
//
//while again {
//    let answer = inputLine("\(num1) + \(num2) = ? ")
//    
//    if answer == result {
//        print("SUCCESS")
//        again = false
//    }else{
//        print("FAIL")
//        let failAgain = inputString("다시 하시겠습니까? (Y/N): ")
//        if failAgain == "Y"{
//            again = true
//        }else{
//            again = false
//        }
//    }
//}

//MARK: -
//MARK: while문 예제 7-2 *
//Success 후 계속하기를 선택할 시 새로운 숫자를 뽑아서 출력

//var again = true
//var again2 = true
//
//while again2 {
//    let num1 = Int.random(in: 0...100)
//    let num2 = Int.random(in: 0...100)
//    let result = num1 + num2
//    
//    while again {
//        let answer = inputLine("\(num1) + \(num2) = ? ")
//        
//        if answer == result {
//            print("SUCCESS")
//            let successAgain = inputString("다시 하시겠습니까? (Y/N): ")
//            if successAgain == "Y"{
//                break
//            }else{
//                again2 = false
//                again = false
//            }
//        }else{
//            print("FAIL")
//            let failAgain = inputString("재도전 하시겠습니까? (Y/N): ")
//            if failAgain == "Y"{
//                again = true
//                again2 = true
//            }else{
//                again2 = false
//                again = false
//            }
//        }
//    }
//}

//MARK: -
//MARK: for문 예제 00
//for문을 사용하여 96에서 53까지 출력하시오.

//for i in (53...96).reversed(){
//    print(i)
//}

//for문을 사용하여 21에서 57까지의 수 중 홀수만 출력하시오.

//for i in 21...57 {
//    if i % 2 == 1{
//        print(i)
//    }
//}

//정수를 입력 받아 1부터 입력 받은 정수까지 차례대로 출력하는 프로그램을 작성하시오.

//let num1 = inputLine("정수 입력: ")
//for i in 1...num1{
//    print(i)
//}

//한 개의 자연수를 입력 받아 그 수의 배수를 차례로 10개 출력하는 프로그램을 작성하시오.

//let num1 = inputLine("자연수 입력: ")
//for i in 1...10{
//    print("\(num1 * i)")
//}

//1~100까지 3의 배수의 합을 출력하세요. (1683)

//var sum = 0
//
//for i in 1...33 {
//    var result = 3 * i
//    sum += result
//}
//print(sum)

//MARK: -
//MARK: for문 예제 3
//2단 출력

//for i in 1...9{
//    print("2 * \(i) = \(i * 2)")
//}

//MARK: -
//MARK: for문 예제 4
//원하는 단을 입력받아 구구단을 출력하세요.

//let num = inputLine("단 입력: ")
//for i in 1...9 {
//    print("\(num) * \(i) = \(num * i)")
//}

//MARK: -
//MARK: for문 예제 5
//구구단 1단~9단까지 출력

//for i in 2...9{
//    print("=== \(i)단 ===")
//    for j in 1...9{
//        print("\(i) * \(j) = \(i * j)")
//        if j == 9{
//            print("\n")
//        }
//    }
//}

//MARK: -
//MARK: for문 예제 6

//for i in 2...9{
//    print("\(i)단: ", terminator: "")
//    for j in 1...9{
//        if (i * j) < 10{
//            print("\(i) * \(j) =  \(i * j)", terminator: "   ")
//        }else{
//            print("\(i) * \(j) = \(i * j)", terminator: "   ")
//        }
//        if j == 9{
//            print("\n")
//        }
//    }
//}

//MARK: -
//MARK: for문 예제 7
//입력 받은 정수의 약수를 구하세요

//print("정수 입력: ",terminator: "")
//let num = Int(readLine()!)!
//
//print("\(num)의 약수: ",terminator: "")
//for i in 1...num{
//    if num % i == 0{
//        print(i, terminator: " ")
//    }
//}

//MARK: -
//MARK: for문 예제 8
//2~30까지의 약수를 구하세요

for i in 2...30{
    print("\(i)의 약수: ", terminator: "")
    for j in 1...i{
        if i % j == 0{
            print("\(j)", terminator: " ")
            if j == i {
                print("\n")
            }
        }
    }
}

//MARK: -

