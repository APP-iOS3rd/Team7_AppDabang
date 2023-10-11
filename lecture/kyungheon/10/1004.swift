//
//  main.swift
//  06
//
//  Created by lkh on 2023/10/04.
//

import Foundation

// MARK: - stack 예제 1
/* 스택을 이용하여 괄호의 짝이 맞는지 검사하는 알고리즘을 설계하고 구현하세요.

예를 들어, "(()())"는 올바른 괄호이지만, "())("는 올바르지 않습니다. 입력은 문자열로 받으며, 출력은 Bool 타입으로 반환하세요. */

func one(_ str: String) -> Bool {
    var stack:[Character] = []
    
    for s in str {
        if s == "(" || s == "[" || s == "{" {
            stack.append(s)
        } else {
            if stack.isEmpty {
                return false;
            }
            
            if s == ")" && stack.last! == "(" {
                stack.removeLast()
            } else if s == "]" && stack.last! == "[" {
                stack.removeLast()
            } else if s == "}" && stack.last! == "{" {
                stack.removeLast()
            } else {
                return false
            }
        }
    }
    return true;
}

//print(one("()()"))
//print(one("({[}])"))
//print(one("())("))
//print(one("({}[()]())"))

// MARK: - stack 예제 2
//스택을 이용하여 후위 표기법(postfix notation)으로 된 수식을 계산하는 알고리즘을 설계하고 구현하세요.

// 예를 들어, "2 3 + 4 *"는 (2 + 3) * 4와 같은 수식입니다. 입력은 공백으로 구분된 문자열로 받으며, 출력은 Int 타입으로 반환하세요.

func two(_ str: String) -> Int {
    var stack:[Int] = []
    var number:[Int] = []
    var op:[String] = []
    
    let splitedStr = str.split(separator: " ").map { String($0)}
    
    for s in splitedStr {
        if let Integer = Int(s) {
            number.append(Integer)
        }
        
        if s == "*" || s == "+" || s == "-" || s == "/" {
            op.append(s)
        }
    }
    
    stack.append(number.first!)
    number.removeFirst();
    
    // number의 길이가 op 배열의 길이 + 1
    for i in 0..<op.count {
        let fir = stack.removeFirst()
        if op[i] == "+" {
            stack.append(fir+number[i])
        } else if op[i] == "-" {
            stack.append(fir-number[i])
        } else if op[i] == "*" {
            stack.append(fir*number[i])
        } else if op[i] == "/" {
            stack.append(fir/number[i])
        }
    }
    return stack.last!;
}
    
print(two("2 3 + 4 *"))
    
    
// MARK: - stack 예제 3
// 스택을 이용하여 중위 표기법(infix notation)으로 된 수식을 후위 표기법으로 변환하는 알고리즘을 설계하고 구현하세요.

// 예를 들어, "(2 + 3) * 4"는 "2 3 + 4 *"로 변환됩니다. 입력은 공백으로 구분된 문자열로 받으며, 출력은 공백으로 구분된 문자열로 반환하세요.

func three(_ str : String) -> Int {
    var number:[Int] = []
    
    let splitedStr = str.split(separator: " ").map { String($0)}
    
    for s in splitedStr {
        if let Integer = Int(s) {
            number.append(Integer)
        }
        
        // 중위 표기식은 연산자를 만나면 stack에 이미 원소 2개가 들어가 있음
        if s == "+" {
            let fir = number.removeFirst()
            let sec = number.removeFirst()
            
            number.append(fir+sec)
        } else if s == "-" {
            let fir = number.removeFirst()
            let sec = number.removeFirst()
            
            number.append(fir-sec)
        } else if s == "*" {
            let fir = number.removeFirst()
            let sec = number.removeFirst()
            
            number.append(fir*sec)
        } else if s == "/" {
            let fir = number.removeFirst()
            let sec = number.removeFirst()
            
            number.append(fir/sec)
        }
    }
    return number.last!
}

print(three("2 3 + 4 *"))
