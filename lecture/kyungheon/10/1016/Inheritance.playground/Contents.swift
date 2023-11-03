import Foundation

// MARK: - 상속 예제 05
// 동물 클래스를 정의하고, 고양이와 개 클래스를 동물 클래스로부터 상속받아서 구현하세요. 고양이와 개 클래스는 각각 소리를 내는 메서드를 오버라이딩해야 합니다

class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    public func makeSound() {
        print("동물~~")
    }
}

class Dog: Animal {
    override init(name: String) {
        super.init(name: name)
    }
    
    override func makeSound() {
        print("멍멍")
    }
}

class Cat: Animal {
    override init(name: String) {
        super.init(name: name)
    }
    
    override func makeSound() {
        print("야옹")
    }
}
let cat: Animal = Cat(name: "나비")
let dog: Animal = Dog(name: "바둑")
cat.makeSound() // 야옹
dog.makeSound() // 멍멍

// MARK: - 상속 예제 06
/* 
 사람 클래스를 정의하고, 학생과 선생님 클래스를 사람 클래스로부터 상속받아서 구현하세요.
 
 사람 클래스는 이름과 나이를 속성으로 가지고 있습니다.
 
 학생 클래스는 학년과 반을, 선생님 클래스는 과목을 추가로 속성으로 가지고 있습니다.
 
 학생과 선생님 클래스는 각각 자기소개를 하는 메서드를 오버라이딩해야 합니다
 */

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    public func introduce() {
        print("저는 \(name)이고, \(age)살 입니다.")
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
        print("저는 \(name)이고, \(age)살 입니다. 저는 \(grade)학년 \(classNumber)반 입니다.")
    }
}

class Teacher: Person {
    var subject: String
    
    init(name: String, age: Int, subject: String) {
        self.subject = subject
        super.init(name: name, age: age)
    }
    
    override func introduce() {
        print("저는 \(name)이고, \(age)살 입니다. 저는 \(subject) 선생님 입니다.")
    }
}

// 예시
let student: Person = Student(name: "민수", age: 15, grade: 2, classNumber: 3)
let teacher: Person = Teacher(name: "영희", age: 25, subject: "수학")
student.introduce() // 저는 민수이고, 15살입니다. 저는 2학년 3반입니다.
teacher.introduce() // 저는 영희이고, 25살입니다. 저는 수학 선생님입니다.

// MARK: - 상속 예제 07
/*
 도형 클래스를 정의하고, 삼각형과 사각형 클래스를 도형 클래스로부터 상속받아서 구현하세요.

 도형 클래스는 색깔을 속성으로 가지고 있습니다. 삼각형 클래스는 밑변과 높이를, 사각형 클래스는 가로와 세로를 추가로 속성으로 가지고 있습니다.

 삼각형과 사각형 클래스는 각각 넓이를 구하는 메서드를 오버라이딩해야 합니다.
 */

class shape {
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    public func area() {
    
    }
}

class Triangle: shape {
    var base: Int
    var heguth: Int
    
    init(color: String, base: Int, heguth: Int) {
        self.base = base
        self.heguth = heguth
        super.init(color: color)
    }
    
    override func area() {
        print(Double(base) * Double(heguth) / 2.0)
    }
}

class Rectangle: shape {
    var width: Int
    var length: Int
    
    init(color: String, width: Int, length: Int) {
        self.width = width
        self.length = length
        super.init(color: color)
    }
    
    override func area() {
        print(Double(width) * Double(length))
    }
}

// 예시
let triangle = Triangle(color: "red", base: 3, heguth: 4)
let rectangle = Rectangle(color: "blue", width: 5, length: 6)
print(triangle.area()) // 6.0
print(rectangle.area()) // 30.0
