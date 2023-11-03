import UIKit

// MARK: - Enum 06
enum Direction {
    case right, left, up, down
}

func move(position: (x: Int, y: Int), direction: Direction) -> (x: Int, y: Int) {
    switch direction {
    case .right:
        return (position.x + 1, position.y)
    case .left:
        return (position.x - 1, position.y)
    case .up:
        return (position.x, position.y + 1)
    case .down:
        return (position.x, position.y - 1)
    }
}

let currentPosition = (x: 0, y: 0)

var nextPosition = move(position: currentPosition, direction: .right)
print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (1, 0)입니다.
nextPosition = move(position: currentPosition, direction: .left)
print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (-1, 0)입니다.
nextPosition = move(position: currentPosition, direction: .up)
print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (0, 1)입니다.
nextPosition = move(position: currentPosition, direction: .down)
print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (0, -1)입니다.


// MARK: - Enum 07
enum Dice: Int {
    case one, two, three, four, five, six
}

func rollDice() -> Dice {
    let randomNum = Int.random(in: Dice.one.rawValue...Dice.six.rawValue)
    guard let result = Dice(rawValue: randomNum) else { fatalError("There is no \(randomNum) in Dice") }
    return result
}

//enum Dice: CaseIterable {
//    case one, two, three, four, five, six
//}
//
//func rollDice() -> Dice { return Dice.allCases.randomElement()! }

let dice = rollDice()

print("주사위의 면은 \(dice)입니다.")   // 주사위의 면은 ~~~입니다.

// MARK: - Enum 08
enum Color {
    case red(r: Int, g: Int, b: Int)
    case green(r: Int, g: Int, b: Int)
    case blue(r: Int, g: Int, b: Int)
    
    var name: String {
        switch self {
        case .red:
            return "빨강"
        case .green:
            return "초록"
        case .blue:
            return "파랑"
        }
    }
    
    var rgb: (Int, Int, Int) {
        switch self {
        case .red(let r, let g, let b),
             .green(let r, let g, let b),
             .blue(let r, let g, let b):
            return (r, g, b)
        }
    }
}

func printColors(colors: [Color]) {
    colors.forEach { color in
        let (r, g, b) = color.rgb
        print("이 색상은 \(color.name)이고 RGB 값은 (\(r), \(g), \(b))입니다.")
    }
}

let colors = [Color.red(r: 255, g: 0, b: 0), Color.green(r: 0, g: 255, b: 0), Color.blue(r: 0, g: 0, b: 255)]
printColors(colors: colors)
//이 색상은 빨강이고 RGB 값은 (255, 0, 0)입니다.
//이 색상은 초록이고 RGB 값은 (0, 255, 0)입니다.
//이 색상은 파랑이고 RGB 값은 (0, 0, 255)입니다.

// MARK: - Error handling 01
enum TemperatureError: Error {
    case invalidTemperature
}

func celsiusToFahrenheit(_ celsius: Double) throws -> Double {
    guard celsius >= -273.15 else { throw TemperatureError.invalidTemperature}
    return Double(celsius) * 1.8 + Double(32)
}
// (화씨온도 - 32) ÷ 1.8 = 섭씨온도 C
// (섭씨온도 × 1.8) + 32 = 화씨온도 F
do {
    let fahrenheit1 = try celsiusToFahrenheit(-200)
    print(fahrenheit1)

    let fahrenheit2 = try celsiusToFahrenheit(-300)
    print(fahrenheit2)
    
} catch TemperatureError.invalidTemperature {
    print("Invalid temperature")
}
// Invalid temperature

// MARK: - Error handling 02
enum PasswordError: Error {
    case tooShort, missingUppercase, missingLowercase, missingNumber, missingSymbol
}
    
func validatePassword(_ password: String) throws {
//    let pattern = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\",.<>?])[A-Za-z\\d!@#$%^&*()_+\\-=\\[\\]{};':\",.<>?]{8,}$"

    guard password.count >= 8 else { throw PasswordError.tooShort }
    
    guard password.range(of: "[A-Z]", options: .regularExpression) != nil else { throw PasswordError.missingUppercase }
    
    guard password.range(of: "[a-z]", options: .regularExpression) != nil else { throw PasswordError.missingLowercase }
    
    guard password.range(of: "\\d", options: .regularExpression) != nil else { throw PasswordError.missingNumber }
    
    guard password.range(of: "[!@#$%^&*()_+-=\\[\\]{}|;:,./<>?]", options: .regularExpression) != nil else { throw PasswordError.missingSymbol }
    
    print("Available Password")
}

do {
//    try validatePassword("abc123")
//    try validatePassword("abc12345678")
//    try validatePassword("Abc12345678")
    try validatePassword("Abc123456#")
} catch let error as PasswordError {
    switch error {
    case .tooShort:
        print("Password is too short")
    case .missingUppercase:
        print("Password is missing an uppercase letter")
    case .missingLowercase:
        print("Password is missing a lowercase letter")
    case .missingNumber:
        print("Password is missing a number")
    case .missingSymbol:
        print("Password is missing a symbol")
    }
}

// MARK: - Error handling 03
enum ATMError: Error {
    case negativeAmount, insufficientBalance
}

class ATM {
    var balance: Double = 0
    
    func deposit(amount: Double) -> Bool {
        guard amount > 0 else { return false }
        self.balance += amount
        return true
    }
    
    func withdraw(amount: Double) throws -> Double {
        guard amount > 0 else { throw ATMError.negativeAmount }
        guard amount <= self.balance else { throw ATMError.insufficientBalance }
        self.balance -= amount
        return amount
    }
}


let atm = ATM()
atm.deposit(amount: 1000)
print(atm.balance)              // 1000.0

do {
    let cash = try atm.withdraw(amount: 500)
    print(cash)                 // 500.0
} catch let error as ATMError {
    switch error {
    case .negativeAmount:
        print("Cannot withdraw a negative amount")
    case .insufficientBalance:
        print("Cannot withdraw more than balance")
    }
}
print(atm.balance)              // 500.0

// MARK: - Error handling 04
enum CalculatorError: Error {
    case divisionByZero
}

struct Calculator {
    var result: Double = 0
    
    mutating func add(_ number: Double) {
        self.result += number
    }
    
    mutating func subtract(_ number: Double) {
        self.result -= number
    }
    
    mutating func multiply(_ number: Double) {
        self.result *= number
    }
    
    mutating func divide(_ number: Double) throws {
        guard number != 0 else { throw CalculatorError.divisionByZero }
        self.result /= number
    }
}

var calculator = Calculator()
calculator.add(10)
print(calculator.result)        // 10.0

calculator.subtract(3)
print(calculator.result)        // 7.0

calculator.multiply(2)
print(calculator.result)        // 14.0

do {
    try calculator.divide(7)
    print(calculator.result)    // 2.0
} catch CalculatorError.divisionByZero {
    print("Cannot divide by zero")
}

// MARK: - Error handling 05
enum LibraryError: Error {
    case bookNotFound, limitExceeded
}

class Library {
    var books: [String] = []
    var limit: Int = 3
    
    init(books: [String], limit: Int) {
        self.books = books
        self.limit = limit
    }
    
    func borrow(books: [String]) throws -> String {
        guard self.limit >= books.count else { throw LibraryError.limitExceeded }

        try books.forEach { book in
            guard self.books.contains(book) else { throw LibraryError.bookNotFound }
        }
        return "\(books.joined(separator: ", "))을 대출했습니다."
    }
    
}

let library = Library(books: ["Harry Potter", "The Little Prince", "The Hobbit", "Swift", "SwiftUI"], limit: 2)
do {
    let result = try library.borrow(books: ["Harry Potter", "The Little Prince"])
    print(result)
} catch LibraryError.bookNotFound {
    print("책을 찾을 수 없습니다.")
} catch LibraryError.limitExceeded {
    print("대출 한도를 초과했습니다.")
}
// limit: 1 일 경우 대출 한도를 초과했습니다.
// limit: 2 일 경우 "Harry Potter", "The Little Prince"을 대출했습니다.

// MARK: - Error handling 06
enum ParsingError: Error {
    case invalidJSON
}

func parseJSON(_ jsonString: String) throws -> [String: Any] {
    guard let data = jsonString.data(using: .utf8),
          let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    else { throw ParsingError.invalidJSON }
    
    let resultDictionary: [String: Any] = jsonObject.mapValues { value in
        switch value {
        case let intNum as Int:
            return intNum
        case let str as String:
            return str
        case let strArr as [String]:
            return strArr
        default:
            return value
        }
    }
    return resultDictionary
}

let jsonString = """
                {
                    "name": "John",
                    "age": 25,
                    "hobbies": ["reading", "coding", "gaming"]
                }
                """
do {
    let dictionary = try parseJSON(jsonString)
    print(dictionary)
} catch ParsingError.invalidJSON {
    print("Invalid JSON format")
}
// ["name": "John", "age": 25, "hobbies": ["reading", "coding", "gaming"]]
