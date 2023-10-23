import UIKit

// MARK: - 액터 예제 02

actor Multiplier {
    let num: Int
    
    init(factor: Int) {
        num = factor
    }
    
    func multiply(_ secondNum: Int) -> Int {
        return num * secondNum
    }
}

func getResult(_ multiple: isolated Multiplier) -> Int {
    multiple.multiply(3)
}

let multiplier = Multiplier(factor: 2)

Task {
    let result = await multiplier.multiply(4)
    print(result) // 8
    
    print( await getResult(multiplier))
}


// MARK: - 액터 예제 03

actor Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
}

let counter = Counter()
Task {
    await counter.increment()
    print( await counter.count )
}
Task {
    await counter.increment()
    print( await counter.count )
}
Task {
    await counter.increment()
    print( await counter.count )
}
// 1
// 2
// 3


// MARK: - 액터 예제 04

actor Concatenator {
 
    func concatenate(_ str1: String, _ str2: String) -> String {
        return str1 + str2
    }
}

let concatenator = Concatenator()
Task {
    let result = await concatenator.concatenate("Hello", "World")
    print(result) // HelloWorld
}


// MARK: - 액터 예제 05

actor StringEx {
    var str: String
    
    init(_ inputStr: String) {
        str = inputStr
    }
    
    func capitalize() -> String {
        str.uppercased()
    }
    
    func lowercase() -> String {
        str.lowercased()
    }
    
    func reverse() -> String {
        String(str.reversed())
    }
}

let str = StringEx("swift")
Task {
    print(await str.capitalize()) // SWIFT
    print(await str.lowercase()) // swift
    print(await str.reverse()) // tfiws
}


// MARK: - 액터 예제 06

enum BankAccountError: Error {
    case wrongInputValue
    case insufficientBalance
}

actor BankAccount {
    var balance = 0

    // 입금 기능을 구현
    func deposit(_ money: Int) throws {
        guard money > 0 else { throw BankAccountError.wrongInputValue }
        balance += money
    }

    // 출금 기능을 구현
    func withdraw(_ money: Int) throws {
        guard balance >= money else { throw BankAccountError.insufficientBalance }
        balance -= money
    }
}

let account = BankAccount()

Task {
    do {
        // account 에 1000원을 입금
        try await account.deposit(1000)
    } catch BankAccountError.wrongInputValue {
        print("Error: 잘못된 입력입니다.")
    }
    
    do {
        // account 에서 500원을 출금
        try await account.withdraw(500)
    } catch BankAccountError.insufficientBalance {
        print("Error: 잔액이 부족합니다.")
    }
    // account 의 잔액을 출력
    print( "현재 잔액:", await account.balance )
}
// 현재 잔액: 500

Task {
    do {
        // account 에 3000원을 입금
        try await account.deposit(3000)
    } catch BankAccountError.wrongInputValue {
        print("Error: 잘못된 입력입니다.")
    }
    
    do {
        // account 에서 6000원을 출금
        try await account.withdraw(6000)
    } catch BankAccountError.insufficientBalance {
        print("Error: 잔액이 부족합니다.")
    }
    // account 의 잔액을 출력
    print( "현재 잔액:", await account.balance )
}
// Error: 잔액이 부족합니다.
// 현재 잔액: 3500


// MARK: - 딕셔너리 예제 01

func mostFrequentValue(dict: [String: Int]) -> Int {
    var countDictionary = [Int: Int]()
    var maxCount = 0
    var mostFrequent = Int()
    
    dict.forEach { (_, value) in
        countDictionary[value, default: 0] += 1
        if let c = countDictionary[value], c > maxCount {
            maxCount = c
            mostFrequent = value
        }
    }
    return mostFrequent
}

let dict1 = ["a": 1, "b": 2, "c": 3, "d": 2, "e": 2]
print( mostFrequentValue(dict: dict1) )  // 2


// MARK: - 딕셔너리 예제 02

func reverseKeyValue(dict: [String: String]) -> [String: String] {
    return dict.reduce(into: [String: String]()) { (reverseDict, pairValue) in
        let (key, value) = pairValue
        reverseDict[value] = key
    }
}

let dict2 = ["apple": "red", "banana": "yellow", "grape": "purple"]
print(reverseKeyValue(dict: dict2))       // ["red": "apple", "yellow": "banana", "purple": "grape"]


// MARK: - 딕셔너리 예제 03

func keysWithValue(dict: [String: Int], value: Int) -> [String] {
    return Array(dict.filter{ $0.value == value }.keys)
}

let dict3 = ["a": 1, "b": 2, "c": 3, "d": 2, "e": 1]
print(keysWithValue(dict: dict3, value: 2))       // ["d", "b"]


// MARK: - 딕셔너리 예제 04

func dictToString(dict: [String: Any]) -> String {
    return dict.map { "\($0.key):\($0.value)" }.sorted().joined(separator: ",")
}

let dict4: [String: Any] = ["name": "Alice", "age": 20, "gender": "female"]
print(dictToString(dict: dict4))       // age:20,gender:female,name:Alice


// MARK: - 딕셔너리 예제 05

func sumOfKeysAndValues(dict: [Int: Int]) -> (Int, Int) {
    
    return dict.reduce(into: (Int(), Int())){ (result, pairValue) in
        result.0 += pairValue.key
        result.1 += pairValue.value
    }
}

let dict5 = [1: 10, 2: 20, 3: 30]
print(sumOfKeysAndValues(dict: dict5))       // (6, 60)


// MARK: - 딕셔너리 예제 06

let person: [String : Any] = ["name": "Kim", "age": 25, "job": "programmer"]
print( person["name"] ?? "Unknown") // Kim


// MARK: - 딕셔너리 예제 07

let fruit = ["apple": 3, "banana": 5, "orange": 2]
fruit.forEach{ print("key: \($0.key)"); print("value: \($0.value)") }// key: apple
// value: 3
// key: banana
// value: 5
// key: orange
// value: 2


// MARK: - Set 예제 01

func intersect(_ a: Set<Int>, _ b: Set<Int>) -> Set<Int> {
    a.intersection(b)
}

let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]
let intersection = intersect(setA, setB)
print(intersection) // [3, 4, 5]


// MARK: - Set 예제 02

func unite(_ a: Set<String>, _ b: Set<String>) -> Set<String> {
    a.union(b)
}

let setC: Set<String> = ["apple", "banana", "cherry"]
let setD: Set<String> = ["cherry", "durian", "elderberry"]
let union = unite(setC, setD)
print(union) // ["apple", "banana", "cherry", "durian", "elderberry"]


// MARK: - Set 예제 03

func subtract(_ a: Set<Double>, _ b: Set<Double>) -> Set<Double> {
    a.subtracting(b)
}

let setE: Set<Double> = [1.0, 2.0, 3.0, 4.0, 5.0]
let setF: Set<Double> = [2.0, 4.0, 6.0]
let difference = subtract(setE, setF)
print(difference) // [1.0, 3.0, 5.0]


// MARK: - Set 예제 04

func disjoint(_ a: Set<Character>, _ b: Set<Character>) -> Bool {
    a.intersection(b).isEmpty
}

let setG: Set<Character> = ["a", "b", "c"]
let setH: Set<Character> = ["d", "e", "f"]
let isDisjoint = disjoint(setG, setH)
print(isDisjoint) // true


// MARK: - Set 예제 05

func getSubsets(_ set: Set<Int>) -> [[Int]] {
    var result = [[Int]]()
    let arr = Array(set)
    
    func subsets(index: Int, now: [Int]) {
        if index == arr.count {
            result.append(now)
            return
        }
        
        subsets(index: index + 1, now: now)
    
        subsets(index: index + 1, now: now + [arr[index]])
    }
    
    subsets(index: 0, now: [])
    
    return [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]
}

let setI: Set<Int> = [1, 2, 3]
let subsets = getSubsets(setI)
print(subsets) // [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]
