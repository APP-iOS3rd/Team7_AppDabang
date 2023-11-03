import Foundation

// MARK: - 딕셔너리 예제 01
/*
다음과 같은 딕셔너리가 주어졌을 때, 가장 많이 등장하는 값(value)을 출력하는 함수를 작성하세요.
*/

// 예시 코드
func mostFrequentValue(dict: [String: Int]) -> Int {
    var ret : Int = 0
    var maxVal: Int = -1
    var compareDict: [Int: Int] = [:]
    
    for (_, value) in dict {
        if let val = compareDict[value] {
            compareDict[value] = val + 1
        } else {
            compareDict[value] = 1
        }
    }
    
    for (key, value) in compareDict {
        if value > maxVal {
            maxVal = value
            ret = key
        }
    }
    
    return ret
}

let dict1 = ["a": 1, "b": 2, "c": 3, "d": 2, "e": 2] // 3
print(mostFrequentValue(dict: dict1))  // 2

// MARK: - 딕셔너리 예제 02
/*
다음과 같은 딕셔너리가 주어졌을 때, 키(key)와 값(value)의 순서를 바꾼 새로운 딕셔너리를 반환하는 함수를 작성하세요.

(단, 값(value)이 중복되는 경우는 고려하지 않는다.)
*/

// 예시 코드
func reverseKeyValue(dict: [String: String]) -> [String: String] {
    var ret: [String: String] = [:]
    
    for (key, value) in dict {
        ret[value] = key
    }
    
    return ret
}

let dict2 = ["apple": "red", "banana": "yellow", "grape": "purple"]
let result = reverseKeyValue(dict: dict2)
print(result)       // ["red": "apple", "yellow": "banana", "purple": "grape"]

// 딕셔너리 예제 03
/*
다음과 같은 딕셔너리가 주어졌을 때, 특정한 값(value)을 가진 모든 키(key)의 리스트(list)를 반환하는 함수를 작성하세요.
*/
// 예시 코드
func keysWithValue(dict: [String: Int], value: Int) -> [String] {
    var ret: [String] = []
    
    for d in dict { // 파리미터에 value가 있어서
        if value == d.value {
            ret.append(d.key)
        }
    }
    return ret
}

let dict3 = ["a": 1, "b": 2, "c": 3, "d": 2, "e": 1]
let result3 = keysWithValue(dict: dict3, value: 2)
print(result3)       // ["d", "b"]

// MARK: - 딕셔너리 예제 04
/*
다음과 같은 딕셔너리가 주어졌을 때, 모든 키(key)와 값(value)의 쌍(pair)을 문자열(string)로 변환하여 출력하는 함수를 작성하세요.

(단, 키(key)와 값(value) 사이에는 콜론(:)을, 쌍(pair) 사이에는 쉼표(,)를 넣어야 한다.)
*/

// 예시 코드
func dictToString(dict: [String: Any]) -> String {
    var ret: String = ""

    for (key, value) in dict {
        ret += (key+":\(value),")
    }
    
    ret.removeLast() // ,가 한번 더 찍히니
    return ret
}

let dict4: [String: Any] = ["name": "Alice", "age": 20, "gender": "female"]
let result4 = dictToString(dict: dict4)
print(result4)       // age:20,gender:female,name:Alice

// MARK: - 딕셔너리 예제 05
/*
다음과 같은 딕셔너리가 주어졌을 때, 모든 키(key)의 합(sum)과 모든 값(value)의 합(sum)을 각각 구하여 튜플(tuple)로 반환하는 함수를 작성하세요.
*/

// 예시 코드
func sumOfKeysAndValues(dict: [Int: Int]) -> (Int, Int) {
    var ret : (Int, Int) = (0, 0)
    
    for d in dict {
        ret.0 += d.key
        ret.1 += d.value
    }
    
    return ret
}

let dict5 = [1: 10, 2: 20, 3: 30]
let result5 = sumOfKeysAndValues(dict: dict5)
print(result5)       // (6, 60)

// MARK: - 딕셔너리 예제 06
/*다음과 같은 딕셔너리가 주어졌을 때, 키가 "name"인 값을 출력하는 코드를 작성하세요.*/

func findName(dict: [String: Any]) -> String {
    var ret : String = ""
    
    for d in dict {
        if (d.key == "name") {
            ret = "\(d.value)"
            break
        }
    }
    
    return ret
}

let person : [String: Any] = ["name": "Kim", "age": 25, "job": "programmer"]
print(findName(dict: person))

// MARK: - 딕셔너리 예제 07

func printDictionary(_ dict: [String: Int]) -> String {
//    for (key, value) in dict {
//        print(key, ":", value, terminator: " ")
//    }
//    print()
    var ret: String = ""
    for (key, value) in dict {
        ret += "\(key):\(value), "
    }
    
    ret.removeLast() // 공백 제거
    ret.removeLast() // , 제거
    return ret
}

let fruit = ["apple": 3, "banana": 5, "orange": 2]
print(printDictionary(fruit))
