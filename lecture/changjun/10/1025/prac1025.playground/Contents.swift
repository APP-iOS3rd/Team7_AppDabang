import UIKit

// MARK: - 맵, 필터, 리듀스 예제 11

func countVowels(_ word: String) -> Int {
    let vowels = "aeiou"
    return word.filter { vowels.contains($0.lowercased()) }.count
}

let vowelCount = countVowels("swift")
print(vowelCount) // 1


// MARK: - 맵, 필터, 리듀스 예제 12

func countAlphabets(_ word: String) -> [Character: Int] {
    return word
        .filter { $0.isLetter }
        .reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
}

let alphabetCount = countAlphabets("Hello2World!!")
print(alphabetCount)  // ["e": 1, "o": 2, "r": 1, "H": 1, "W": 1, "d": 1, "l": 3]

// MARK: - 맵, 필터, 리듀스 예제 13

func capitalize(_ sentence: String) -> String {
//    return sentence.capitalized
    return sentence.split(separator: " ")
                    .map { String($0).prefix(1).uppercased() + String($0).suffix($0.count - 1) }
                    .joined(separator: " ")
}

let capitalizedSentence = capitalize("this is a test")
print(capitalizedSentence)      // "This Is A Test"


// MARK: - 맵, 필터, 리듀스 예제 14

func reverse(_ numbers: [Int]) -> [Int] {
    let lastIndex = numbers.count - 1
    return numbers.map { numbers[lastIndex - numbers.firstIndex(of: $0)!] }
}

let reversedNumbers = reverse([1, 3, 4, 2, 5])
print(reversedNumbers)      // [5, 2, 4, 3, 1]


// MARK: - 맵, 필터, 리듀스 예제 15
func uppercase(_ word: String) -> String {
    return word.reduce(into: String()) { $0 += $1.isLowercase ? $1.uppercased() : $1.lowercased() }
}

let uppercasedWord = uppercase("swift")
print(uppercasedWord)       // "SWIFT"

// MARK: - 맵, 필터, 리듀스 예제 16

func removeSpaces(_ sentence: String) -> String {
    return sentence.filter { !$0.isWhitespace }
}

let noSpaceSentence = removeSpaces("This is a test")
print(noSpaceSentence)      // "Thisisatest"


// MARK: - 옵셔널 체이닝 예제 01

struct Person {
    var name: String?
    var age: Int?
}

var person: Person? = Person(name: "Kim", age: 25)

print(person?.name ?? "No Data") // Kim
print(person?.age ?? "No Data")  // 25


// MARK: - 옵셔널 체이닝 예제 02

struct Author {
    var name: String?
}

struct Book {
    var title: String?
    var author: Author?
}

var book: Book? = Book(title: "The Little Prince", author: Author(name: "Antoine de Saint-Exupéry"))

print(book?.title ?? "No Data")              // The Little Prince
print(book?.author?.name ?? "No Data")       // Antoine de Saint-Exupéry


// MARK: - 옵셔널 체이닝 예제 03

var numbers: [Int]? = [1, 2, 3]

print((numbers?[0] ?? 0) + 10) // 11


// MARK: - 옵셔널 체이닝 예제 04

var students: [String: Int]? = ["Kim": 90, "Lee": 80, "Park": 85]

print((students?["Lee"] ?? 0) + 1) // 81


// MARK: - 옵셔널 체이닝 예제 05

class Animal {
    func speak() {
        print("...")
    }
}

class Dog: Animal {
    override func speak() {
        print("Woof")
    }
}

var animal: Animal? = Dog()
animal?.speak() // Woof


// MARK: - 옵셔널 체이닝 예제 06

struct Matrix {
    var elements: [[Int]]

    func transpose() -> Matrix {
        var result = [[Int]]()
        for i in 0..<elements[0].count {
            var row = [Int]()
            for j in 0..<elements.count {
                row.append(elements[j][i])
            }
            result.append(row)
        }
        return Matrix(elements: result)
    }
}

var matrix: Matrix? = Matrix(elements: [[1, 2, 3], [4, 5, 6]])
print(matrix?.transpose().elements ?? "No Data")  // [[1, 4], [2, 5], [3, 6]]


// MARK: - 옵셔널 체이닝 예제 07

var numbersArray: [Int]? = [1, 2, 3, 4, 5]

if let numbersArr = numbersArray {
    print(numbersArr.reduce(0, +))  // 15
} else {
    print(0)
}


// MARK: - 옵셔널 체이닝 예제 08

struct Student {
    var name: String
    var score: Int
}

var studentsArray: [Student]? = [
    Student(name: "Kim", score: 80),
    Student(name: "Lee", score: 90),
    Student(name: "Park", score: 85)
]

if let studentsArr = studentsArray {
    print(studentsArr.map { $0.score }.reduce(0, +) / studentsArr.count)  // 85
} else {
    print(0)
}
