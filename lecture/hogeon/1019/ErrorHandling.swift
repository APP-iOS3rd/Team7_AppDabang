/*
온도 변환 함수

섭씨 온도를 화씨 온도로 변환하는 함수를 작성하세요.

단, 섭씨 온도가 -273.15도보다 낮으면 InvalidTemperature 에러를 발생시키세요.
*/
enum TemperatureError: Error {
    case invalidTemperature
}

func celsiusToFahrenheit(_ celsius: Double) throws -> Double {
    if celsius < -273.15 {
        throw TemperatureError.invalidTemperature
    }
    return celsius * 1.8 + 32
}

/*
비밀번호 검증 함수

사용자가 입력한 비밀번호가 다음 조건을 만족하는지 검증하는 함수를 작성하세요.

최소 8자 이상
최소 하나의 대문자, 소문자, 숫자, 특수문자 포함
조건을 만족하지 않으면 PasswordError 에러를 발생시키세요.
*/
enum PasswordError: Error {
    case tooShort, missingUppercase, missingLowercase, missingNumber, missingSymbol
}

func validatePassword(_ password: String) throws -> String {
    let symbols = "!@#$%^&*()_+-=[]{}|;:,./<>?"
    var isMissingUppercase = false
    var isMissingLowercase = false
    var isNumber = false
    var isSymbol = false

    for c in password {
        if c.isUppercase {
            isMissingUppercase = true
        } else if c.isLowercase {
            isMissingLowercase = true
        } else if c.isNumber {
            isNumber = true
        } else if symbols.contains( c ) {
            isSymbol = true
        }
    }

    //에러
    guard password.count >= 8 else {
        throw PasswordError.tooShort
    }
    guard isMissingUppercase else {
        throw PasswordError.missingUppercase
    }
    guard isMissingLowercase else {
        throw PasswordError.missingLowercase
    }
    guard isNumber else {
        throw PasswordError.missingNumber
    }
    guard isSymbol else {
        throw PasswordError.missingSymbol
    }
    return password
}

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
enum ATMError : Error {
    case negativeAmount, insufficientBalance
}

class ATM {
    var balance = 0.0

    func deposit(amount: Double) -> Bool {
        if amount > 0 {
            balance += amount
            return true
        }
        return false
    }

    func withdraw(amount: Double) throws -> Double {
        if amount < 0 {
            throw ATMError.negativeAmount
        }
        if amount > balance {
            throw ATMError.insufficientBalance
        }
        balance -= amount
        return amount
    }
}

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
    case DivisionByZero
}

struct Calculator {
    var result:Double = 0
    
   mutating func add(_ number: Double)   {
        
        result += number
    }
    
    mutating func subtract(_ number: Double)   {
         
         result -= number
     }
     
    mutating func multiply(_ number: Double)   {
         
         result *= number
     }
     
    mutating func divide(_ number: Double) throws  {
         
        if number != 0 {
            result /= number
        } else if number == 0 {
            throw CalculatorError.DivisionByZero
        }
     }
     
}
do {
    try cal.divide(0)
    print(cal.result)
} catch CalculatorError.DivisionByZero {
    print("Cannot divide by zero")
}

/*
도서관 클래스

도서관을 나타내는 클래스를 작성하세요.

다음 속성과 메서드를 구현하세요.

books: 책들을 나타내는 [String] 타입의 속성. 초기값은 빈 배열이다.

limit: 대출 가능한 책의 수를 나타내는 Int 타입의 속성. 초기값은 3이다.

borrow(books: [String]) throws -> String: 책을 대출하는 메서드.

매개변수 books 항목이 books 속성에 있고 limit보다 적게 대출했다면 books 항목을 books 속성에서 제거하고 "(books)을 대출했습니다."라는 문자열을 반환한다.
매개변수 books 항목이 books 속성에 없다면 BookNotFound 에러를 발생시키고, limit 이상으로 대출했다면 LimitExceeded 에러를 발생시킨다.
*/
enum LibraryError: Error {
    case bookNotFound
    case limitExceeded
}

class Library {
    private var books: [String]
    private var limit: Int

    init(books: [String], limit: Int = 3) {
        self.books = books
        self.limit = limit
    }

    func borrow(books: [String]) throws -> String {
        if books.count > limit {
            throw LibraryError.limitExceeded
        }
        if !self.books.contains(books) {
            throw LibraryError.bookNotFound
        }

        for book in books {
            self.books.remove(at: books.firstIndex(of: book)! )
        }

        return "\(books.joined(separator: ", "))을 대출했습니다."
    }
}

/*
JSON 파싱 함수

JSON 형식의 문자열을 파싱하여 딕셔너리로 반환하는 함수를 작성하세요.

단, JSON 형식이 올바르지 않으면 ParsingError 에러를 발생시키세요.
*/
enum ParsingError: Error {
    case invalidJSON
}

func parseJSON(_ json: String) throws -> [String: Any] {
    guard let data = json.data(using: .utf8) else {
        throw ParsingError.invalidJSON
    }
    guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
      throw ParsingError.invalidJSON
    }
    return dictionary
}


// 예시:
let jsonString = """
{
    "name": "John",
    "age": 25,
    "hobbies": ["reading", "coding", "gaming"]
}
"""
do {
    var dictionary = try parseJSON(jsonString)
    dictionary["hobbies"] = dictionary["hobbies"] as? [String]
    print(dictionary)
    print()
    print(dictionary["name"])
    print(dictionary["age"])
    print(dictionary["hobbies"] as? [String])
} catch ParsingError.invalidJSON {
    print("Invalid JSON format")
}
// ["name": "John", "age": 25, "hobbies": ["reading", "coding", "gaming"]]