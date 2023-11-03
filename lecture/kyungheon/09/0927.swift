//
//  main.swift
//  05
//
//  Created by lkh on 2023/09/27.
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

// MARK: - 6
class TV {
    let name: String
    let year: Int
    let size: Int
    
    init(name: String, year: Int, size: Int) {
        self.name = name
        self.year = year
        self.size = size
    }
    
    public func show() -> String {
        return "\(self.name)에서 만든 \(self.year)년형 \(self.size)인치 TV"
    }
}

let myTv = TV(name: "SK", year: 2022, size: 48)
print(myTv.show())

// MARK: - 별찍기 클래스
class Shape {
    var size: Int = 1

    init(size: Int) {
        self.size = size
    }

    private func printShape (start: Int, end: Int, shape: String) -> String {
        var result: String = ""
        for _ in start...end {
            result += shape
        }
        return result
    }

    func drawShape() -> String {
        var str = ""
        for i in 1...size {
            str += printShape(start: 1, end: i, shape: "*") + "\n"
        }
        return str
    }

    func drawInvShape() -> String {
        var str = ""
        for i in (1...10).reversed() {
            str += printShape(start: 1, end: i, shape: "*") + "\n"
        }
        return str
    }
}

let shape = Shape(size: 10)
print( shape.drawShape() + shape.drawInvShape() )
print( shape.drawShape() + shape.drawInvShape() )

// MARK: - array 1
/* 정수형 데이터를 담을 수 있는 배열 array를 선언하세요

1. 정수형 데이터 10개를 담을 수 있도록 array배열을 생성하세요

2. 각각의 인덱스에 1~20까지의 랜덤수를 초기화하세요

3. 배열array의 각각에 인덱스에 들어있는 모든 데이터를 출력하세요.

4. 4번째 인덱스에 들어있는 값과 9번째 인덱스에 들어있는 값을 더하여 결과 값을 출력하세요

5. 각각의 인덱스에 들어있는 데이터를 모두 더하여 결과 값을 출력하세요

6. 배열 안에 있는 수의 평균을 구하여 출력하세요 */

var arr = [Int](repeating: 0, count: 10) // 1

// 2
for i in 0..<10 {
    arr[i] = Int.random(in: 1...20)
}

// 3
for i in 0..<10 {
    print(arr[i], terminator: " ")
}

// 4
print(arr[3]+arr[8])

// 5
var tot:Int = 0
for i in 0..<10 {
    tot += arr[i]
}
print(tot)

// 6

print(Double(tot)/10.0)


// MARK: - array 예제 2
/*1차원 정수형 배열을 선언한 후 임의의 값으로 초기화 합니다

배열의 값 중 짝수인 값만 출력하는 프로그램을 작성하세요*/
arr = [1,2,3,4,5,6,7,8,9,10]

var arr2:[Int] = []
for i in 0..<10 {
    if arr[i] % 2 == 0 {
        arr2.append(arr[i])
    }
}

print("array에 들어있는 짝수는 [", terminator: "")

for i in 0..<arr2.count {
    if (i == arr2.count-1) {
        print("\(arr2[i])]", terminator: " ")
    } else {
        print("\(arr2[i]), ", terminator: " ")
    }
}

print("이며", "총 \(arr2.count)개 입니다.")


// MARK: - array 예제 3
/*1차원 정수형 배열을 선언한 후 임의의 값으로 초기화 합니다

배열의 값 중 홀수인 값이 몇 개인지 출력하는 프로그램을 작성하세요*/
arr = [1,2,3,4,5,6,7,8,9,10]

var arr3:[Int] = []
for i in 0..<10 {
    if arr[i] % 2 == 1 {
        arr3.append(arr[i])
    }
}

print("array에 들어있는 홀수는 [", terminator: "")

for i in 0..<arr3.count {
    if (i == arr3.count-1) {
        print("\(arr3[i])]", terminator: " ")
    } else {
        print("\(arr3[i]), ", terminator: " ")
    }
}

print("이며", "총 \(arr3.count)개 입니다.")

// MARK: - array 예제 4
/*1차원 정수형 배열을 선언한 후 임의의 값으로 초기화 합니다

배열의 값 중 가장 큰 값을 찾아 출력하는 프로그램을 작성하세요*/

arr = [1,2,3,4,5,6,7,8,9,10]
print(arr.max()!)

// MARK: - array 예제 5
/*1차원 정수형 배열을 선언한 후 임의의 값으로 초기화 합니다

배열의 값 중 가장 작은 값을 찾아 출력하는 프로그램을 작성하세요*/
arr = [1,2,3,4,5,6,7,8,9,10]
print(arr.min()!)

// MARK: - array 예제 6
/*1차원 문자형 배열을 선언한 후 '수','박'으로 초기화 합니다.

 숫자를 입력받아 짝수인 경우 “수박수박”, 홀수인 경우 “수박수“ 를 출력하는 프로그램을 작성하세요*/

let subak: [Character] = ["수", "박"]
print("=== 수박 게임 시작! ===")
let iNum = inputLineInt("숫자를 입력해주세요:")

for i in 0..<iNum {
    if i % 2 == 0 {
        print(subak[0], terminator: "")
    } else {
        print(subak[1], terminator: "")
    }
}
print("")

// MARK: - array 예제 7
/*1차원 정수형 배열을 선언한 후 10개의 공간으로 생성합니다
 숫자를 입력 받아 3의 배수인 숫자를 출력하는 프로그램을 작성하세요*/
var arr7:[Int] = Array(repeating: 0, count: 10)
for i in 0..<10 {
    arr[i] = inputLineInt("\(i+1)번 째 정수 입력:")
}

print("3의 배수: ", terminator: "")
for i in 0..<10 {
    if arr7[i] % 3 == 0 {
        print(arr7[i], terminator: " ")
    }
}
print("")


// MARK: - array 예제 8
/*다음과 같이 정답이 있을 때 사용자로부터 답을 입력받아 결과를 출력하고 총점을 출력하는 프로그램을 작성하세요
 
 1, 1, 4, 2, 3*/
let ansArr = inputLineArrayInt("정답입력:")
var solArr = Array(repeating: 0, count: ansArr.count)

print("=== 채점하기! ===")
print("답을 입력하세요")
for i in 0..<ansArr.count {
    solArr[i] = inputLineInt("\(i)번 답:")
}

print("정답확인")
var cnt = 0
for i in 0..<ansArr.count {
    if (solArr[i] == ansArr[i]) {
        print("O", terminator: " ")
        cnt += 1
    } else {
        print("X", terminator: " ")
    }
}

print("총점:", cnt)

//배열의 (인덱스) 값 만큼 별을 출력해보세요*/
let startsArr = inputLineArrayInt("배열 입력(띄어쓰기 포함):")
for i in 0..<startsArr.count {
    print("\(startsArr[i]):",String(repeating: "*", count: startsArr[i]))
}
