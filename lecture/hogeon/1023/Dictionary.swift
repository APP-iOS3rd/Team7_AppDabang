/*
다음과 같은 딕셔너리가 주어졌을 때, 가장 많이 등장하는 값(value)을 출력하는 함수를 작성하세요.
// 예시 코드
func mostFrequentValue(dict: [String: Int]) -> Int {
    // 코드를 작성
}

let dict1 = ["a": 1, "b": 2, "c": 3, "d": 2, "e": 2]
mostFrequentValue(dict: dict1)  // 2
*/
func mostFrequentValue(dict: [String: Int]) -> Int {
    var frequency = [Int:Int]()
    for value in dict.values {
        frequency[value, default: 0] += 1
    }

    var maxFreq = 0
    var maxValue = 0
    for (value, freq) in frequency {
        if freq > maxFreq {
            maxFreq = freq
            maxValue = value
        }
    }

    return maxValue
}

let dict1 = ["a": 1, "b": 2, "c": 3, "d": 2, "e": 2]
mostFrequentValue(dict: dict1)  // 2

/*
다음과 같은 딕셔너리가 주어졌을 때, 키(key)와 값(value)의 순서를 바꾼 새로운 딕셔너리를 반환하는 함수를 작성하세요.

(단, 값(value)이 중복되는 경우는 고려하지 않는다.)
// 예시 코드
func reverseKeyValue(dict: [String: String]) -> [String: String] {
    // 코드를 작성
}

let dict2 = ["apple": "red", "banana": "yellow", "grape": "purple"]
let result = reverseKeyValue(dict: dict2)
print(result)       // ["red": "apple", "yellow": "banana", "purple": "grape"]
*/
func reverseKeyValue(dict: [String: String]) -> [String: String] {
    var reversedDict = [String:String]()
    for (key, value) in dict {
        reversedDict[value] = key
    }
    return reversedDict
}

let dict2 = ["apple": "red", "banana": "yellow", "grape": "purple"]
let result = reverseKeyValue(dict: dict2)
print(result)       // ["red": "apple", "yellow": "banana", "purple": "grape"]


/*
다음과 같은 딕셔너리가 주어졌을 때, 특정한 값(value)을 가진 모든 키(key)의 리스트(list)를 반환하는 함수를 작성하세요.
// 예시 코드
func keysWithValue(dict: [String: Int], value: Int) -> [String] {
    // 코드를 작성
}

let dict3 = ["a": 1, "b": 2, "c": 3, "d": 2, "e": 1]
let result = keysWithValue(dict: dict3, value: 2)
print(result)       // ["d", "b"]
*/
func keysWithValue(dict: [String: Int], value: Int) -> [String] {
    var keys = [String]()
    for (key, val) in dict {
        if value == val {
            keys.append(key)
        }
    }
    return keys
}

let dict3 = ["a": 1, "b": 2, "c": 3, "d": 2, "e": 1]
let result = keysWithValue(dict: dict3, value: 2)
print(result)       // ["d", "b"]


/*
다음과 같은 딕셔너리가 주어졌을 때, 모든 키(key)와 값(value)의 쌍(pair)을 문자열(string)로 변환하여 출력하는 함수를 작성하세요.

(단, 키(key)와 값(value) 사이에는 콜론(:)을, 쌍(pair) 사이에는 쉼표(,)를 넣어야 한다.)
// 예시 코드
func dictToString(dict: [String: Any]) -> String {
    // 코드를 작성

}

let dict4: [String: Any] = ["name": "Alice", "age": 20, "gender": "female"]
let result = dictToString(dict: dict4)
print(result)       // age:20,gender:female,name:Alice
*/
func dictToString(dict: [String: Any]) -> String {
    var str = ""
    for (key,value) in dict{
        str += "\(key):\(value),"
    }
    //마지막 반점 빼기
    str.removeLast()
    return str
}

/*
다음과 같은 딕셔너리가 주어졌을 때, 모든 키(key)의 합(sum)과 모든 값(value)의 합(sum)을 각각 구하여 튜플(tuple)로 반환하는 함수를 작성하세요.
// 예시 코드
func sumOfKeysAndValues(dict: [Int: Int]) -> (Int, Int) {
    // 코드를 작성
}

let dict5 = [1: 10, 2: 20, 3: 30]
let result = sumOfKeysAndValues(dict: dict5)
print(result)       // (6, 60)
*/
func sumOfKeysAndValues(dict: [Int: Int]) -> (Int, Int) {
  var sumOfKeys = 0
  var sumOgValues = 0
  for (key, value) in dict {
    sumOfKeys += key
    sumOgValues += value
  }
  return (sumOfKeys, sumOgValues)
}

/*
다음과 같은 딕셔너리가 주어졌을 때, 키가 "name"인 값을 출력하는 코드를 작성하세요.
*/
let person: [String : Any] = ["name": "Kim", "age": 25, "job": "programmer"]
print( person["name"] ?? "Unknown" )

/*
다음과 같은 딕셔너리가 주어졌을 때, 모든 키와 값을 한 줄씩 출력하는 코드를 작성하세요
*/
let fruit = ["apple": 3, "banana": 5, "orange": 2]
for (key, value) in fruit {
    print("\(key): \(value)")
}