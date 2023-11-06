import Foundation

// MARK: - 프로토콜 예제 01
// 다음 프로토콜을 채택하는 Person 구조체를 정의하고, 프로토콜의 메서드를 구현하세요.

protocol Greeting {
    var name: String { get }
    func sayHello()
}

struct Person: Greeting {
    var name: String
    
    func sayHello() {
        print("Hello, \(name)!")
    }
}

//...
let person = Person(name: "park")
person.sayHello()     // Hello, park!

// MARK: - 프로토콜 예제 02
// 다음 프로토콜을 채택하는 Circle 클래스를 정의하고, 프로토콜의 연산 프로퍼티를 구현하세요.
protocol Shape {
    var area: Double { get }
}

class Circle: Shape {
    var r: Double
    
    init(r: Double) {
        self.r = r
    }
    
    var area: Double {
        3.14 * r * r
    }
}

// MARK: - 프로토콜 예제 03
// 다음 프로토콜을 채택하는 Car 구조체를 정의하고, 프로토콜의 타입 메서드를 구현하세요.
protocol Vehicle {
    static func makeNoise()
}

struct Car: Vehicle {
    static func makeNoise() {
        print("빵빵")
    }
}

// MARK: - 프로토콜 예제 04
// 다음 프로토콜을 채택하는 Counter 클래스를 정의하고, 프로토콜의 타입 연산 프로퍼티를 구현하세요.
protocol Countable {
    static var count: Int { get set }
}

class Counter: Countable {
    static var arr: [Int] = []
    
    init(arr: [Int]) {
        Counter.arr = arr
    }
    
    static var count: Int {
        get {
            return arr.count
        }
        set {
            arr = [Int](repeating: 0, count: newValue)
        }
    }
}

let counter = Counter(arr: [1, 2, 3, 4, 5])

// MARK: - 프로토콜 예제 05
// Equatable 프로토콜을 채택한 Student 구조체를 정의하고, 두 Student 인스턴스가 같은지 비교하는 == 연산자를 구현해보세요.

struct Student: Equatable {
    var name: String
    var age: Int
    
    static func ==(lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}

let student1 = Student(name: "이경헌", age: 30)
let student2 = Student(name: "삼경헌", age: 29)

if student1 == student2 {
    print("동일")
} else {
    print("다름")
}

// MARK: - 프로토콜 예제 06
// 다음 코드에서 Person 클래스를 프로토콜로 변환하고, Student 클래스가 이 프로토콜을 준수하도록 수정해보세요.

protocol Person2 {
    var name: String { get }
    var age: Int { get }
    
    func introduce()
}

class Student2: Person2 {
    var school: String
    var name: String
    var age: Int
    
    init(school: String, name: String, age: Int) {
        self.school = school
        self.name = name
        self.age = age
    }
    
    func introduce() {
        print("I am a 백수 named \(name), \(age) years old\nstuded at \(school).")

    }
}

Student2(school: "세종", name: "이경헌", age: 30).introduce()

// MARK: - 프로토콜 예제 07
/*
프로토콜을 채택하고 준수하는 클래스를 정의하고, 해당 클래스의 인스턴스를 생성하고 프로토콜의 메서드를 호출하는 코드를 작성해보세요.

프로토콜의 이름은 Speaker이고, 인사말을 출력하는 메서드 speak(message: String)을 가지고 있습니다.
*/

// 예시 코드:
protocol Speaker {
    var message: String { get }
    
    func speak(message: String)
}

protocol Greeter {
    func greet(name: String)
}

class Person3: Greeter, Speaker {
    var name: String
    var message: String
    
    init() {
        self.name = ""
        self.message = ""
    }
    
    init(name: String, message: String) {
        self.name = name
        self.message = message
    }
    
    func greet(name: String) {
        print("Hello, \(name)!")
    }
    
    func speak(message: String) {
        print("\(message)")
    }
}



let person2 = Person3(name: "삼경헌", message: "오호")
person2.greet(name: "Kim")
person2.speak(message: "이렇게 하는거 맞겠지!?")

// MARK: - 프로토콜 예제 08
// 프로토콜을 상속받는 서브 프로토콜을 정의하고, 해당 프로토콜을 채택하고 준수하는 구조체를 정의하세요.

// 예시 코드:
protocol Animal {
    var name: String { get }
    func makeSound()
}

protocol AnimalInfo: Animal {
    var name: String { get }
    var owner: String { get }
    
    func makeSound()
}

struct Dog: AnimalInfo {
    var name: String
    var owner: String
    
    func makeSound() {
        print("Woof!")
    }
}

//...
let bob = Dog(name: "Bob", owner: "Charlie")
bob.makeSound()     // Woof!

// MARK: - 프로토콜 예제 09
/*
프로토콜에 연산 프로퍼티와 타입 메서드를 선언하고, 해당 프로토콜을 채택하고 준수하는 클래스를 정의하세요.
*/

// 예시 코드:
protocol Calculable {
    var value: Int { get set }
    static func add(_ a: Int, _ b: Int) -> Int
}

class Calculator: Calculable {
    var value: Int
    
    init(a: Int, b: Int) {
        self.value = a + b
    }
    
    
    static func add(_ a: Int, _ b: Int) -> Int {
        a + b
    }
}

print(Calculator(a: 2, b: 3).value)


// MARK: - 프로토콜 예제 10
/*
프로토콜을 확장하여 기본 구현을 제공하고, 해당 프로토콜을 채택하고 준수하는 열거형을 정의하세요.
*/

protocol Colorful {
    var color: String { get }
    func describe()
}

extension Colorful {
    func describe() {
        print("This is \(color).")
    }
}

enum Fruit: Colorful {
    case apple
    case banana
    case cherry
    
    var color: String {
        switch self {
        case .apple:
            "red"
        case .banana:
            "yellow"
        case .cherry:
            "pink"
        }
    }
}

//...
let fruit = Fruit.apple
fruit.describe()        // This is red.
Fruit.banana.describe() // This is yellow.
Fruit.cherry.describe() // This is pink.
