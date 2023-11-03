/*
주어진 배열에서 홀수만 골라내서 제곱한 후 모두 더하는 함수를 작성하세요.
// 예시코드
func sumOfSquaresOfOdds(array: [Int]) -> Int {
    // 여기에 코드를 작성
}

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print( sumOfSquaresOfOdds(array: array) )   // 165
*/
func sumOfSquaresOfOdds(array: [Int]) -> Int {
    return array.filter { $0 % 2 == 1 }
                .map { $0 * $0 }
                .reduce(0) { $0 + $1 }
}

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print( sumOfSquaresOfOdds(array: array) )   // 165
print( array.filter { $0 % 2 == 1 }.map { $0 * $0 }.reduce(0) { $0 + $1 } )

/*
주어진 문자열에서 모음을 제거하고 대문자로 바꾼 후 역순으로 출력하는 함수를 작성하세요.
let vowels = "aeiouAEIOU"
// 예시코드
func reverseWithoutVowels(string: String) -> String {
    // 여기에 코드를 작성
}

let string = "Hello World"
print( reverseWithoutVowels(string: string) )   // DLRW LLH
*/
func reverseWithoutVowels(string: String) -> String {
    String(
        string.filter { !"aeiouAEIOU".contains($0) }
            .uppercased()
            .reversed()
    )
}

let string = "Hello World"
print( reverseWithoutVowels(string: string) )   // DLRW LLH
print( String( string.filter { !"aeiouAEIOU".contains($0) }.uppercased().reversed() ) )

/*
주어진 딕셔너리에서 값이 짝수인 값들의 합을 구하는 함수를 작성하세요.
(보너스: 가능하신 분은 짝수인 값들의 키의 문자열 코드를 합하는 것을 시도해 보세요.)
// 예시코드
func sumOfKeysWithEvenValues(dictionary: [String: Int]) -> Int {
    // 여기에 코드를 작성
}

let dictionary = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5]
print( sumOfKeysWithEvenValues(dictionary: dictionary) )   // 6 (보너스 198)
*/
func sumOfKeysWithEvenValues(dictionary: [String: Int]) -> Int {
    dictionary
        .filter { $0.value % 2 == 0 }
        .map { $0.value }
        .reduce(0) { $0 + $1 }
}

let dictionary = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5]
print( sumOfKeysWithEvenValues(dictionary: dictionary) )   // 6 or 198
print( dictionary.filter { $0.value % 2 == 0 }.map { $0.value }.reduce(0) { $0 + $1 } )
print( dictionary.filter { $0.value % 2 == 0 }.values.reduce(0, +)  )

// 보너스
func sumOfKeysWithEvenValues(dictionary: [String: Int]) -> Int {
    Int(
        dictionary
            .filter { $0.value % 2 == 0 }
            .keys
            .reduce(0) { $0 + Character($1).asciiValue! }
    )
}

let dictionary = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5]
print( sumOfKeysWithEvenValues(dictionary: dictionary) )   // 6 or 198
print( dictionary.filter { $0.value % 2 == 0 }.keys.reduce(0) { $0 + Character($1).asciiValue! } )
print( dictionary.filter { $0.value % 2 == 0 }.map { $0.key }.reduce(0) { $0 + Character($1).asciiValue! } )
print( dictionary.filter { $0.value % 2 == 0 }.map { $0.key }.reduce(0) { $0 + $1.unicodeScalars.first!.value } )

/*
주어진 배열에서 가장 큰 수와 가장 작은 수의 차이를 구하는 함수를 작성하세요.
// 예시코드
func differenceBetweenMaxAndMin(array: [Int]) -> Int {
    // 여기에 코드를 작성
}

let array = [10, 20, 30, 40, 50]
print( differenceBetweenMaxAndMin(array: array) )   // 40
*/
func differenceBetweenMaxAndMin(array: [Int]) -> Int {
    array.max()! - array.min()!
}

let array = [10, 20, 30, 40, 50]
print( differenceBetweenMaxAndMin(array: array) )   // 40

/*
주어진 배열에서 각 요소의 개수를 세어서 딕셔너리로 반환하는 함수를 작성하세요.
// 예시코드
func countElements(array: [String]) -> [String: Int] {
    // 여기에 코드를 작성
}
let array = ["a", "b", "a", "c", "b", "d"]
print( countElements(array: array) )   // ["b": 2, "d": 1, "c": 1, "a": 2]
*/
// 결과코드
func countElements(array: [String]) -> [String: Int] {
    array.reduce(into: [:]){ $0[$1, default: 0] += 1 }
}
let array = ["a", "b", "a", "c", "b", "d"]
print( countElements(array: array) )   // ["b": 2, "d": 1, "c": 1, "a": 2]

/*
주어진 배열에서 가장 많이 등장하는 요소를 반환하는 함수를 작성하세요.
만약 동률이 있다면 무작위로 하나를 반환.
// 예시코드
func mostFrequentElement(array: [String]) -> String {
    // 여기에 코드를 작성
}
let array = ["a", "b", "a", "c", "b", "d"]
print( mostFrequentElement(array: array) )   // a
*/
func mostFrequentElement(array: [String]) -> String {
    let counts = array.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    let maxCount = counts.values.max()
    return counts
        .filter { $0.value == maxCount }
        .keys
        .randomElement()!
}

let array = ["a", "b", "a", "c", "b", "d"]
print( mostFrequentElement(array: array) )   // a or b
print( array.reduce(into: [:]) { $0[$1, default: 0] += 1 } )
let counts = array.reduce(into: [:]) { $0[$1, default: 0] += 1 }
let maxCount = counts.values.max()
print( counts.filter { $0.value == maxCount }.keys.randomElement()! )

/*
주어진 배열에서 각 요소의 앞뒤로 "*"을 붙여서 새로운 배열을 반환하는 함수를 작성하세요.
// 예시코드
func addStars(array: [String]) -> [String] {
    // 여기에 코드를 작성
}
let array = ["a", "b", "c"]
print( addStars(array: array) )   // ["*a*", "*b*", "*c*"]
*/
func addStars(array: [String]) -> [String] {
    return array.map { "*\($0)*"}
}
let array = ["a", "b", "c"]
print( addStars(array: array) )   // ["*a*", "*b*", "*c*"]

/*
주어진 배열에서 3의 배수만 골라내서 그 합을 구하는 함수를 작성하세요.
// 예시코드
func sumOfMultiplesOfThree(array: [Int]) -> Int {
    // 여기에 코드를 작성
}
let array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print( sumOfMultiplesOfThree(array: array) )   // 18
*/
func sumOfMultiplesOfThree(array: [Int]) -> Int {
    array.filter { $0 % 3 == 0 }.reduce(0, +)
}

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print( sumOfMultiplesOfThree(array: array) )   // 18

/*
주어진 배열에서 각 요소를 두 번 반복해서 새로운 배열을 반환하는 함수를 작성하세요.
// 예시코드
func repeatTwice(array: [String]) -> [String] {
    // 여기에 코드를 작성
}
let array = ["a", "b", "c"]
print( repeatTwice(array: array))   // ["a", "a", "b", "b", "c", "c"]
*/
func repeatTwice(array: [String]) -> [String] {
    array.map { $0 + $0 }
}

let array = ["a", "b", "c"]
print( repeatTwice(array: array))   // ["a", "a", "b", "b", "c", "c"]
print( array.flatMap { [$0, $0] } )

/*
주어진 배열에서 각 요소의 길이를 새로운 배열로 반환하는 함수를 작성하세요.
// 예시코드
func lengthsOfElements(array: [String]) -> [Int] {
    // 여기에 코드를 작성
}

let array = ["apple", "banana", "cherry"]
print( lengthsOfElements(array: array))   // [5, 6, 6]
*/
func lengthsOfElements(array: [String]) -> [Int] {
    return array.map { $0.count }
}

let array = ["apple", "banana", "cherry"]
print( lengthsOfElements(array: array))   // [5, 6, 6]
print( array.map { $0.count } )

/*
주어진 문자열에서 모음(a, e, i, o, u)의 개수를 세는 함수를 작성하세요.
// 예시코드
let word = "swift"
let vowelCount = countVowels(word)
print(vowelCount) // 1
*/
func countVowels(_ string: String) -> Int {
    string
        .map { "aeiou".contains($0.lowercased()) }
        .reduce(0) { $0 + ($1 ? 1 : 0) }
}

let word = "swift"
let vowelCount = countVowels(word)
print(vowelCount) // 1

print( word.map { "aeiou".contains($0.lowercased()) }.reduce(0) { $0 + ($1 ? 1 : 0) } )

/*
주어진 문자열에서 각 알파벳이 몇 번 나오는지 세는 함수를 작성하세요.
// 예시코드
let word = "Hello2World!!"
let alphabetCount = countAlphabets(word)
print(alphabetCount)  // ["e": 1, "o": 2, "r": 1, "H": 1, "W": 1, "d": 1, "l": 3]
*/
func countAlphabets(_ string: String) -> [Character:Int] {
    string
        .filter { $0.isLetter }
        .reduce(into: [:]) { $0[$1, default: 0] += 1 }
}

// 예시코드
let word = "Hello2World!!"
let alphabetCount = countAlphabets(word)

print(alphabetCount)  // ["e": 1, "o": 2, "r": 1, "H": 1, "W": 1, "d": 1, "l": 3]

/*
주어진 문자열에서 각 단어의 첫 글자를 대문자로 바꾸는 함수를 작성하세요.
// 예시코드
let sentence = "this is a test"
let capitalizedSentence = capitalize(sentence)
print(capitalizedSentence)      // "This Is A Test"
*/
func capitalize(_ string: String) -> String {
    string
        .split(separator: " ")
        .map { $0.capitalized }
        .joined(separator: " ")
}

let sentence = "this is a test"
let capitalizedSentence = capitalize(sentence)
print(capitalizedSentence)      // "This Is A Test"

print( sentence.split(separator: " ").map { $0.capitalized }.joined(separator: " ") )

/*
주어진 배열에서 각 요소를 역순으로 정렬하는 함수를 작성하세요.
(컬렉션에서 제공하는 역순함수를 사용하지 않고 구현해 보세요.)
// 예시코드
let numbers = [1, 3, 4, 2, 5]
let reversedNumbers = reverse(numbers)
print(reversedNumbers)      // [5, 2, 4, 3, 1]
*/
func reverse(_ array: [Int]) -> [Int] {
    array.map { array[ array.count - 1 - array.firstIndex(of: $0)! ] }
}

// 예시코드
let numbers = [1, 3, 4, 2, 5]
let reversedNumbers = reverse(numbers)
print(reversedNumbers)      // [5, 2, 4, 3, 1]

print( numbers.map { numbers[ numbers.count - 1 - numbers.firstIndex(of: $0)! ] } )

/*
주어진 문자열에서 모든 소문자를 대문자로 바꾸는 함수를 작성하세요.
(보너스: 대문자는 소문자로 소문자는 대문자로 시도해 보세요.)
// 예시코드
let word = "swift"
let uppercasedWord = uppercase(word)
print(uppercasedWord)       // "SWIFT"
*/
func uppercase(_ string: String) -> String {
    string
        .map { $0.uppercased() }
        .joined()
}

let word = "swift"
let uppercasedWord = uppercase(word)
print(uppercasedWord)       // "SWIFT"

print( word.map { $0.uppercased() }.joined() )

/*
주어진 문자열에서 모든 공백을 제거하는 함수를 작성하세요.
// 예시코드
let sentence = "This is a test"
let noSpaceSentence = removeSpaces(sentence)
print(noSpaceSentence)      // "Thisisatest"
*/
func removeSpaces(_ string: String) -> String {
    sentence.filter { !$0.isWhitespace }
}
// 예시코드
let sentence = "This is a test"
let noSpaceSentence = removeSpaces(sentence)
print(noSpaceSentence)      // "Thisisatest"

print( sentence.map { $0.isWhitespace ? "" : String($0) }.joined() )
print( sentence.filter { !$0.isWhitespace } )