import Foundation

// MARK: - 프로토콜 예제 01

protocol Greeting {
    var name: String { get }
    func sayHello()
}

struct Person01: Greeting {
    var name: String
    func sayHello() {
        print("Hello, \(name)")
    }
}

let person01 = Person01(name: "park")
person01.sayHello()     // Hello, park!


// MARK: - 프로토콜 예제 02

protocol Shape {
    var area: Double { get }
}

class Circle: Shape {
    var radius: Double
    var area: Double { radius * radius * .pi }
    
    init(radius: Double) {
        self.radius = radius
    }
}

print(Circle(radius: 3).area) // 28.274333882308138


// MARK: - 프로토콜 예제 03

protocol Vehicle {
    static func makeNoise()
}

struct Car: Vehicle {
    static func makeNoise() {
        print("Tais Toi!")
    }
}

Car.makeNoise() // Tais Toi!


// MARK: - 프로토콜 예제 04

protocol Countable {
    static var count: Int { get set }
}

class Counter: Countable {
    private static var _count: Int = 0
    static var count: Int {
        get {
            return _count
        }
        set {
            _count += newValue
        }
    }
}

Counter.count = 2
print(Counter.count) // 2
Counter.count = 3
print(Counter.count) // 5


// MARK: - 프로토콜 예제 05

struct Student05: Equatable {
    var name: String
    var age: Int

    static func == (lhs: Self, rhs: Self) -> Bool {
//        return lhs.name == rhs.name  && lhs.age == rhs.age
        return lhs.age == rhs.age
    }
}

let alice = Student05(name: "Alice", age: 20)
let alice2 = Student05(name: "Alice", age: 20)
let bob = Student05(name: "Bob", age: 20)

print(alice == bob) // true


// MARK: - 프로토콜 예제 06

protocol Person06 {
    var name: String { get set }
    var age: Int { get set }

    func introduce()
}

class Student: Person06 {
    var name: String
    var age: Int
    var school: String

    init(name: String, age: Int, school: String) {
        self.name = name
        self.age = age
        self.school = school
    }
    
    func introduce() {
        print("""
              My name is \(name) and I'm \(age) years old.
              I go to \(school).
              """)
    }
}

Student(name: "Phang", age: 30, school: "likelion").introduce()


// MARK: - 프로토콜 예제 07

protocol Speaker {
    func speak(message: String)
}

class Person: Speaker {
    func speak(message: String) {
        print("\(message)!")
    }
}

let person = Person()
person.speak(message: "Bonjour")


// MARK: - 프로토콜 예제 08

protocol Animal08 {
    var name: String { get }
    func makeSound()
}

protocol Pet: Animal08 {
    var owner: String { get set }
}

struct Dog08: Pet {
    var name: String
    var owner: String

    func makeSound() {
        print("Woof!")
    }
}

let bori = Dog08(name: "Bob", owner: "Charlie")
bori.makeSound()     // Woof!


// MARK: - 프로토콜 예제 09

protocol Calculable {
    var value: Int { get set }
    static func add(_ a: Int, _ b: Int) -> Int
}

class Caculator: Calculable {
    private var _value: Int = 0
    var value: Int {
        get {
            _value
        }
        set {
            _value = newValue
        }
    }
    
    static func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    static func add(_ a: Caculator, _ b: Int) -> Int {
        return a.value + b
    }
}


// MARK: - 프로토콜 예제 10

protocol Colorful10 {
    var color: String { get }
    func describe()
}

extension Colorful10 {
    func describe() {
        print("This is \(color).")
    }
}

enum Fruit: Colorful10 {
    case apple, banana, cherry
    
    var color: String {
        switch self {
        case .apple:
            return "red"
        case .banana:
            return "yellow"
        case .cherry:
            return "pink"
        }
    }
}

let fruit = Fruit.apple
fruit.describe()        // This is red.
Fruit.banana.describe() // This is yellow.
Fruit.cherry.describe() // This is pink.


// MARK: - 프로토콜 예제 11

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

extension Animal {
    func introduce() {
        print("My name is \(name)")
    }
}

let dog = Dog(name: "Max")
let cat = Cat(name: "Lily")
let bird = Bird.parrot("Jack")

dog.introduce()     // My name is Max.
cat.introduce()     // My name is Lily.
bird.introduce()    // My name is Jack.


// MARK: - 프로토콜 예제 12

protocol Flyable {
    var speed: Double { get set }
}

extension Flyable {
    func fly() {
        print("speed: \(speed)")
    }
}

struct Bird12: Flyable {
    var speed: Double
}

let bard = Bird12(speed: 30)
bard.fly() // speed: 30.0


// MARK: - 프로토콜 예제 13

protocol Colorful {
    var color: String { get set }
}

extension Colorful {
    var description: String { "A \(color) thing" }
}

struct Flower: Colorful {
    var color: String
}

let flower = Flower(color: "Yellow")
print( flower.description )     // A Yellow thing


// MARK: - 프로토콜 예제 14

protocol Stackable {
    var items: [Int] { get set }
}

class Stack: Stackable {
    var items: [Int]
    
    init(items: [Int]) {
        self.items = items
    }
    
    subscript(index: Int) -> Int {
        return items[index]
    }
}

let stack = Stack(items: [5,4,7,3,1])
print( stack[0] )   // 5
