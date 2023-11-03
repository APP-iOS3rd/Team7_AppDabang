//
//  main.swift
//  04
//
//  Created by lkh on 2023/09/26.
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

// MARK: - 함수 예제 1
// 두 수의 합을 받아 아래와 같은 결과가 나올 수 있도록 addNumber() 를 작성하시오

func addNumber(_ a: Int, _ b: Int) -> Int {
    return a+b
}

// MARK: - 함수 예제 2
/* 2개의 정수를 받아 2개의 숫자 중 더 큰 수를 반환하는 largerNumbers() 을 만들어보세요
(만약 두 숫자가 같다면 0을 반환) */

func largerNumbers(_ a: Int, _ b: Int) -> Int {
    var res = 0;
    
    if a != b {
        res = a > b ? a : b
    }

    return res
}

// MARK: - 함수 예제 3
/* 2개의 정수를 받아 2개의 숫자 중 10에 더 가까운 수를 반환하는 close10() 을 만들어보세요
 (만약 두 숫자 모두 10과의 차이가 같다면 0을 반환) */

func close10(_ a: Int, _ b: Int) -> Int {
    var res = 0
    let diff1 = abs(10-a)
    let diff2 = abs(10-b)
    
    if diff1 != diff2 {
        res = diff1 < diff2 ? a : b
    }
    
    return res
}

// MARK: - 함수 예제 4
/* 2개의 정수 base, n을 받아 base의 n제곱 만큼 값을 반환하는 powerN() 를 작성하세요 */

func powerN(_ a: Int, _ b: Int) -> Int {
    var res = 1
    
    for _ in 0..<b {
        res *= a
    }
    
    return res
}


// MARK: - 함수 예제 5
/* 키보드로부터 입력받은 두 개의 정수를 인자(매개변수)로 넘겨받아 num1에서 num2를 뺀 결과값을 절대값으로 바꾸어 출력하는 getAbsoluteValue( ) 를 구현하세요 */

func getAbsoluteValue(_ a: Int, _ b: Int) -> Int {
    return abs(a-b)
}

// MARK: - 함수 예제 6
/* 두 개의 정수를 인자(매개변수)로 넘겨받아 앞의 정수가 뒤의 정수로 나누어지는지를 판별하는 isDivide( ) 를 작성하세요.
 (이때 나누어지면 true, 나누어지지 않으면 false을 반환) */
func isDivide(_ a: Int, _ b: Int) -> Bool {
    if (a == 0 || b == 0) {
        return false;
    }
    return a%b == 0 ? true : false;
}

// // MARK: - 함수 예제 7
func getDivisor(_ a : Int) {
    print("\(a)의 약수:", terminator: " ")
    for i in 1...a {
        if a % i == 0 {
            print(i, terminator: " ")
        }
    }
    print("")
    
    return
}

// // MARK: - 함수 예제 8
func getSumOfDivisors(_ a : Int) -> Int {
    print("\(a)의 약수의 합:", terminator: " ")
    var aSum:Int = 0
    
    for i in 1...a {
        if a % i == 0 {
            aSum += i
        }
    }
    
    return aSum
}

// MARK: - 함수 예제 9
// startValue...endValue까지의 숫자 중 완전수를 출력하는 getPerfectNumber() 를 구현하세요
// 자기 자신을 제외한 모든 양의 약수들의 합이 자기 자신이 되는 자연수를 완전수
func getPerfectNumber(_ startValue: Int, _ endValue: Int) {
    print("\(startValue)...\(endValue)까지의 완전수:", terminator: " ")
    
    for i in startValue...endValue {
        if (isPerfectNumber(i)) {
            print(i, terminator: " ")
        }
    }
    print("")
    
    func isPerfectNumber(_ a: Int) -> Bool {
        var sum = 0
        
        for i in 1..<a {
            if a%i == 0 {
                sum += i
            }
        }
        
        return sum == a ? true : false;
    }
    return;
}

// MARK: - 함수 예제 10
func getPrimNumber(_ startValue: Int, _ endValue: Int) {
    print("\(startValue)...\(endValue)까지의 소수:", terminator: " ")
    
    for i in startValue...endValue {
        if (isPrimeNumber(i)) {
            print(i, terminator: " ")
        }
    }
    print("")
    
    func isPrimeNumber(_ a: Int) -> Bool {
        if a < 4 {
            return a == 1 ? false : true
        }
        
        for i in 2...Int(sqrt(Double(a))) {
            if a%i == 0 {
                return false
            }
        }
        
        return true;
    }
    return;
}

// MARK: - 결과 확인

//// 1
//print("연산결과" ,addNumber(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//
//// 2
//print("큰 수 확인:", largerNumbers(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//print("큰 수 확인:", largerNumbers(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//print("큰 수 확인:", largerNumbers(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//
//
//// 3
//print("10에 가까운 수:", close10(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//print("10에 가까운 수:", close10(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//print("10에 가까운 수:", close10(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//print("10에 가까운 수:", close10(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//
//
//// 4
//print("결과 확인:", powerN(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//print("결과 확인:", powerN(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//print("결과 확인:", powerN(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//
//// 5
//print("결과 확인:", getAbsoluteValue(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//print("결과 확인:", getAbsoluteValue(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//
//
//// 6
//print("결과 확인:", isDivide(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//print("결과 확인:", isDivide(inputLineInt("1번째 수:"), inputLineInt("2번째 수:")))
//
//
//// 7
//getDivisor(10)
//getDivisor(16)
//getDivisor(24)
//
//// 8
//print(getSumOfDivisors(10))
//print(getSumOfDivisors(16))

// 9
//getPerfectNumber(2, 1000)
//
//// 10
//getPrimNumber(2, 30)

// MARK: -객체 속성과 기능을 작성해보기
//저금통 클래스

class PiggBank {
    var Money: Int;
    var size: Int;
    
    init(Money: Int, size: Int) {
        self.Money = Money
        self.size = size
    }
    
    func deposit(inputMoeny: Int) {
        if inputMoeny > size {
            print("한도 초과")
        } else {
            self.Money += inputMoeny;
        }
        return
    }
    
    func withdraw(wantedMoeny: Int) -> Int? {
        if wantedMoeny > Money {
            print("인출 불가")
            print("현재 잔액: \(Money)")
            return nil
        } else {
            Money -= wantedMoeny
            return Money
        }
    }
    
    func show() {
        print("현재 잔액:", self.Money)
        return
    }
}


var mybank = PiggBank(Money: 0, size: Int.max)

mybank.deposit(inputMoeny: 1500)
mybank.deposit(inputMoeny: 700)

mybank.show()

if let getMoney = mybank.withdraw(wantedMoeny: 500) {
    print("인출 성공")
}

mybank.show()

// MARK: - Class 예제 1

class Student{
    var name: String
    var id: String
    var age: Int
    var scoreSwift: Int
    var scoreiOs:Int
    var scoreWeb: Int
    
    init(name: String, id: String, age: Int, scoreSwift: Int, scoreiOs: Int, scoreWeb: Int) {
        self.name = name
        self.id = id
        self.age = age
        self.scoreSwift = scoreSwift
        self.scoreiOs = scoreiOs
        self.scoreWeb = scoreWeb
    }
    
    public func show() {
        print("[", self.id, "\(self.age)살 ]")
        print("\(self.name)님의 Swift 점수는 \(self.scoreSwift)입니다.")
        print("\(self.name)님의 iOS 점수는 \(self.scoreiOs)입니다.")
        print("\(self.name)님의 Web 점수는 \(self.scoreiOs)입니다.")

    }
}

// MARK: - Class 예제 2
let st1 = Student(name: "홍길동", id: "20200677", age: 22, scoreSwift: 50, scoreiOs: 89, scoreWeb: 77)
let st2 = Student(name: "김영희", id: "20190541", age: 26, scoreSwift: 90, scoreiOs: 85, scoreWeb: 70)

// MARK: - Class 예제 3
st1.show()
st2.show()

// MARK: - Class 예제 4

class Person {
    var name: String;
    var age: Int;
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    public func getName() -> String{
        return self.name;
    }
    
    public func setName(newName: String) {
        self.name = newName;
        return
    }
    
    public func getAge() -> Int {
        return self.age
    }
    
    public func setAge(newAge: Int) {
        self.age = newAge;
        return;
    }
}

// MARK: - 4

var stu1 = Person(name: "홍길동", age: 25)
var stu2 = Person(name: "김영희", age: 27)

print("st1 객체 학생 이름: \(stu1.getAge()), 나이: \(stu1.getAge())")
print("st2 객체 학생 이름: \(stu2.getAge()), 나이: \(stu2.getAge())")

// MARK: - 5
class Calculator {
    var num1: Int
    var num2: Int
    
    init(num1: Int, num2: Int) {
        self.num1 = num1
        self.num2 = num2
    }
    
    public func setNum1(_ a: Int) {
        self.num1 = a
        return
    }
    
    public func setNum2(_ a: Int) {
        self.num2 = a
        return
    }
    
    public func sum() -> Int {
        return self.num1 + self.num2
    }
    
    public func sub() -> Int {
        return self.num1 - self.num2
    }
    
    public func mul() -> Int {
        return self.num1 * self.num2
    }
    
    public func div() -> Int {
        return self.num1 / self.num2
    }
}

// MARK: - 5-1
let cal = Calculator(num1: 5, num2: 3)
print(cal.sum())

cal.setNum1(75)
cal.setNum2(5)

print(cal.sum())
print(cal.sub())
print(cal.mul())
print(cal.div())
