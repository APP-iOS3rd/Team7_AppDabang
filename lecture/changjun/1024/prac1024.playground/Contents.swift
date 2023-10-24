import UIKit

// MARK: - 딕셔너리 예제 08

let scores = ["math": 90, "english": 85, "science": 95]
if let maxScore = scores.max(by: { $0.value < $1.value }) {
    print(maxScore.key) // science
}


// MARK: - 딕셔너리 예제 09

let colors = ["red": "#FF0000", "green": "#00FF00", "blue": "#0000FF"]
let newDictionary = colors.reduce(into: [String: String]()) { (dict, pairValue) in
    dict[pairValue.value] = pairValue.key
}
print(newDictionary) // ["#00FF00": "green", "#FF0000": "red", "#0000FF": "blue"]


// MARK: - 딕셔너리 예제 10

let dictA = ["a": 1, "b": 2, "c": 3]
let dictB = ["b": 2, "c": 4, "d": 5]

let interKeys = Set(dictA.keys).intersection(Set(dictB.keys))

interKeys.forEach {
    if let valueA = dictA[$0], let valueB = dictB[$0] {
        print("\($0): \(valueA)")
        print("\($0): \(valueB)")
    }
}
// c: 3
// c: 4
// b: 2
// b: 2


// MARK: - 딕셔너리 예제 11

var even = ["a": 2, "b": 3, "c": 4, "d": 5]
//even.forEach {
//    if $0.value % 2 == 0 {
//        even[$0.key] = nil
//    }
//}
even = even.filter { $0.value % 2 == 0 }
print(even) // ["b": 3, "d": 5]


// MARK: - 딕셔너리 예제 12

let countries = ["KR": "South Korea", "US": "United States", "JP": "Japan", "CN": "China"]
print(countries.keys.sorted()) // ["CN", "JP", "KR", "US"]


// MARK: - 클로저 예제 01

let add: (Int, Int) -> Int = { $0 + $1 }
// 클로저의 반환 타입과 매개변수 타입 모두 Int


// MARK: - 클로저 예제 02 ~ 05

let numbers = [1, 2, 3, 4, 5]

let multiple10 = { $0 * 10 }
print(numbers.map(multiple10)) // [10, 20, 30, 40, 50]

let isOddNum = { (num: Int) -> Bool in return num % 2 == 1 }
print(numbers.filter(isOddNum)) // [1, 3, 5]

let getSum = { (a: Int, b: Int) -> Int in return a + b }
print(numbers.reduce(0, getSum)) // 15

let chageIntToString = { String($0 as Int) }
print(numbers.map(chageIntToString)) // ["1", "2", "3", "4", "5"]


// MARK: - Map, Filter, Reduce 예제 01

func sumOfSquaresOfOdds(array: [Int]) -> Int {
    return array.filter{ $0 % 2 == 1 }.reduce(into: Int()){ $0 += ($1 * $1) }
}

print(sumOfSquaresOfOdds(array: [1, 2, 3, 4, 5, 6, 7, 8, 9])) // 165


// MARK: - Map, Filter, Reduce 예제 02

func reverseWithoutVowels(string: String) -> String {
    let vowels = "aeiouAEIOU"
    return String(string.filter{ !vowels.contains(String($0)) }.uppercased().reversed())
}

print(reverseWithoutVowels(string: "Hello World")) // DLRW LLH


// MARK: - Map, Filter, Reduce 예제 03

func sumOfKeysWithEvenValues(dictionary: [String: Int]) -> Int {
    return dictionary.reduce(into: Int()){
        if $1.value % 2 == 0, let uni = UnicodeScalar($1.key) {
            $0 += Int(uni.value)
        }
    }
}
print(sumOfKeysWithEvenValues(dictionary: ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5])) // 198


// MARK: - Map, Filter, Reduce 예제 04

func differenceBetweenMaxAndMin(array: [Int]) -> Int {
//    guard let max = array.max(), let min = array.min() else { return 0 }
//    return max - min
            
    guard !array.isEmpty else { return 0 }
    return array.reduce(Int.min){ max($0, $1) } - array.reduce(Int.max){ min($0, $1) }
}

print(differenceBetweenMaxAndMin(array: [10, 20, 30, 40, 50]))


// MARK: - Map, Filter, Reduce 예제 05

func countElements(array: [String]) -> [String: Int] {
    return array.reduce(into: [String: Int]()){ $0[$1, default: 0] += 1 }
}

print(countElements(array: ["a", "b", "a", "c", "b", "d"])) // ["a": 2, "d": 1, "b": 2, "c": 1]


// MARK: - Map, Filter, Reduce 예제 06

func mostFrequentElement(array: [String]) -> String {
    return String( array
        .reduce(into: [String: Int]()){ $0[$1, default: 0] += 1 }
        .max(by: { $0.value < $1.value})!.key )
}

print(mostFrequentElement(array: ["a", "b", "a", "c", "b", "d"])) // d or a


// MARK: - Map, Filter, Reduce 예제 07

func addStars(array: [String]) -> [String] {
    return array.map{ "*\($0)*" }
}

print(addStars(array: ["a", "b", "c"])) // ["*a*", "*b*", "*c*"]


// MARK: - Map, Filter, Reduce 예제 08

func sumOfMultiplesOfThree(array: [Int]) -> Int {
    return array.filter{ $0 % 3 == 0 }.reduce(0, + )
}

print(sumOfMultiplesOfThree(array: [1, 2, 3, 4, 5, 6, 7, 8, 9])) // 18


// MARK: - Map, Filter, Reduce 예제 09

func repeatTwice(array: [String]) -> [String] {
    return array.reduce(into: [String]()){ $0 += [$1, $1] }
}

print(repeatTwice(array: ["a", "b", "c"])) // ["a", "a", "b", "b", "c", "c"]


// MARK: - Map, Filter, Reduce 예제 10

func lengthsOfElements(array: [String]) -> [Int] {
    return array.map { $0.count }
}

print(lengthsOfElements(array: ["apple", "banana", "cherry"])) // [5, 6, 6]
