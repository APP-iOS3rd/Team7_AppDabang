//
//  main.swift
//  Swift_sample
//
//  Created by 조민식 on 2023/09/21.
//

import Foundation
//
//for i in (53...96).reversed() {
//    print(i)
//}
//
//for j in 21...57{
//    if j % 2 == 0{
//        continue
//    }else{
//        print(j)
//    }
//}
//
//print("정수입력:",terminator: " ")
//let num1 = Int(readLine()!)!
//
//for k in 1...num1 {
//    print(k)
//}
//
//print("정수입력:",terminator: " ")
//let num2 = Int(readLine()!)!
//
//for l in 1...10{
//    print(num2 * l)
//}
//
//var sum = 0
//for q in 1...100{
//    if q % 3 == 0{
//        sum += q
//    }else{
//        continue
//    }
//}
//print(sum)
//

// 예제4

print("단 입력:",terminator: " ")
let dan = Int(readLine()!)!

for i in 1...9 {
    print("\(dan) * \(i) = \(dan * i)")
}

// 예제5

for i in 1...9{
    print("===\(i)단===")
    for j in 1...9{
        print("\(i) * \(j) = \(i*j)")
    }
    print("")
}


// 예제6

for i in 1...9{
    print("\(i)단:",terminator: " ")
    for j in 1...9{
        print("\(i) * \(j) = \(i*j)",terminator: "   ")
    }
    print("")
}


// 예제7

print("정수입력:",terminator: " ")
let num = Int(readLine()!)!

print("\(num)의 약수:",terminator: " ")
for i in 1...num {
    if 32 % i == 0{
        print(i,"",terminator: " ")
    }
}

 //예제8

for i in 2...32 {
    print("\(i)의 약수:",terminator: " ")
    for j in 1...i{
        if i % j == 0{
            print(j,"",terminator: " ")
        }
    }
    print("")
}

// 예제9

for i in 1...5 {
    print(String(repeating: "*", count: i))
}

// 예제9_2

for i in (1...5).reversed() {
    print(String(repeating: "*", count: i))
}


 //예제9_3

for i in 1...5 {
    for j in 1...5{
        if j <= (5 - i){
            print("",terminator: " ")
        }else{
            print("*",terminator: "")
        }
    }
    print("")
}


// 예제9_4

for i in 1...10 {
    if i <= 5{
        for _ in 1...(6 - i){
            print("",terminator: " ")
        }
        for _ in (5 - i)..<5{
            print("*",terminator: "")
        }
        for _ in (5 - i)..<5{
            print("*",terminator: "")
        }
        for _ in 1...(6 - i){
            print("",terminator: " ")
        }
    }else{
        for _ in 1...(i - 5){
            print("",terminator: " ")
        }
        for _ in (i - 5)...5{
            print("*",terminator: "")
        }
        for _ in (i - 5)...5{
            print("*",terminator: "")
        }
        for _ in 1...(i - 5){
            print("",terminator: " ")
        }
    }
    print("")
    
}


// 예제10

func claps(number: String) -> Int{
    var count_claps = 0
    count_claps += number.filter { $0 == "3"}.count
    count_claps += number.filter { $0 == "6"}.count
    count_claps += number.filter { $0 == "9"}.count
    return count_claps
}


for i in 0...9{
    for j in 0...9{
        var clap = 0
        if i == 3 || i == 6 || i == 9{
            clap += 1
        }
        if j == 3 || j == 6 || j == 9{
            clap += 1
        }
        print("\(i)\(j)",terminator: "")
        print(String(repeating: "*", count: clap))
    }
}


