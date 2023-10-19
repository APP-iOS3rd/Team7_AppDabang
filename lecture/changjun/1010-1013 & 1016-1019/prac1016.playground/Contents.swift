import UIKit

// MARK: - 5
class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("??")
    }
}

class Cat: Animal {
    override func makeSound() {
        print("야옹")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("멍멍")
    }
}

let cat: Animal = Cat(name: "나비")
let dog: Animal = Dog(name: "바둑")
print(cat.name)
print(dog.name)
cat.makeSound() // 야옹
dog.makeSound() // 멍멍


// MARK: - 6
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func introduce() {
        print("저는 \(name)이고, \(age)살입니다.", terminator: " ")
    }
}

class Student: Person {
    var grade: Int
    var classNumber: Int
    
    init(name: String, age: Int, grade: Int, classNumber: Int) {
        self.grade = grade
        self.classNumber = classNumber
        super.init(name: name, age: age)
    }
    
    override func introduce() {
        super.introduce()
        print("저는 \(grade)학년 \(classNumber)반입니다.")
    }
}

class Teacher: Person {
    var subject: String
    
    init(name: String, age: Int, subject: String) {
        self.subject = subject
        super.init(name: name, age: age)
    }
    
    override func introduce() {
        super.introduce()
        print("저는 \(subject) 선생님입니다.")
    }
}

let student: Person = Student(name: "민수", age: 15, grade: 2, classNumber: 3)
let teacher: Person = Teacher(name: "영희", age: 25, subject: "수학")

student.introduce() // 저는 민수이고, 15살입니다. 저는 2학년 3반입니다.
teacher.introduce() // 저는 영희이고, 25살입니다. 저는 수학 선생님입니다.

// MARK: - 7
class Figure {
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func area() -> Double? {
        return nil
    }
}

class Triangle: Figure {
    var base: Double
    var height: Double
    
    init(color: String, base: Double, height: Double) {
        self.base = base
        self.height = height
        super.init(color: color)
    }
    
    override func area() -> Double {
        return base * height / 2
    }
}

class Rectangle: Figure {
    var width: Double
    var length: Double
    
    init(color: String, width: Double, length: Double) {
        self.width = width
        self.length = length
        super.init(color: color)
    }
    
    override func area() -> Double {
        return width * length
    }
}

let triangle = Triangle(color: "red", base: 3, height: 4)
let rectangle = Rectangle(color: "blue", width: 5, length: 6)
print(triangle.area()) // 6.0
print(rectangle.area()) // 30.0
