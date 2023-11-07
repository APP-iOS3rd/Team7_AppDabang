/*
다음 프로토콜을 채택하는 Person 구조체를 정의하고, 프로토콜의 메서드를 구현하세요.
// 예시 코드:

protocol Greeting {
    var name: String { get }
    func sayHello()
}

//...
let person = Person(name: "park")
person.sayHello()     // Hello, park!
*/
protocol Greeting {
    var name: String { get }
    func sayHello()
}

struct Person : Greeting {
    var name: String

    func sayHello() {
        print("Hello, \(name)!")
    }
}

//...
let person = Person(name: "park")
person.sayHello()     // Hello, park!

/*
다음 프로토콜을 채택하는 Circle 클래스를 정의하고, 프로토콜의 연산 프로퍼티를 구현하세요.
// 예시 코드:
protocol Shape {
    var area: Double { get }
}

//...
let circle = Circle(radius: 3.0)
circle.area    // 28.27433388230814
*/
protocol Shape {
    var area: Double { get }
}

class Circle : Shape {
    var radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    var area: Double {
        get {
            return .pi * radius * radius
        }
    }
}

//...
let circle = Circle(radius: 3.0)
circle.area    // 28.27433388230814

/*
다음 프로토콜을 채택하는 Car 구조체를 정의하고, 프로토콜의 타입 메서드를 구현하세요.
protocol Vehicle {
    static func makeNoise()
}
*/
protocol Vehicle {
    static func makeNoise()
}

struct Car : Vehicle {
    static func makeNoise() {
        print("붕붕")
    }
}

//...
Car.makeNoise()

/*
다음 프로토콜을 채택하는 Counter 클래스를 정의하고, 프로토콜의 타입 연산 프로퍼티를 구현하세요.
protocol Countable {
    static var count: Int { get set }
}
*/
protocol Countable {
    static var count: Int { get set }
}

class Counter : Countable {
    static var count: Int  = 0
}


//...
Counter.count

/*
Equatable 프로토콜을 채택한 Student 구조체를 정의하고, 두 Student 인스턴스가 같은지 비교하는 == 연산자를 구현해보세요.
//예시 코드:

struct Student: Equatable {
    var name: String
    var age: Int
}

let alice = Student(name: "Alice", age: 20)
let bob = Student(name: "Bob", age: 21)

print(alice == bob) // false
*/
// Equatable 프로토콜을 채택한 Student 구조체를 정의하고, 두 Student 인스턴스가 (나이가) 같은지 비교하는 == 연산자를 구현해보세요.

struct Student: Equatable {
    var name: String
    var age: Int

    static func == (lhs: Self, rhs: Self) -> Bool {
//        return lhs.name == rhs.name  && lhs.age == rhs.age
        return lhs.age == rhs.age
    }
}

let alice = Student(name: "Alice", age: 20)
let alice2 = Student(name: "Alice", age: 20)
let bob = Student(name: "Bob", age: 20)

print(alice == bob) // true

/*
다음 코드에서 Person 클래스를 프로토콜로 변환하고, Student 클래스가 이 프로토콜을 준수하도록 수정해보세요.
// 예시 코드:

class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func introduce() {
        print("My name is \(name) and I'm \(age) years old.")
    }
}

class Student: Person {
    var school: String

    init(name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
    }

    override func introduce() {
        super.introduce()
        print("I go to \(school).")
    }
}
*/
protocol Person {
    var name: String { get set }
    var age: Int { get set }

    func introduce()
}

class Student: Person {
    var name: String
    var age: Int
    var school: String

    init(name: String, age: Int, school: String) {
        self.name = name
        self.age = age
        self.school = school
    }

    func introduce() {
        print("My name is \(name) and I'm \(age) years old.")
        print("I go to \(school).")
    }
}

let myStucent = Student(name: "Park", age: 20, school: "ll")
myStucent.introduce()

/*
프로토콜을 채택하고 준수하는 클래스를 정의하고, 해당 클래스의 인스턴스를 생성하고 프로토콜의 메서드를 호출하는 코드를 작성해보세요.

프로토콜의 이름은 Speaker이고, 인사말을 출력하는 메서드 speak(message: String)을 가지고 있습니다.
// 예시 코드:
protocol Greeter {
    func greet(name: String)
}

class Person: Greeter {
    func greet(name: String) {
        print("Hello, \(name)!")
    }
}

let person = Person()
person.greet(name: "Kim")

*/
protocol Greeter {
    func speak(message: String)
}

protocol Speaker {
    func speak(message: String)
}

class Animal: Speaker, Greeter {
    func speak(message: String) {
        print("I can't speak \(message)!")
    }
}

let person = Animal()
person.speak(message: "Hello")  // I can't speak Hello!

/*
프로토콜을 상속받는 서브 프로토콜을 정의하고, 해당 프로토콜을 채택하고 준수하는 구조체를 정의하세요.
// 예시 코드:
protocol Animal {
    var name: String { get }
    func makeSound()
}

//...
let bob = Dog(name: "Bob", owner: "Charlie")
bob.makeSound()     // Woof!
*/
protocol Animal {
    var name: String { get }
    func makeSound()
}

protocol Pet: Animal {
    var owner: String { get }
}

struct Dog: Pet {
    var name: String
    var owner: String

    func makeSound() {
        print("Woof!")
    }

}

//...
let bob = Dog(name: "Bob", owner: "Charlie")
bob.makeSound()     // Woof!

/*
프로토콜에 연산 프로퍼티와 타입 메서드를 선언하고, 해당 프로토콜을 채택하고 준수하는 클래스를 정의하세요.
// 예시 코드:
protocol Calculable {
    var value: Int { get set }
    static func add(_ a: Int, _ b: Int) -> Int
}

// class Calculator
*/
protocol Calculable {
    var value: Int { get set }
    static func add(_ a: Int, _ b: Int) -> Int
}

class Calculator : Calculable {
    var value: Int

    init() {
        self.value = 0
    }

    static func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }

    static func add(_ a: Calculator, _ b: Int) -> Int {
        return a.value + b
    }

}

let calc = Calculator()
calc.value = Calculator.add(3, 5)
Calculator.add(calc, 8)

/*
프로토콜을 확장하여 기본 구현을 제공하고, 해당 프로토콜을 채택하고 준수하는 열거형을 정의하세요.
// 예시 코드:
protocol Colorful {
    var color: String { get }
    func describe()
}

extension Colorful {
    func describe() {
        print("This is \(color).")
    }
}

//...
let fruit = Fruit.apple
fruit.describe()        // This is red.
Fruit.banana.describe() // This is yellow.
Fruit.cherry.describe() // This is pink.
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

enum Fruit : Colorful {
    case apple, banana, cherry

    var color: String {
        switch self {
        case .apple:
            return "red"
        case .banana:
            return "yello"
        case .cherry:
            return "pink"
        }
    }
}

//...
let fruit = Fruit.apple
fruit.describe()        // This is red.
Fruit.banana.describe() // This is yellow.
Fruit.cherry.describe() // This is pink.

/*
Protocol 을 채택한 클래스, 구조체, 열거형에 공통된 기능을 추가하고 싶을 때, 어떤 방법을 사용해야 할까요?

다음 예시 코드 결과가 출력되도록 코드를 추가해 보세요.
// 예시 코드:
protocol Animal {
    var name: String { get }
    func makeSound()
}

class Dog: Animal {
    var name: String

    init(name: String) {
        self.name = name
    }

    func makeSound() {
        print("Woof!")
    }
}

struct Cat: Animal {
    var name: String

    func makeSound() {
        print("Meow!")
    }
}

enum Bird: Animal {
    case parrot(String)
    case sparrow(String)

    var name: String {
        switch self {
        case .parrot(let name):
            return name
        case .sparrow(let name):
            return name
        }
    }

    func makeSound() {
        switch self {
        case .parrot:
            print("Hello!")
        case .sparrow:
            print("Chirp!")
        }
    }
}

// 추가 코드
//...

let dog = Dog(name: "Max")
let cat = Cat(name: "Lily")
let bird = Bird.parrot("Jack")

dog.introduce()     // My name is Max.
cat.introduce()     // My name is Lily.
bird.introduce()    // My name is Jack.

*/
extension Animal {
    func introduce() {
        print("My name is \(name).")
    }
}

/*
다음 프로토콜을 채택하는 구조체를 정의하고, 프로토콜의 익스텐션으로 메서드를 추가하세요.
// 예시 코드:
protocol Flyable {
    var speed: Double { get set }
}

//...

let bard = Bird(speed: 30)
bard.fly()
*/
// 완성 코드:
protocol Flyable {
    var speed: Double { get set }
}

//...
struct Bird : Flyable {
    var speed: Double
}

extension Flyable {
    func fly() {
        print("Flying at \(speed) km/h")
    }
}


let bard = Bird(speed: 30)
bard.fly()

/*
다음 프로토콜을 채택하는 구조체를 정의하고, 프로토콜의 익스텐션으로 연산 프로퍼티를 추가하세요.
// 예시 코드:
protocol Colorful {
    var color: String { get set }
}

//...
let flower = Flower(color: "Yellow")
print( flower.description )     // A Yellow thing
*/
// 완성 코드:
protocol Colorful {
    var color: String { get set }
}

//...
struct Flower : Colorful {
    var color: String
}

extension Colorful {
    var description: String {
        get {
            return "A \(color) thing"
        }
    }
}

let flower = Flower(color: "Yellow")
print( flower.description )     // A Yellow thing

/*
다음 프로토콜을 채택하는 클래스를 정의하고, 프로토콜의 익스텐션으로 서브스크립트를 추가하세요.
// 예시 코드:
protocol Stackable {
    var items: [Int] { get set }
}

//...

let stack = Stack(items: [5,4,7,3,1])
print( stack[0] )   // 5
*/
// 완성 코드:
protocol Stackable {
    var items: [Int] { get set }
}

//...
class Stack : Stackable {
    var items: [Int]

    init(items: [Int]) {
        self.items = items
    }
}

extension Stackable {
    subscript(index: Int) -> Int? {
        guard index < items.count else {
            return nil
        }
        return items[index]
    }
}

let stack = Stack(items: [5,4,7,3,1])
print( stack[7] ?? 0)   // 5