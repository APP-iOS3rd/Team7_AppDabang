//  Created by 박선구 on 2023/09/25.

import Foundation

//MARK: -

//MARK: 랜덤숫자게임

//var fn = Int.random(in: 0...20)
//var sn = Int.random(in: 0...20)
//var sum = fn + sn
//
//print("== Plus Game ==")
//
//print("\(fn) + \(sn) = ", terminator: "")
//let num = Int(readLine()!)!
//
//if sum == num {
//    print("Success!")
//}else{
//    print("Fail!")
//}

//MARK: -

//MARK: 랜덤숫자 게임 7-1



//    var fn = Int.random(in: 0...20)
//    var sn = Int.random(in: 0...20)
//    var sum = fn + sn
//    
//    print("== Plus Game ==")
//    
//while true{
//    print("\(fn) + \(sn) = ", terminator: "")
//    let num = Int(readLine()!)!
//    
//    if sum == num {
//        print("Success!")
//        print("계속 하시겠습니까? (Y/N): ", terminator: "")
//        let play = readLine()
//        if play == "N" {
//            break
//        }
//    }else{
//        print("Fail!")
//        print("계속 하시겠습니까? (Y/N): ", terminator: "")
//        let play = readLine()
//        if play == "N" {
//            break
//        }
//    }
//}
//MARK: -

//MARK: 랜덤숫자게임 7-2 (다시하기)

//while true {
//    var fn = Int.random(in: 0...20)
//    var sn = Int.random(in: 0...20)
//    var sum = fn + sn
//
//    print("== Plus Game ==")
//
//    print("\(fn) + \(sn) = ", terminator: "")
//    let num = Int(readLine()!)!
//
//    switch sum == num {
//    case true : print("Success!")
//        print("계속 하시겠습니까? (Y/N): ", terminator: "")
//        let play = readLine()
//        if play == "Y" {
//            break
//        }
//    case false : print("Fail!")
//        print("계속 하시겠습니까? (Y/N): ", terminator: "")
//        let play = readLine()
//        if play == "Y" {
//            print("\(fn) + \(sn) = ", terminator: "")
//            let num = Int(readLine()!)!
//        }else {
//            break
//        }
//    }
    
//    if sum == num {
//        print("Success!")
//    }else{
//        print("Fail!")
//    }
//    print("계속 하시겠습니까? (Y/N): ", terminator: "")
//    let play = readLine()
//
//    if play == "Y" {
//        print("\n")
//        continue
//    }else{
//        break
//    }
//}


//MARK: -

//MARK: 랜덤숫자게임 7-2

//while true {
//    var fn = Int.random(in: 0...20)
//    var sn = Int.random(in: 0...20)
//    var sum = fn + sn
//    
//    print("== Plus Game ==")
//    
//    print("\(fn) + \(sn) = ", terminator: "")
//    let num = Int(readLine()!)!
//    
//    if sum == num {
//        print("Success!")
//    }else{
//        print("Fail!")
//    }
//    print("계속 하시겠습니까? (Y/N): ", terminator: "")
//    let play = readLine()
//    
//    if play == "Y" {
//        print("\n")
//        continue
//    }else{
//        break
//    }
//}

//MARK: -

//MARK: for 문 00
//
//for i in 53...96 {
//    print(i)
//}

//for 문 00-1

//let j = 21...57
//
//for a in j where a % 2 != 0{  //where를 이용하여 조건을 넣는다.
//    print(a)
//}
//

//for 문 00-2


//1~100까지 3의 배수의 합을 출력하세요. (1683)
//var num = 0
//for i in 1...100 {
//    if i % 3 == 0 {
//        num += i
//    }
//}
//print(num)


//MARK: -


//MARK: for 문 3

//for i in 1...9 {
//    print("2 * \(i) = \(2 * i)")
//}

//MARK: -

//MARK: for 문 한 개의 자연수를 입력 받아 그 수의 배수를 차례로 10개 출력하는 프로그램을 작성하시오.

//print("정수 입력: ", terminator: "")
//let num = Int(readLine()!)!
//
//var a = 1...10
//
//for i in 1...10 {
//    print("\(num * i)")
//}

//MARK: -

//let j = 21...57
//
//for a in j where a % 2 != 0{  //where를 이용하여 조건을 넣는다.
//    print(a)
//}
//
//for i in 21...57 {
//    if i % 2 != 0 {
//        print(i)
//    }
//}

//MARK: -

//print("정수입력: ", terminator: "")
//let num = Int(readLine()!)!
//
//for i in 1...num {
//    print(i)
//}

//MARK: -

//MARK: for문 예제 4

//print("정수 입력: ", terminator: "")
//let number = Int(readLine()!)!
//
//for a in 1...9{
//    print("\(number) * \(a) = \(number * a)")
//}


//MARK: -

//MARK: for문 예제 5

//for a in 2...9{
//    print("\n===\(a)단===")
//    for i in 1...9 {
//        print("\(a) * \(i) = \(a * i)")
//    }
//}

//MARK: -

//MARK: for문 예제 6
//
//for a in 2...9{
//    print("\n\(a)단: ", terminator: "")
//    for i in 1...9 {
//        print("\(a) * \(i) = \(a * i) ", terminator: " ")
//    }
//}

//MARK: -

//MARK: for문 예제 7

//print("정수입력: ", terminator: "")
//let number = Int(readLine()!)!
//
//print("\(number)의 약수 : ", terminator: "")
//for q in 1...number {
//    if number % q == 0 {
//        print("\(q)", terminator: " ")
//        if q == number {
//            print("\n")
//        }
//    }
//}

//MARK: -

//MARK:  for문 예제 8

//for i in 2...30 {
//    print("\n\(i)의 약수: ", terminator: "")
//    for a in 1...30 {
//        if i % a == 0 {
//            print(a ,terminator: " ")
//            if a == 30 {
//                print("\n")
//            }
//        }
//    }
//}

//MARK: -

//MARK: for 예제 9-1
//
//var p = 0
//
//for _ in 1...5{
//    print("")
//    p += 1
//    for i in 1...p {
//        print("*", terminator: "")
//        if i == 5 {
//            print("\n")
//        }
//    }
//}

//MARK: -

//MARK: for문 예제 9-2
//
//var p = 5
//
//for some in 1...5{
//    print("")
//    p -= 1
//    for _ in 0...p {
//        print("*", terminator: "")
//        if some == 5 {
//            print("\n")
//        }
//    }
//}

//MARK: -

//MARK: for문 예제 9-3
//
//var o = 5
//var p = 0
//var k = 1...6
//
//for some in k{
//    print("")
//    p += 1
//    o -= 1
//    for _ in 0...o {
//        print(" ", terminator: "")
//    }
//    for _ in 1...p {
//        print("*", terminator: "")
////        if some == 5 {
////            print("\n")
////        }
//    }
//}


//MARK: -
//MARK: 별찍기 1 (수정)

//
//for i in (1...5).reversed() {
//    print("")
//    for _ in 1...i{
//        print("*", terminator: "")
//    }
//    for _ in 1...i{
//        print(" ", terminator: "")
//    }
//}
//MARK: -
//MARK: 별찍기 2 (수정)

//for i in (1...5).reversed() {
//    print("")
//    for _ in 1...i{
//        print("*", terminator: "")
//    }
//    for _ in 1...i{
//        print(" ", terminator: "")
//    }
//}

//MARK: -
//MARK: 별찍기3 (수정)

//for i in (1...5).reversed() {
//    print("")
//    for _ in 1...i{
//        print(" ", terminator: "")
//    }
//    for _ in i...5{
//        print("*", terminator: "")
//    }
//}

//MARK: -
//MARK: 별찍기 다이아 (수정)

//for i in (1...5).reversed(){
//    print("")
//    for _ in 1...i{
//        print(" ", terminator: "")
//    }
//    for _ in i...5{
//        print("*", terminator: "")
//    }
//    for _ in i...5{
//        print("*", terminator: "")
//    }
//}
//
//for i in 1...5 {
//    print("")
//    for _ in 1...i{
//        print(" ", terminator: "")
//    }
//    for _ in (i...5).reversed() {
//        print("*", terminator: "")
//    }
//    for _ in i...5 {
//        print("*", terminator: "")
//    }
//    
//}
//print("\n")


//MARK: -

//MARK: 369 게임 (다시하기)
 
//for i in 0...99{
//   print(i)
//    while i % 3 == 0 {
//        print("*")
//    }break
//}

//MARK: -
// 창준님 코드

//func forExercise10() {
//    for num in 0...99 {
//        var strNum = String(format: "%02d", num)
//        var tmp = ""
//        for s in strNum {
//            if let intS = Int(String(s)), intS != 0, intS % 3 == 0 {
//                tmp += "*"
//            }
//        }
//        strNum += tmp
//        tmp = ""
//        print(strNum)
//    }
//}

//MARK: -

// 경헌님 코드

for i in 0...9 {
    for j in 0...9 {
        // 여기서 부터
        print("\(i)\(j)", terminator: "")
        var cnt = 0
        if (i != 0 && i % 3 == 0) {
            cnt += 1
        }
            
        if (j != 0 && j % 3 == 0) {
            cnt += 1
        }
        
        for _ in 0..<cnt {
            print("*", terminator: "")
        }
        print("")
        // 여기까지가 한 줄
    }
}

//MARK: -

//MARK: 함수 해보기

//func hi() {
//    print("greeting, playground")
//}
//
//
//func rehi(cnt: Int) {
//    for _ in 1...cnt{
//        hi()
//    }
//}
//
//func whatplay(play: Int) {
//    for i in 1...play {
//        print(i)
//    }
//}
//
//whatplay(play: 20)
//
//func gugudan(dan: Int){
//    
//    for i in 1...9 {
//        print("\(i) * \(dan) = ", String(format: "%2d", dan * i))
//    }
//}
//
//
//func sum41(sum: Int, ans: Int){
//    var o = 0
//    print("\(o) = \(ans) + \(sum)")
//}
//
//sum41(sum: 14, ans: 24)

//MARK: -

//func printShape(start: Int, end: Int, shape: String){
//    for _ in start...end{
//        print(shape, terminator: "")
//    }
//}
//
//printShape(start: 1, end: 5, shape: "*")
