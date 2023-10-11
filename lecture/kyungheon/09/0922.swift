//
//  main.swift
//  02 
//
//  Created by lkh on 2023/09/22.
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

// MARK: - 조건문 예제 12
/// 월을 입력받아 봄, 여름, 가을, 겨울 중 맞는 계절을 알려주는 프로그램을 만드세요.
/// 12, 1, 2월 → 겨울
/// 3, 4, 5월 → 봄
/// 6, 7, 8월 → 여름
/// 9, 10, 11월 →가을

func getSeason(_ a: Int) -> String {
    if a == 12 || a >= 1 && a < 3 {
        return "\(a)월은 겨울입니다!"
    } else if a >= 3 && a < 6 {
        return "\(a)월은 봄입니다!"
    } else if a >= 6 && a < 9 {
        return "\(a)월은 여름입니다!"
    } else if a >= 9 && a < 12 {
        return "\(a)월은 가을입니다!"
    }
    return "잘못 입력"
}

print(getSeason(inputLineInt("월 입력:")))

// 다른 풀이
let month: Int = inputLineInt("월 입력:")
switch month {
case 12, 1, 2:
    print("\(month)월은 겨울입니다!")
    break
case 3, 4, 5:
    print("\(month)월은 봄입니다!")
    break
case 6, 7, 8:
    print("\(month)월은 여름입니다!")
    break
case 9, 10, 11:
    print("\(month)월은 가을입니다!")
    break
default:
    print("잘못 입력하셨습니다.")
    break
}

print("======================")

// MARK: - 조건문 예제 13
/// 자판기 프로그램을 만들어 봅시다.
/// 금액을 입력하고 메뉴를 고른 뒤 잔돈을 출력해 보세요!

print("금액을 입력하세요.")
var moneys = Int(readLine()!)!

print("메뉴를 고르세요")
let j = inputLineInt("1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원) :")
var price1 = 0;

if j == 1 {
    price1 = 800
} else if j == 2 {
    price1 = 500
} else if j == 3 {
    price1 = 1500
}

moneys -= price1
print("잔돈: \(moneys)원")

print("======================")
//
// MARK: - 조건문 예제 14
/// 입력한 금액이 선택한 메뉴의 가격보다 부족하면
/// 돈이 부족하다는 문장을 출력하세요!

print("금액을 입력하세요.")
var money = Int(readLine()!)!

print("메뉴를 고르세요")
let ju = inputLineInt("1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원) :")
var price = 0;

if ju == 1 {
    price = 800
} else if ju == 2 {
    price = 500
} else if ju == 3 {
    price = 1500
}

if price > money {
    print("돈이 부족해요 ㅠㅠ")
    //print("\(price - money) 원이 부족해요 ㅠㅠ")
} else {
    money -= price
}

print("잔돈: \(money)원")
//
//print("======================")
//
// MARKL - 조건문 예제 15
print("금액을 입력하세요.")
var mm = Int(readLine()!)!

print("메뉴를 고르세요")
let juc2 = inputLineInt("1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원) :")
var price3 = 0;

if juc2 == 1 {
    price3 = 800
} else if juc2 == 2 {
    price3 = 500
} else if juc2 == 3 {
    price3 = 1500
}

if price3 > mm {
    print("돈이 부족해요 ㅠㅠ")
    //print("\(price - money) 원이 부족해요 ㅠㅠ")
} else {
    mm -= price3
}

print("잔돈: \(mm)원")
print("천원: \( (mm - (mm%1000)) / 1000) 개")

// MARK: - 조건문 예제 16
print("금액을 입력하세요.")
var mon = Int(readLine()!)!

print("메뉴를 고르세요")
let juc = inputLineInt("1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원) :")
var price2 = 0;

if juc == 1 {
    price2 = 800
} else if juc == 2 {
    price2 = 500
} else if juc == 3 {
    price2 = 1500
}

if price2 > mon {
    print("돈이 부족해요 ㅠㅠ")
    //print("\(price - money) 원이 부족해요 ㅠㅠ")
} else {
    mon -= price2
}

print("잔돈: \(mon)원")
let cnt1 = (mon - (mon%1000)) / 1000
let cnt2 = (mon%1000) / 500
let cnt3 = ((mon%1000) - 500 * cnt2) / 100
print("천원: \(cnt1)개, 오백원: \(cnt2)개, 백원: \(cnt3)개")

print("======================")

// MARK: - while 예제 1
while true {
    let number = inputLineInt("정수 입력:")
    
    if number >= 10 {
        break;
    }
}
print("======================")

// MARK: - while 예제 2
var currentWeight = inputLineInt("현재 몸무게:")
let targetWeight = inputLineInt("목표 몸무게:")

if targetWeight > currentWeight {
    print("다이어트 불필요")
} else {
    var loop = 1;
    
    while true {
        currentWeight -= inputLineInt("\(loop)주차 감량 몸무게:")
        
        if currentWeight <= targetWeight {
            print("\(currentWeight)kg 달성: 축하합니다!")
            break;
        }
        loop += 1; // loop = loop + 1
    }
}
print("======================")

// MARK: - while 예제 3, 4
let userID = "Hello"
let password = 1234

var f = true

while f {
    let inputID = inputLineString("아이디를 입력해 주세요:")
    let inputPassword = inputLineInt("비밀번호를 입력해 주세요")
    
    if (inputID == userID) && (password == inputPassword) {
        print("로그인 성공!")
        f = false
    } else {
        print("아이디와 비밀번호가 잘못되었습니다.")
    }
}

print("======================")

// MARK: - while 예제 5


var flag = true

while flag {
    let inputID = inputLineString("아이디를 입력해 주세요:")
    let inputPassword = inputLineInt("비밀번호를 입력해 주세요")
    
    if (inputID == userID) && (password == inputPassword) {
        print("로그인 성공!")
        flag = false
    } else {
        print("아이디와 비밀번호가 잘못되었습니다.")
        let repl = inputLineString("계속 하시겠습니까? (Y/N):")
        
        if repl == "N" {
            print()
            print("종료되었습니다.")
            flag = false
        } else { // 의미 없음
            continue;
        }
    }
}


// MARK: - while 예제 6
var flag6 = true
while flag6 {
    let firstNumber = inputLineInt("첫 번째 정수를 입력하세요:")
    let secondNumber = inputLineInt("두 번째 정수를 입력하세요:")
    let selectedOP = inputLineInt("1.더하기 2.빼기 :")
    
    if selectedOP == 1 {
        print("더하기 연산 결과는 \(firstNumber + secondNumber)입니다.")
    } else if selectedOP == 2 {
        print("빼기 연산 결과는 \(firstNumber - secondNumber)입니다.")
    }
    
    let repl = inputLineString("계속 하시겠습니까? (Y/N):")
    
    if repl == "N" {
        print()
        print("종료되었습니다.")
        flag6 = false
    }
}

