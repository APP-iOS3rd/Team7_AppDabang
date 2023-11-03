import Foundation

// MARK: - 클로저 예제 01
// 다음 코드에서 클로저의 반환 타입과 매개변수 타입을 추론하여 적어보세요.
// let add: (Int, Int) -> Int = { $0 + $1 }
// 반환타입은 Int

let add = { (_ a: Int, _ b: Int) -> Int in
    return a + b
}

// MARK: - 클로저 예제 02
// 다음 코드에서 클로저를 사용하여 배열의 모든 요소에 10을 곱한 새로운 배열을 만들어보세요.

let numbers = [1, 2, 3, 4, 5]

let newNumbers1 = {(arr :[Int]) -> [Int] in
    var ret: [Int] = []
    for i in 0..<arr.count {
        ret.append(arr[i] * 10)
    }
    return ret
}

//let newNumbers1 = numbers.map {$0 * 10}
print(newNumbers1(numbers))

// MARK: - 클로저 예제 03
// 다음 코드에서 클로저를 사용하여 배열의 홀수 요소만 필터링하여 새로운 배열을 만들어보세요.
let newNumbers2 = {(arr :[Int]) -> [Int] in
    var ret: [Int] = []
    for i in 0..<arr.count {
        if arr[i] % 2 == 1 { ret.append(arr[i])}
    }
    return ret
}

// let newNumbers2 = numbers.filter { $0 % 2 == 1 }
print(newNumbers2(numbers))

// MARK: - 클로저 예제 04
// 다음 코드에서 클로저를 사용하여 배열의 요소들의 합을 구해보세요.
let newNumbers4: ([Int]) -> Int = { arr in
    var ret = 0
    for a in arr {
        ret += a
    }
    return ret
}

// let numbersSum4 = numbers.reduce(0) { $0 + $1 }
print(newNumbers4(numbers))

// MARK: - 클로저 예제 05
// 다음 코드에서 클로저를 사용하여 배열의 요소들을 문자열로 변환하여 새로운 배열을 만들어보세요.
let newNumbers5: ([Int]) -> [String] = { arr in
    var ret:[String] = []
    for a in arr {
        ret.append(String(a))
    }
    return ret
}

//let newNumbers5 = numbers.map {String($0)}
print(newNumbers5(numbers))

// MARK: - 맵, 필터, 리듀스 예제 01
// 주어진 배열에서 홀수만 골라내서 제곱한 후 모두 더하는 함수를 작성하세요.
func sumOfSquaresOfOdds(array: [Int]) -> Int {
    array.filter { $0 % 2 == 1}.map { $0 * $0 }.reduce(0) { $0 + $1}
}

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(sumOfSquaresOfOdds(array: array))

// MARK: -  맵, 필터, 리듀스 예제 02
// 주어진 문자열에서 모음을 제거하고 대문자로 바꾼 후 역순으로 출력하는 함수를 작성하세요.
func reverseWithoutVowels(string: String) -> String {
    let cmp = "AEIOUW"
    //    let tmp = string.uppercased().filter { !cmp.contains($0) }
    let tmp = string.uppercased().filter { $0 != "A" || $0 != "E" || $0 != "I" || $0 != "O" || $0 != "U" || $0 != "W" }
    return String(tmp.reversed())
}

let string = "Hello World"
print(reverseWithoutVowels(string: string))

// MARK: - 맵, 필터, 리듀스 예제 03
// 주어진 딕셔너리에서 값이 짝수인 키들의 합을 구하는 함수를 작성하세요.
// 예시코드
func sumOfKeysWithEvenValues(dictionary: [String: Int]) -> Int {
    dictionary.filter { $0.value % 2 == 0}.reduce(0) { $0 + $1.value}
}

let dictionary = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5]
print(sumOfKeysWithEvenValues(dictionary: dictionary))

// MARK: - 맵, 필터, 리듀스 예제 04
// 주어진 배열에서 가장 큰 수와 가장 작은 수의 차이를 구하는 함수를 작성하세요.
// 예시코드
func differenceBetweenMaxAndMin(array: [Int]) -> Int {
    let sortedArr = array.sorted()
    return sortedArr.last! - sortedArr.first!
}

let array2 = [10, 20, 30, 40, 50]
print(differenceBetweenMaxAndMin(array: array2))

// MARK: - 맵, 필터, 리듀스 예제 05
// 주어진 배열에서 각 요소의 개수를 세어서 딕셔너리로 반환하는 함수를 작성하세요.
// 예시코드
func countElements(array: [String]) -> [String: Int] {
    var ret: [String : Int] = [:]

    array.map {
        ret[$0, default: 0] += 1
    }
    
    return ret
}
let array3 = ["a", "b", "a", "c", "b", "d"]
print(countElements(array: array3))

// MARK: - 맵, 필터, 리듀스 예제 06
// 주어진 배열에서 가장 많이 등장하는 요소를 반환하는 함수를 작성하세요.
// 만약 동률이 있다면 무작위로 하나를 반환.
// 예시코드
func mostFrequentElement(array: [String]) -> String {
    var ret: [String : Int] = [:]
    var mxVal = -1
    array.map {
        ret[$0, default: 0] += 1
        mxVal = max(ret[$0]!, mxVal)
    }
    
    return ret.filter { $0.value == mxVal }.first!.key
}

let array4 = ["a", "b", "a", "c", "b", "d"]
print(mostFrequentElement(array: array4))

// MARK: - 맵, 필터, 리듀스 예제 07
// 주어진 배열에서 각 요소의 앞뒤로 "*"을 붙여서 새로운 배열을 반환하는 함수를 작성하세요.
// 예시코드
func addStars(array: [String]) -> [String] {
    array.map { "*" + $0 + "*"}
}

let array5 = ["a", "b", "c"]
print(addStars(array: array5))

// MARK: - 맵, 필터, 리듀스 예제 08
// 주어진 배열에서 3의 배수만 골라내서 그 합을 구하는 함수를 작성하세요.
// 예시코드
func sumOfMultiplesOfThree(array: [Int]) -> Int {
    array.filter { $0 % 3 == 0}.reduce(0) { $0 + $1}
}
let array6 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(sumOfMultiplesOfThree(array: array6))

// MARK: - 맵, 필터, 리듀스 예제 09
// 주어진 배열에서 각 요소를 두 번 반복해서 새로운 배열을 반환하는 함수를 작성하세요.
// 예시코드
func repeatTwice(array: [String]) -> [String] {
    array.map { $0 + $0 }
}
let array7 = ["a", "b", "c"]
print(repeatTwice(array: array7))

// MARK: - 맵, 필터, 리듀스 예제 10
// 주어진 배열에서 각 요소의 길이를 새로운 배열로 반환하는 함수를 작성하세요.
// 예시코드
func lengthsOfElements(array: [String]) -> [Int] {
    array.map { $0.count }
}

let array8 = ["apple", "banana", "cherry"]
print(lengthsOfElements(array: array8))
