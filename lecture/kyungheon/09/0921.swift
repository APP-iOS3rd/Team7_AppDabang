//
//  main.swift
//  01
//
//  Created by lkh on 2023/09/21.
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

// MARK: -연산자 예제 1
// 코드를 완성하여 다음과 같은 결과를 출력하세요
let numbb1 = 7
let numbb2 = 3
print("더하기 결과:", numbb1+numbb2)
print("빼기 결과:", numbb1-numbb2)
print("곱하기 결과:", numbb1*numbb2)
print("나누기 결과:", Double(numbb1)/Double(numbb2))
print("----------")

// MARK: -연산자 예제 2
/// 변수 num 값 중에서 백의 자리 이하를 버리는 코드이다.
/// 만일 변수 num의 값이 456이라며 400이 되고, 111이라면 100이 된다

let num = 456
print("결과 확인:", num / 100 * 100)

print("결과 확인: "+String(num).prefix(String(num).count-2)+"00")
print("----------")

// MARK: -연산자 예제 3
/// 제주도에 다녀온 김모 씨는 3,729개의 귤을 샀다. 김모 씨는 주위 사람들에게 귤을 나눠주려고 하는데 너무 많아서 문제가 생겼습니다.
/// 김모씨는 귤을 한 사람당 52개씩 박스에 담아서 나눠주려고 합니다.
/// 김모씨가 사람들에게 줄 수 있는 박스의 수와 남은 귤 갯수를 구해보세요.

let orange: Int = 3729;
let nu: Int = 52;

print("김모씨가 귤 박스를 줄 수 있는 박스의 수는? \(orange / nu)")
print("박스에 담고 남은 귤 수는?", orange % nu)
print("----------")


// MARK: -연산자 예제 4
/// 변수 num 값 중에서 일의 자리를 1로 바꾸는 코드이다.
///  만일 변수 num의 값이 456 이라면 451이 되고, 777이라면 771이 된다.
let n1 = 456;
print("결과확인:",(n1 / 10) * 10 + 1);
print("----------")

// MARK: -연산자 예제 5
/// Swift, iOS, Web 점수를 키보드로 부터 입력 받아 합계와 평균을 출력하세요
/// Swift 점수입력: 90
/// iOS 점수입력: 95
/// Web 점수입력: 100
/// 합계: 285
/// 평균: 95.0

print("Swift 점수입력: ", terminator: "")
var s = Int(readLine()!)!

print("iOS 점수입력: ", terminator: "")
var i = Int(readLine()!)!


print("Web 점수입력: ", terminator: "")
var w = Int(readLine()!)!

print("합계: \(s+i+w)")
print("평균: \(Double(s+i+w)/3.0)")
print("----------")

// MARK: -연산자 예제 6
/// 초를 입력 받아 [시, 분, 초] 형태로 출력하세요.
/// 초 입력: 3723
/// 1 시 2 분 3 초

print("초 입력: ", terminator: "")
var sec = Int(readLine()!)!

let h = sec / 3600
sec %= 3600

let m = sec / 60
sec %= 60

/// 강사님 풀이
let nm = (sec / 60) % 60;
let nh = (sec / 60) / 60;
let ns = sec % 60
///

print("\(h) 시 \(m) 분 \(sec) 초")
print("----------")

// MARK: -연산자 예제 7
/// 시급계산기 입니다. 기본시급은 5,000원이고, 8시간이 넘을 경우 초과된 시간은 시급의 1.5배를 책정해줍니다. (하루 13시간 이하 근무)
/// 노동 시간 입력: 11
/// 총 임금은 62,500 원 입니다.
///
print("노동 시간 입력: ", terminator: "")
let workHour = Int(readLine()!)!

let money = workHour > 8 ? (8 * 5000) + (workHour - 8) * Int(5000.0 * 1.5) : workHour * 5000

print(money%1000 == 0 ? "총 임금은 \(money/1000),000 원 입니다." : "총 임금은 \(money/1000),\(money%1000) 원 입니다.")
print("----------")

// MARK: -연산자 예제 8
/// 정수를 입력받아 홀수인지 짝수인지 판별하세요.(삼항연산자 이용)
/// 정수를 입력하세요: 35
/// 35는(은) 홀수입니다.
/// 정수를 입력하세요: 24
/// 35는(은) 짝수입니다.

for _ in 0..<2 {
    print("정수를 입력하세요: ", terminator: "")
    let n = Int(readLine()!)!
    
    print(n % 2 == 1 ? "\(n)는(은) 홀수입니다." : "\(n)는(은) 짝수입니다.")
}
print("----------")

// MARK: -연산자 예제 9
/// 두 개의 정수를 입력 받아 큰 수에서 작은 수를 뺀 결과값을 출력하세요. .(삼항연산자 이용)
/// 첫 번째 정수 입력: 10
/// 두 번째 정수 입력: 45
/// 두 수의 차: 35
/// 첫 번째 정수 입력: 87
/// 두 번째 정수 입력: 23
/// 두 수의 차: 64

for _ in 0..<2 {
    print("첫 번째 정수 입력: ", terminator: "")
    let a = Int(readLine()!)!
    
    print("두 번째 정수 입력: ", terminator: "")
    let b = Int(readLine()!)!
    print("두 수의 차: \(a > b ? a - b : b - a)") // abs
}

// MARK: -연산자 예제 10
/// 농구공을 담기 위해 필요한 상자의 개수를 구하세요.
/// 상자 하나에는 농구공이 5개 들어갈 수 있습니다. 만일 농구공이 ‘23’개라면 필요한 상자의 개수는 ‘5’개입니다.
/// 농구공의 개수를 입력하세요: 33
/// 필요한 상자의 수: 7
/// 농구공의 개수를 입력하세요: 20
/// 필요한 상자의 수: 4

print("농구공의 개수를 입력하세요: ", terminator: "")
let ball = Int(readLine()!)!

print("필요한 상자의 수: \(Int(ceil(Double(ball)/5.0)))")
print("필요한 상자의 수: \((ball % 5 != 0) ? ball / 5 + 1 : ball / 5)")

print("----------")

// MARK: - 조건문 예제 01
/// Int 타입의 변수 age를 선언하고 키보드로 값을 입력받으세요.
/// 만약 age가 20보다 크거나 같다면 “성인입니다.” 라고 출력하는 프로그램을 만들어 보세요.

let age = inputLineInt("입력:")

if age >= 20 {
    print("성인입니다")
}

print("----------")

// MARK: - 조건문 예제 02
/// 변수 num를 선언하고 키보드로 값을 입력받으세요.
/// 만약 num이 3의 배수이면서 5의 배수라면 “3과 5의 배수입니다”라고 출력하는 프로그램을 만들어보세요.

let numb = inputLineInt("입력:")

if numb % 15 == 0  {
    print("3과 5의 배수입니다.")
}
print("----------")

// MARK: - 조건문 예제 03
/// Int 타입의 변수 grade 를 선언하고 키보드로 값을 입력받으세요.
/// 만약 grade 가 60점이상이면 “합격입니다.” grade 가 60점 미만이면 “불합격입니다.” 를 출력하는 프로그램을 작성해보세요.

let grade = inputLineInt("점수 입력:")

if grade >= 60 {
    print("합격입니다.")
} else {
    print("불합격입니다.")
}

print("----------")

// MARK: - 조건문 예제 04
/// 정수를 입력 받아 양수, 음수, 0을 판별하여 다음과 같이 출력하세요.

let integer = inputLineInt("정수입력:")

if integer > 0 {
    print("\(integer) 양수입니다.")
} else if integer < 0 {
    print("\(integer) 음수입니다.")
} else {
    print("\(integer)입니다.")
}

print("----------")

// MARK: - 조건문 예제 05
/// Int 타입의 변수 num1, num2를 선언하고 키보드로 값을 입력받으세요.
/// 입력받은 num1과 num2 중 큰 수를 출력하는 프로그램을 만들어보세요.

let num1 = inputLineInt("첫 번째 정수 입력:")
let num2 = inputLineInt("두 번째 정수 입력:")
if num1 != num2 {
    print(num1 > num2 ? num1 : num2)
} else {
    print("두 수가 같습니다.")
}

// 다른 입력
let numArr = inputLineArrayInt("두 정수 입력(두 정수 사이 공백을 넣어주세요):")
if numArr.first! != numArr.last! {
    print(numArr.first! > numArr.last! ? numArr.first! : numArr.last!)
} else {
    print("두 수가 같습니다.")
}

print("----------")

// MARK: - 조건문 예제 06
/// 정보처리기사의 각 과목의 정답개수를 Int형 타입의 변수 5개를 선언하고 입력받으세요.
/// 한 과목이라도 8개 미만인 경우, “불합격입니다!”를 출력하고 총 개수가 60개 이상이면 “합격입니다!”를 출력하는 프로그램을 만들어보세요

let subj1 = inputLineInt("1과목 소프트웨어 설계:")
let subj2 = inputLineInt("2과목 소프트웨어 개발:")
let subj3 = inputLineInt("3과목 데이터베이스 구축:")
let subj4 = inputLineInt("4과목 프로그래밍 언어 활용:")
let subj5 = inputLineInt("5과목 정보시스템 구축관리:")

if subj1 < 8 || subj2 < 8 || subj3 < 8 || subj4 < 8 || subj5 < 8 {
    print("불합격입니다!")
} else if (subj1 + subj2 + subj3 + subj4 + subj5) >= 60 {
    print("합격입니다!")
}
print("----------")

// MARK: - 조건문 예제 07
/// 다음은 디즈니랜드 입장료 계산 프로그램입니다.
/// 기본료는 5000원이며 인원수에 따라 지불해야하는 프로그램을 만들어보세요.
/// 단, 미성년자인 경우 50%할인이 적용됩니다!
/// ==== 디즈니랜드에 오신 걸 환영합니다! ====
/// 나이를 말씀해주세요
/// 15
/// 인원수를 말씀해주세요
/// 5
/// 총 12500원 입니다.

print("==== 디즈니랜드에 오신 걸 환영합니다! ====")
let digAge = inputLineInt("나이를 말씀해주세요")
let numbers = inputLineInt("인원수를 말씀해주세요")
var res = 0;
if digAge < 20 {
    res = numbers * 2500
} else {
    res = numbers * 5000
}
print("총 \(res)원 입니다.")


// MARK: - 조건문 예제 08
/// 마트 계산대 프로그램입니다.
/// 10000원짜리 추석선물셋트를 구입했을 때 지불해야하는 금액을 계산해 보세요.
/// 단, 11개 이상 구매시에는 10%할인이 됩니다!

let itemsCount = inputLineInt("구매하려는 상품 갯수를 입력하세요")
var finalPrice = itemsCount*10000

if itemsCount >= 11 {
    finalPrice -= Int(Double(finalPrice)*0.1)
}
print("가격은 \(finalPrice) 원 입니다.")
print("----------")

// MARK: - 조건문 예제 9
/// Int 타입의 변수 grade 를 선언하고 키보드로 값을 입력받으세요.
/// Grade가
/// 90이상이면 “A학점입니다.”,
/// 80점 이상 90점 미만일 경우 “B학점입니다.”
/// 70점이상 80점 미만일 경우 “C학점입니다.” 를 출력하세요.

let g = inputLineInt("점수 입력:")
if g >= 90 {
    print("A학점입니다.")
} else if g >= 80 {
    print("B학점입니다.")
} else if g >= 70 {
    print("C학점입니다.")
}

print("----------")
// MARK: - 조건문 예제 10
/// String 타입의 변수 data 를 선언하고 키보드로 값을 입력 받으세요.
/// switch ~ case 문을 사용하여,
/// data가 “안녕하세요.” 일 때,“네, 안녕하세요!” 출력,
/// data 가 “반가워요.” 일 때, “네, 반가워요!” 출력,
/// data가 “수고하세요.” 일 때, “네, 수고하세요!” 출력,
/// 그 외 다른 문장일 때는 “잘못 입력하셨습니다.” 라고 출력하는 프로그램을 작성하세요.

let hi = inputLineString("user:")

switch hi {
case "hi.":
    print("mac: 네, 안녕하세요!")
case "nice meet you.":
    print("mac: 네, 반가워요!")
case "수고하세요.":
    print("mac: 네, 수고하세요.")
default:
    print("mac: ?")
}
