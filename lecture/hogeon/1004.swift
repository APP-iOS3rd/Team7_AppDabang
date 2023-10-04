import Foundation

// 1004
// 예제 7
//var intArray: [Int] = []
//intArray.append(56)
//intArray.append(91)
//intArray.append(36)
//intArray.append(12)
//intArray.append(82)
//intArray.append(76)
//intArray.append(35)
//intArray.append(13)
//intArray.append(6)
//intArray.append(27)
//
//var result: [Int] = []
//for item in intArray {
//    if item % 3 == 0 {
//        result.append(item)
//    }
//}
//print(result)

// 예제 8
//var answer = [1, 1, 4, 2, 3]
//var inputAnswer = [2, 2, 2, 2, 2]
//
//var result: [String] = []
//for i in 0..<answer.count {
//    result.append( answer[i] == inputAnswer[i] ? "O" : "X" )
//}
//print(result)
//
//var sum = 0
//for item in result {
//    sum += (item == "O" ? 20 : 0)
//}
//print(sum)

// stack
// 예제 1
//func a(_ s:String) -> Bool
//{
//    var result = 0;
//    for c in s {
//        if c == "(" {
//            result += 1;
//        }else if c == ")" {
//            result -= 1;
//            if result < 0 {
//                return false;
//            }
//        }
//    }
//    return result == 0;
//}

// 예제 2
//func postFix(_ expression: String) -> Int {
//    let tokens = expression.split(separator: " ")
//
//    var stack = [String]()
//    for token in tokens {
//        if "+-*/".contains(token) {
//            let right = Int( stack.popLast()! )!
//            let left = Int( stack.popLast()! )!
//
//            switch token {
//            case "+":
//                stack.append( String(right + left) )
//            case "*":
//                stack.append( String(right * left) )
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
//    return Int( stack.popLast()! )!
//}
//
//
//print( postFix("2 3 + 4 *") )
