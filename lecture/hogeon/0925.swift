import Foundation

// 0925
// 원하는 단을 입력 받아 구구단 출력
//print("단 입력: ", terminator: "")
//var dan = Int(readLine()!)!
//
//    for j in 1...9 {
//        print("\(dan) * \(j) = \(dan * j)")
//}

// 구구단 1단~9단까지 출력
//for i in 1...9 {
//    print("===\(i)단===")
//    print("")
//    for j in 1...9 {
//        print("\(i) * \(j) = \(i * j)")
//    }
//}

// 6. 구구단 1단 ~ 9단까지 출력
//var result = "";
//for i in 1...9 {
//    print("\(i)단: ")
//    for j in 1...9 {
//        print("\(i) * \(j)")
//    }
//}

// 입력받은 정수의 약수 구하기
//print("정수입력: ", terminator: "")
//var n = Int(readLine()!)!
//for i in 1...n {
//    if n % i == 0 {
//        print("\(n)의 약수: \(i)")
//    }
//}


// 2~30까지의 약수 구하기
//for i in 2...30 {
//    print("\(i)의 약수:", terminator: " ")
//    for j in 1...i {
//        if i % j == 0 {
//            print(j, terminator: " ")
//        }
//    }
//    print("")
//}

// 별모양 출력
//for i in 0...4 {
//    for _ in 0...i {
//        print("*", terminator: "")
//    }
//    print("")
//}

//for i in 0...4 {
//    for _ in stride(from: 3, through: i, by: -1) {
//        print("*", terminator: "")
//    }
//    print("")
//}

//for i in 0...4 {
//    for _ in 0...i {
//        print("*", terminator: "")
//    }
//    print("")
//}

//for i in 1...4 {
//    for _ in i..<4 {
//        print(" ", terminator: "")
//    }
//    for _ in 1...i {
//        print("*", terminator: "")
//    }
//    print()
//}
