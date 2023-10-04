//
//  stackExercise.swift
//  prac2
//
//  Created by phang on 10/4/23.
//

import Foundation

struct StackExercise {
    
    /*
     stack 예제 1
     스택을 이용하여 괄호의 짝이 맞는지 검사하는 알고리즘을 설계하고 구현하세요.
     예를 들어, "(()())"는 올바른 괄호이지만, "())("는 올바르지 않습니다. 입력은 문자열로 받으며, 출력은 Bool 타입으로 반환하세요.
     ()() -> true
     ({[}]) -> false
     ())( -> false
     ({}[()]()) -> true
     */
    func exercise01() -> Bool {
        let inputValue = getStringInputValue(message: "괄호 입력: ")
        let brackets: [Character: Character] = [")": "(", "}": "{", "]": "["]
        var stack = [Character]()
        
        for char in inputValue {
            switch char {
            case "(", "{", "[":
                stack.append(char)
            case ")", "}", "]":
                if stack.isEmpty || stack.popLast() != brackets[char] { return false }
            default: break
            }
        }
        return stack.isEmpty
    }
    
    /*
     stack 예제 2
     스택을 이용하여 후위 표기법(postfix notation)으로 된 수식을 계산하는 알고리즘을 설계하고 구현하세요.
     예를 들어, "2 3 + 4 *"는 (2 + 3) * 4와 같은 수식입니다. 입력은 공백으로 구분된 문자열로 받으며, 출력은 Int 타입으로 반환하세요.
     */
    func exercise02() -> Int {
        // TODO: 후위 표기식이 올바르게 들어왔는지에 대한 에러 체크 처리 X
        var stack = [Int]()
        let components = getStringInputValue(message: "후위 표기법 수식 입력: ").components(separatedBy: " ").filter { !$0.isEmpty }
        
        for component in components {
            if let numericValue = Int(component) {
                stack.append(numericValue)
            } else if stack.count >= 2 {
                let num2 = stack.popLast()!
                let num1 = stack.popLast()!
                
                switch component {
                case "+":
                    stack.append(num1 + num2)
                case "-":
                    stack.append(num1 - num2)
                case "*":
                    stack.append(num1 * num2)
                case "/":
                    stack.append(num1 / num2)
                default: break
                }
            }
        }
        return stack.last!
    }

    /*
     stack 예제 3
     스택을 이용하여 중위 표기법(infix notation)으로 된 수식을 후위 표기법으로 변환하는 알고리즘을 설계하고 구현하세요.
     예를 들어, "(2 + 3) * 4"는 "2 3 + 4 *"로 변환됩니다. 입력은 공백으로 구분된 문자열로 받으며, 출력은 공백으로 구분된 문자열로 반환하세요.
     "(2 + 3) * 5 - (3 * (5 - 2))" => "2 3 + 5 * 3 5 2 - * -"
     */
    func exercise03() -> String {
        var answer = [String]()
        var specialCharacter = [String]()
        let priorityOrder: [String: Int] = ["*": 1, "/": 1, "+": 2, "-": 2]
        let inputValue = getStringInputValue(message: "중위 표기법 수식 입력: ")
        
        for char in inputValue {
            let c = String(char)
            
            switch c {
            case "0"..."9":
                answer.append(c)
            case "+", "-", "*", "/":
                while let lastValue = specialCharacter.last, lastValue != "(",
                      priorityOrder[c]! >= priorityOrder[lastValue]! {
                    answer.append(specialCharacter.popLast()!)
                }
                specialCharacter.append(c)
            case "(":
                specialCharacter.append(c)
            case ")":
                while let lastValue = specialCharacter.last, lastValue != "(" {
                    answer.append(specialCharacter.popLast()!)
                }
                _ = specialCharacter.popLast()!
            default: break
            }
        }
        answer += specialCharacter.reversed()

        return answer.joined(separator: " ")
    }
    
}

extension StackExercise {
    
    // MARK: - [ 문자열 입력 함수 ]
    private func getStringInputValue(message msg: String) -> String {
        print("\(msg)", terminator: "")
        guard let input = readLine() else {
            print("입력 값 오류 - 올바른 문자를 입력하세요.")
            return getStringInputValue(message: msg)
        }
        return input
    }
    
}
