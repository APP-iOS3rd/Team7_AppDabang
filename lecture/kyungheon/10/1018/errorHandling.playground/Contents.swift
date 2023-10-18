import Foundation

/*:
 # 에러 핸들링 (Error Handling) 소개 p.133

 발생할 수 있는 모든 에러에 대해 처리
 - 원하는 결과가 나오지 않을 경우에 에러를 발생(스로잉 throwing)
 - 메서드가 던진(throwing) 에러를 잡아서 처리
 do-catch
 ```
 do {
    try [throw를 발생하는 함수()]
 } catch [에러패턴1] {
 } catch [에러패턴2] {
 } catch [에러패턴3] where [조건] {
 } catch [에러패턴4, 에러패턴5] {
 } catch {
 }
 ```

 defer 구문 .p138
 - 현재 코드블록이 종료되지 직전에(맨 마지막) 수행되는 작업을 지정(예. 정리작업)
 */

// 에러 타입 선언하기 p.134
enum FileTransferError : Error {
    case noConnnection
    case lowBandWidth
    case fileNotFound
}

// 에러 던지기(발생) p.135
let connectionOK = true
let connectionSpeed = 30.00
let fileFound = false

func fileTransfer() throws -> Int {

    guard connectionOK else {
        throw FileTransferError.noConnnection
    }

    guard connectionSpeed > 30 else {
        throw FileTransferError.lowBandWidth
    }

    guard fileFound else {
        throw FileTransferError.fileNotFound
    }

    //....
    return 0
}

// 스로잉 메서드와 함수 호출 p.136
func sendFile() -> String {

    do {
        try fileTransfer()
    } catch FileTransferError.noConnnection, FileTransferError.lowBandWidth {
        // ....
    } catch FileTransferError.fileNotFound {
        // ..
    } catch let error {     // 에러 객체에 접근 p.137
        //..
        print(error.localizedDescription)
    } catch {
        // default
    }

    return "Successful transfer"
}

// MARK: - 에러 핸들링 예제 01
/*
온도 변환 함수

섭씨 온도를 화씨 온도로 변환하는 함수를 작성하세요.

단, 섭씨 온도가 -273.15도보다 낮으면 InvalidTemperature 에러를 발생시키세요.
*/

enum TemperatureError: Error {
    case invalidTemperature
}

func celsiusToFahrenheit(_ temperature: Double) throws -> Double {
    guard temperature >= -273.15 else {
        throw TemperatureError.invalidTemperature
    }
    
    return temperature * (9/5) + 32
}

do {
    let fahrenheit = try celsiusToFahrenheit(-300)
    print(fahrenheit)
} catch TemperatureError.invalidTemperature {
    print("Invalid temperature")
}
// Invalid temperature

// MARK: - 에러 핸들링 예제 02
/*
 비밀번호 검증 함수

 사용자가 입력한 비밀번호가 다음 조건을 만족하는지 검증하는 함수를 작성하세요.

 최소 8자 이상
 최소 하나의 대문자, 소문자, 숫자, 특수문자 포함
 조건을 만족하지 않으면 PasswordError 에러를 발생시키세요.
 */

enum PasswordError: Error {
    case tooShort
    case missingUppercase
    case missingLowercase
    case missingNumber
    case missingSymbol
}

let symbols = "!@#$%^&*()_+-=[]{}|;:,./<>?"

func validatePassword(_ password: String) throws -> Int {
    guard password.count >= 8 else {
        throw PasswordError.tooShort
    }
    
    guard InUpper(password) else {
        throw PasswordError.missingUppercase
    }
    
    guard InLower(password) else {
        throw PasswordError.missingLowercase
    }
    
    guard IsNumber(password) else {
        throw PasswordError.missingNumber
    }
    
    guard IsSpecial(password) else {
        throw PasswordError.missingSymbol
    }

    return 0
    
    func InUpper(_ str: String) -> Bool {
        str.contains { $0.isUppercase }
    }
    
    func InLower(_ str: String) -> Bool {
        str.contains { $0.isLowercase }
    }
    
    func IsNumber(_ str: String) -> Bool {
        str.contains { $0.isNumber }
    }
    
    func IsSpecial(_ str: String) -> Bool {
        for ch in str {
            if symbols.contains(ch) {
                return true
            }
        }
        return false
    }
}

// 예시:
do {
    try validatePassword("Abc123DE")
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
// Password is too short
// Password is missing an uppercase letter
// Password is missing a symbol

// MARK: - 에러 핸들링 예제 03
/*
ATM 기계 클래스

ATM 기계를 나타내는 클래스를 작성하세요.

다음 속성과 메서드를 구현하세요.

balance: 잔액을 나타내는 Double 타입의 속성. 초기값은 0이다.

deposit(amount: Double): 입금하는 메서드.

amount가 0보다 크면 잔액에 더하고 true를 반환한다.
그렇지 않으면 false를 반환한다.
withdraw(amount: Double) throws -> Double: 출금하는 메서드.

amount가 0보다 크고 잔액보다 작거나 같으면 잔액에서 빼고 amount를 반환한다.
amount가 0보다 작으면 NegativeAmount 에러를 발생시킨다.
amount가 잔액보다 크면 InsufficientBalance 에러를 발생시킨다.
*/

enum ATMError: Error {
    case negativeAmount
    case insufficientBalance
}

class ATM {
    var balance: Double = 0.0
    
    public func deposit(amount: Double) -> Bool {
        balance += amount
        return amount > 0
    }
    
    public func withdraw(amount: Double) throws -> Double {
        var ret: Double = 0.0
        guard amount > 0 else {
            throw ATMError.negativeAmount
        }
        
        guard balance >= amount else {
            throw ATMError.insufficientBalance
        }
        
        ret = balance - amount
        self.balance -= amount
        return ret
    }
}

// 예시:
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

// MARK: - 에러 핸들링 예제 04
/*
계산기 구조체

사칙연산을 수행하는 계산기를 나타내는 구조체를 작성하세요.

다음 속성과 메서드를 구현하세요.

result: 계산 결과를 나타내는 Double 타입의 속성. 초기값은 0이다.
add(_ number: Double): result에 number를 더하는 메서드.
subtract(_ number: Double): result에 number를 빼는 메서드.
multiply(_ number: Double): result에 number를 곱하는 메서드.
divide(_ number: Double) throws: result에 number를 나누는 메서드.
단, number가 0이면 DivisionByZero 에러를 발생시킨다.
*/

enum CalculatorError: Error {
    case divisionByZero
}

struct Calculator {
  var result: Double = 0
  
    init() {
        result = 0.0
    }
    
    mutating func add(_ number: Double) {
        result += number
    }
    
    mutating func subtract(_ number: Double) {
        result -= number
    }
    
    mutating func multiply(_ number: Double) {
        result *= number
    }
    
    mutating func divide(_ number: Double) throws {
        guard number > 0 else {
            throw CalculatorError.divisionByZero
        }
        
        result /= number
    }
}

// 예시:
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

// MARK: - 에러 핸들링 예제 05
/*
도서관 클래스

도서관을 나타내는 클래스를 작성하세요.

다음 속성과 메서드를 구현하세요.

books: 책들을 나타내는 [String] 타입의 속성. 초기값은 빈 배열이다.

limit: 대출 가능한 책의 수를 나타내는 Int 타입의 속성. 초기값은 3이다.

borrow(book: String) throws -> String: 책을 대출하는 메서드.

book이 books에 있고 limit보다 적게 대출했다면 book을 books에서 제거하고 "(book)을 대출했습니다."라는 문자열을 반환한다.
book이 books에 없다면 BookNotFound 에러를 발생시키고, limit 이상으로 대출했다면 LimitExceeded 에러를 발생시킨다.
*/

enum LibraryError: Error {
    case bookNotFound
    case limitExceeded
}

class Library {
    var books: [String]
    var limit: Int
    
    init() {
        books = []
        limit = 3
    }
    
    init(books: [String], limit: Int) {
        self.books = books
        self.limit = limit
    }
    
    func borrow(bookArr: [String]) throws -> String {
        var ret = ""
        var tmp:[String] = []
        
        guard bookArr.count <= limit else {
            throw LibraryError.limitExceeded
        }
        
        for book in bookArr {
            guard books.contains(book) else {
                throw LibraryError.bookNotFound
            }
            
            if let idx = books.firstIndex(of: book) {
                tmp.append(book)
                books.remove(at: idx)
            }
        }
        
        ret = tmp.joined(separator: ", ")
        return ret + "을 대출했습니다."
    }
}

// 예시:
let library = Library(books: ["Harry Potter", "The Little Prince", "The Hobbit"], limit: 1)
do {
    let result = try library.borrow(bookArr: ["Harry Potter", "The Little Prince"])
    print(result)
} catch LibraryError.bookNotFound {
    print("책을 찾을 수 없습니다.")
} catch LibraryError.limitExceeded {
    print("대출 한도를 초과했습니다.")
}
// limit: 1 일 경우 대출 한도를 초과했습니다.
// limit: 2 일 경우 The Harry Potter, Little Prince을 대출했습니다.


// MARK: - 에러 핸들링 예제 06
/*
JSON 파싱 함수

JSON 형식의 문자열을 파싱하여 딕셔너리로 반환하는 함수를 작성하세요.

단, JSON 형식이 올바르지 않으면 ParsingError 에러를 발생시키세요.
*/

// 참고: https://skytitan.tistory.com/433

enum ParsingError: Error {
    case invalidJSON
}

let jsonString = """
{
    "name": "John",
    "age": 25,
    "hobbies": ["reading", "coding", "gaming"]
}
"""
//print(jsonString)

func parseJSON(_ str: String) throws -> [String: Any] {
    do {
        return try JSONSerialization.jsonObject(with: Data(str.utf8), options: []) as? [String: Any] ?? [:]
    } catch {
        throw ParsingError.invalidJSON
    }
}

do {
    let dictionary = try parseJSON(jsonString)
    print(dictionary)
} catch ParsingError.invalidJSON {
    print("Invalid JSON format")
}
// ["name": "John", "age": 25, "hobbies": ["reading", "coding", "gaming"]]
/* ["age": 25, "name": John, "hobbies": <__NSArrayI 0x600000c0ac10>(
reading,
coding,
gaming
)
]
??????
*/
