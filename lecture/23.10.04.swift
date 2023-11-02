//  Created by 박선구 on 2023/09/27.

import Foundation


//MARK: -
//MARK: 0927
//MARK: 객체지향 class 예제 1 (강사님 ver)
// 예제 1번

class Student {
    var name: String = ""
    var number: String = ""
    var age: Int = 0
    var scoreSwift: Int = 0
    var scoreiOS: Int = 0
    var scoreWeb: Int = 0
    
    func show() -> String{
        return "\(name)"
    }
}

//예제 2번
let student1: Student = Student()
student1.name = "홍길동"
student1.number = "20200677"
student1.age = 22
student1.scoreSwift = 50
student1.scoreiOS = 89
student1.scoreWeb = 77

let student2: Student = Student()
student2.name = "김영희"
student2.number = "20190541"
student2.age = 26
student2.scoreSwift = 90
student2.scoreiOS = 85
student2.scoreWeb = 70

//예제 3번
//print(student1.show())
//print("=============")
//print(student2.show())


//MARK: -
//MARK: class 예제 4 (강사님 ver)

class Person {
    private var name : String //private 외부에서 변수에 접근하는것을 방지 (접근제한자)
    private var age : Int
    
    init() { //default값을 만들어보기 (오버로딩)
        name = "이름없음"
        age = 0
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func getName() -> String {
        return name
    }
    
    func setName(name: String) {
        self.name = name
    }
    func getAge() -> Int{
        return age
    }
    func setAge(age: Int) {
        self.age = age
    }
    func show() -> String{
        return "이름: \(name), 나이: \(age)"
    }
}

//예제 4-1
let st0 = Person() //Default값 (오버로딩)
let st1 =  Person(name: "홍길동", age: 25) //init을 사용했기 때문에 따로 초기화를 해줘야 한다.
let st2 =  Person(name: "김영희", age: 27)

//print("(st1 객체 학생) \(st1.show())")
//print("(st2 객체 학생) \(st2.show())")
//print("(st 객체 학생) \(st0.show())")

//MARK: -
//예제 5



//MARK: class 예제 5-1 (강사님 ver)

class Calculator {
    var num1 : Int
    var num2 : Int
    init() {
        num1 = 0
        num2 = 0
    }
    init(num1: Int, num2: Int) {
        self.num1 = num1
        self.num2 = num2
    }
    func sum() -> Int {
        return num1 + num2
    }
    func sub() -> Int{
        return num1 - num2
    }
    func div() -> Int{
        return num1 / num2
    }
    func mul() -> Int{
        return num1 * num2
    }
    func setNum1(num1: Int) {
        self.num1 = num1
    }
    func setNum2(num2: Int) {
        self.num2 = num2
    }
}

let cal = Calculator(num1: 2, num2: 7)
cal.setNum1(num1: 10)
cal.setNum2(num2: 20)
let sum : Int = cal.sum()
let c = cal.sub()
//print(sum, c, cal.mul(), cal.div())

//MARK: -
//MARK: class 예제 06

class TV {
    var name: String
    var year: Int
    var size: Int
    
    init(name: String, year: Int, size: Int) {
        self.name = name
        self.year = year
        self.size = size
    }
    
    func show() -> String{
        return "\(name)에서 만든 \(year)년형 \(size)인치 TV"
    }
}

let myTv = TV(name: "LG", year: 2023, size: 48)
//print(myTv.show())

//MARK: -
//MARK: class 별찍기

class makeStar {
    func reverStar() {
        for i in (1...10).reversed(){
            print("")
            for _ in 1...i{
                print(" ", terminator: "")
            }
            for _ in i...10{
                print("*", terminator: "")
            }
            for _ in i...10{
                print("*", terminator: "")
            }
        }
    }
    func Star() {
        for i in 1...10 {
            print("")
            for _ in 1...i{
                print(" ", terminator: "")
            }
            for _ in i...10 {
                print("*", terminator: "")
            }
            for _ in i...10 {
                print("*", terminator: "")
            }

        }
    }
}

let star = makeStar()
//star.reverStar()
//star.Star()
//print("\n")

//MARK: -
//MARK: class 별찍기 (강사님 ver)
class Shape {
    var size : Int = 1
    
    init(size: Int) {
        self.size = size
    }
    
    func printShape(start: Int, end: Int, shape: String) -> String{
        var result: String = ""
        for _ in start...end {
            result += shape
        }
        return result
    }
    func drawShape() -> String{
        var str = ""
        for i in 1...size {
            str = printShape(start: 1, end: i, shape: "*") + "\n"
        }
        return str
    }
    
    func invdrawShape() -> String {
        var str = ""
        for i in (1...size).reversed() {
            str = printShape(start: 1, end: i, shape: "*") + "\n"
        }
        return str
    }
}

let shape = Shape(size: 10);
//print(shape.drawShape() + shape.invdrawShape())

//MARK: -
//MARK: 배열

var items = [8,9,10,11,12,15] //배열 생성

var sumItems = 0
for i in items { //items의 전체 합
    sumItems += i
}

print(sumItems)

//배열 인덱스의 항목위치를 참조하여 접근
items[0] = 10 //0번째 배열에 10넣기
print("0번째 인덱스의 값은: ",items[0]) //0번째

//문자열을 갖는 배열
var strArray: [String] = ["nice", "to", "meet", "you"]


//빈배열 생성
//var 변수명: [타입] = []
//var 변수명 = [타입]()


//기본값과 크기를 미리 설정하여 초기화
var nameArray = [String](repeating: "no Name", count: 10 )
print("nameArray 배열 항목 개수: ",nameArray.count)
print("nameArray 빈배열인가?: ",nameArray.isEmpty)

// 배열을 결합하여 새로운 배열 생성 : 같은 타입이라고 가정
print(strArray + nameArray)

// 배열 항목 섞기
let shuffledArray = strArray.shuffled()
print(strArray) //섞기 전
print(shuffledArray) //섞은 후

//배열 항목 무작위 접근
print(strArray.randomElement()!)

//배열에 항목 추가하기
strArray.append("PLEASE")
print(strArray)

strArray += ["HEY", "What"]
print(strArray)

// 배열 항목을 특정 위치에 추가
strArray.insert("jkl", at: 0)
print("strArray의 0번째 위치에 jkl 추가:", strArray)

// 배열 항목 삭제
// 배열 인덱스 위치에서 삭제
print( strArray.remove(at: 0) )
print("strArray의 0번째 위치 항목 삭제:", strArray)

// 배열 마지막 항목 삭제
print( strArray.removeLast() )

// 배열 모두 삭제
print( strArray.removeAll() )
print( strArray )
print("=====================\n")


//MARK: -
//MARK: 배열 예제 1

//  1.정수형 데이터를 담을 수 있는 배열 array를 선언하세요
//  2.정수형 데이터 10개를 담을 수 있도록 array배열을 생성하세요
//  3.각각의 인덱스에 1~20까지의 랜덤수를 초기화하세요
//  4.배열array의 각각에 인덱스에 들어있는 모든 데이터를 출력하세요.
//  5.4번째 인덱스에 들어있는 값과 9번째 인덱스에 들어있는 값을 더하여 결과 값을 출력하세요
//  6.각각의 인덱스에 들어있는 데이터를 모두 더하여 결과 값을 출력하세요
//  7.배열 안에 있는 수의 평균을 구하여 출력하세요

var array : [Int] = [1,2,3,4,5,6,7,8,9,10] //1,2

for _ in 1...10 { //3
    let a = Int.random(in: 0...9)
    let b = Int.random(in: 1...20)
    array[a] = b
}
print(array) //4
print(array[4] + array[9]) //4번째와 9번째의 합 //5

var sumArray = 0
for i in array { //array의 전체 합 //6
    sumArray += i
}
print(sumArray)

var avg: Float = Float(sumArray) / 10 //7
print(avg)

//MARK: -
//MARK: 배열 예제 2
//배열의 값 중 짝수인 값이 몇 개인지 출력하는 프로그램을 작성하세요

//var p = array[0] % 2
//var result = [Int]()
//
//for i in 0...9{
//    p = array[i] % 2
//    if p == 0 {
//        result.append(array[i]) //append = 배열 항목 추가
//    }
//}
//print("array에 들어있는 짝수는 \(result)입니다.")

//MARK: -
//MARK: 배열 예제 3
//배열의 값 중 홀수인 값이 몇 개인지 출력하는 프로그램을 작성하세요

var p = array[0] % 2
var result = [Int]()

for i in 0...9{
    p = array[i] % 2
    if p != 0 {
        result.append(array[i])
    }
}
print("array에 들어있는 홀수는 \(result)이며, 총 \(result.count)개 입니다.")


//MARK: -
//MARK: 배열 예제 4
//배열의 값 중 가장 큰 값을 찾아 출력하는 프로그램을 작성하세요

let maxArray = array.max()! //max는 배열안에 있는 값중 최댓값을 찾는다.
print("가장 큰 값은 \(maxArray)입니다.")

//MARK: -
//MARK: 배열 예제 5
//배열의 값 중 가장 작은 값을 찾아 출력하는 프로그램을 작성하세요

let minArray = array.min()! //min은 배열안에 있는 값중 최솟값을 찾는다.
print("가장 작은 값은 \(minArray)입니다.")

//MARK: -
//MARK: 배열 예제 6 (다시해보기)
//숫자를 입력받아 짝수인 4의 경우 “수박수박”, 홀수인 3의 경우 “수박수“ 를 출력하는 프로그램을 작성하세요

//var stArray : [String] = ["수","박"]
//print("=== 수박 게임 시작! ===")
//print("숫자를 입력해주세요: ", terminator: "")
//let number = Int(readLine()!)!
//
//var resArr = ""
//
//for i in 1...number {
//   let indexArray = (i - 1) % 2 // 짝수면 0 홀수면 1 저장
//    resArr += stArray[indexArray] //
//}
//print(resArr)

//MARK: -
//MARK: 배열 예제 7
//1차원 정수형 배열을 선언한 후 10개의 공간으로 생성합니다
//숫자를 입력 받아 3의 배수인 숫자를 출력하는 프로그램을 작성하세요

//var array7 = [Int](repeating: 0, count: 10)
//var result7 = [Int]()
//
//
//for i in 1...10{
//    print("\(i)번째 정수 입력: ", terminator: "")
//    let inputNum = Int(readLine()!)!
//    array7.remove(at: i-1)
//    array7.insert(inputNum, at: i-1)
//
//    var num7 = array7[i-1] % 3
//    if num7 == 0{
//        result7.append(array7[i-1])
//    }
//}
//
//print("3의 배수:", terminator:" ")
//for j in result7 {
//    print(j, terminator:" ")
//}
////print("3의 배수: \(result7.map {String($0)}.joined(separator: " "))") //또 다른 방법

//MARK: -
//MARK: 배열 예제 8
//다음과 같이 정답이 있을 때 사용자로부터 답을 입력받아 결과를 출력하고 총점을 출력하는 프로그램을 작성하세요

//var answer8 : [Int] = [1, 1, 4, 2, 3]
//var myAnswer = [Int]()
//var point = 0
//
//for i in 1...5{
//    print("\(i)번답: ", terminator: "")
//    myAnswer.insert(Int(readLine()!)!, at: i-1)
//}
//
//for j in 1...5{
//    if answer8[j-1] == myAnswer[j-1] {
//        print("O", terminator: " ")
//        point += 20
//    }else{
//        print("X", terminator: " ")
//    }
//    if j == 5{
//        print("총점: \(point)")
//    }
//}

//MARK: -
//MARK: 배열 예제 9
//배열의 (인덱스) 값 만큼 별을 출력해보세요

//var array9 : [Int] = [1,2,3,2,1]
var array9 = [Int]()

print("입력 횟수: ", terminator: "")
let inputNum = Int(readLine()!)!

for _ in 1...inputNum{
    print("별의 갯수 입력: ", terminator: "")
    let stars = Int(readLine()!)!
    array9.append(stars)
}

for i in 1...array9.count {
    print("")
    print("\(array9[i-1]): ", terminator: "")
    if array9[i-1] != 0 {
        for _ in 1...array9[i-1] {
            print("*", terminator: "")
        }
    }
    if i >= array9.count {
        print("\n")
    }
}

//MARK: -
//MARK: 스택 예제 1 (강사님 ver)
//func checkParentheses(_ input: String) -> Bool {
//
//    var stack: [Character] = []
//    for char in input {
//        if char == "(" || char == "{" || char == "["{
//            stack.append(char)
//        } else if char == ")" || char == "}" || char == "]"{
//            if stack.isEmpty {
//                return false
//            }
//
//            let top = stack.popLast()
//            if (char == ")" && top != "(") || (char == "}" && top != "{") || (char == "]" && top != "[") {
//                return false
//            }
//        }
//    }
//
//    return stack.isEmpty
//}
//
//print( checkParentheses("()()") )
//print( checkParentheses("({[}])") )
//print( checkParentheses("())(") )
//print( checkParentheses("({}[()]())") )

//MARK: -
//MARK: 스택 예제 2 (강사님 ver)

//func postFix(expression: String) -> Int{
//
//
//    let tokens = expression.split(separator: " ") //문자열을 잘라서 나눠주기
//
//    var stack = [String]()
//
//    for token in tokens {
//        if "+-*/".contains(token) {
//            let right = Int(stack.popLast()!)! //꺼낸 것중 숫자 하나를 오른쪽에 배정
//            let left = Int(stack.popLast()!)! //꺼낸 것중 숫자 하나를 왼쪽에 배정
//
//            switch token {
//            case "+":
//                stack.append(String(right + left))
//            case "*":
//                stack.append(String(right * left))
//            case "-":
//                stack.append(String(right - left))
//            case "/":
//                stack.append(String(right / left))
//            default:
//                break
//            }
//
//        } else {
//            stack.append(String(token))
//        }
//
//    }
//
//   return (Int(stack.popLast()!)!)
//}
//
//print(postFix(expression: "2 3 + 4 *"))
