// 다음 코드에서 A 클래스는 B 클래스의 부모 클래스이다. (O/X)
class A {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class B: A {
    var age: Int
    init(name: String, age: Int) {
        self.age = age
        super.init(name: name)
    }
} // O

// 다음 코드에서 C 클래스는 D 클래스의 자식 클래스이다. (O/X)
class C {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class D {
    var c: C
    init(c: C) {
        self.c = c
    }
} // X

// 다음 코드에서 E 클래스는 F 클래스와 G 클래스를 동시에 상속받을 수 있다. (O/X)
class E {

}

class F {

}

class G {

} // X -> 스위프트에서는 클래스 다중상속을 지원하지 X

// 다음 코드에서 H 클래스의 인스턴스를 생성할 때, I 클래스의 생성자가 먼저 호출된다. (O/X)
class I {
    var number: Int
    init() {
        print("class I init")
        self.number = 0
    }
}

class H: I {
    var name: String
    override init() {
        print("class H init")
        self.name = "H"
        super.init()
    }
}

let h = H()
// X

/* 동물 클래스를 정의하고, 고양이와 개 클래스를 동물 클래스로부터 상속받아서 구현하세요.
고양이와 개 클래스는 각각 소리를 내는 메서드를 오버라이딩해야 합니다.
*/
class Animal {
    var name: String

    init(name: String) {
        self.name = name
    }

    func makeSound() {
        print("...")
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


let ani: Animal = Animal(name: "??")
let cat: Animal = Cat(name: "나비")
let dog: Animal = Dog(name: "바둑")
ani.makeSound()
cat.makeSound() // 야옹
dog.makeSound() // 멍멍

/* 
사람 클래스를 정의하고, 학생과 선생님 클래스를 사람 클래스로부터 상속받아서 구현하세요.

사람 클래스는 이름과 나이를 속성으로 가지고 있습니다.

학생 클래스는 학년과 반을, 선생님 클래스는 과목을 추가로 속성으로 가지고 있습니다.

학생과 선생님 클래스는 각각 자기소개를 하는 메서드를 오버라이딩해야 합니다.
*/

class Person {
    var name = ""
    var age = -1

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func introduce() {
        print("저는 \(name)이고, \(age)살입니다.")
    }
}

class Student : Person {
    var grade = -1
    var classNumber = -1

    init(name: String, age: Int, grade: Int, classNumber: Int) {
        self.grade = grade
        self.classNumber = classNumber
        super.init(name: name, age: age)
    }

    override func introduce() {
        print("저는 \(name)이고, \(age)살입니다. 저는 \(grade)학년 \(classNumber)반입니다.")
    }
}

class Teacher : Person {
    var subject = ""

    init(name: String, age: Int, subject: String) {
        self.subject = subject
        super.init(name: name, age: age)
    }

    override func introduce() {
        print("저는 \(name)이고, \(age)살입니다. 저는 \(subject) 선생님입니다.")
    }
}

/*
도형 클래스를 정의하고, 삼각형과 사각형 클래스를 도형 클래스로부터 상속받아서 구현하세요.

도형 클래스는 색깔을 속성으로 가지고 있습니다.

삼각형 클래스는 밑변과 높이를, 사각형 클래스는 가로와 세로를 추가로 속성으로 가지고 있습니다.

삼각형과 사각형 클래스는 각각 넓이를 구하는 메서드를 오버라이딩해야 합니다.
*/
class Shape {
    var color = ""

    init(color: String) {
        self.color = color
    }

    func area() -> Double {
        return 0.0
    }
}

class Triangle : Shape {
    var base = 0.0
    var height = 0.0

    init(color: String, base: Double, height: Double) {
        self.base = base
        self.height = height
        super.init(color: color)
    }

    override func area() -> Double {
        return base * height / 2
    }
}

class Rectangle : Shape {
    var width = 0.0
    var length = 0.0

    init(color: String, width: Double, length: Double) {
        self.width = width
        self.length = length
        super.init(color: color)
    }

    override func area() -> Double {
        return width * length
    }
}

// 다음 코드에서 J 클래스의 인스턴스를 삭제할 때, K 클래스의 소멸자가 나중에 호출된다. (O/X)
class K {
    deinit {
        print("K is deinitialized")
    }
}

class J: K {
    deinit {
        print("J is deinitialized")
    }
}

var j: J? = J()
j = nil
// J, K -> O *
// K, J -> X

// 다음 코드에서 L 클래스는 M 클래스의 메서드를 오버라이드할 수 있다. (O/X)
class M {
    func sayHello() {
        print("Hello, I'm M")
    }
}

class L: M {
    override func sayHello() {
        print("Hello, I'm L")
    }
}

var l = L()
l.sayHello()

// 다음 코드에서 N 클래스는 O 클래스의 프로퍼티를 오버라이드할 수 있다. (O/X)
class O {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class N: O {
    override var name: String {
        get {
            return "N"
        }
        set {
            super.name = newValue
        }
    }
}

var n = N(name: "A")
n.name // O

// 다음 코드에서 P 클래스는 Q 클래스의 메서드를 오버로딩할 수 있다. (O/X)
class Q {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }

    func add(a: Double, b: Double) -> Double {
        return a + b
    }
}

class P: Q {
    override func add(a: Int, b: Int) -> Int {
        return a + b + 1
    }
} // X -> 오버로딩은 같은 클래스 내에서 메서드 이름이 같고 매개변수가 다른 경우에 적용된다.

// 다음 코드에서 R 클래스는 S 클래스와 T 클래스를 모두 타입 캐스팅할 수 있다. (O/X)
class R {

}

class S {

}

class T {

}

let r = R()
let s = S()
let t = T() // X -> 타입캐스팅은 상속 관계에 있는 클래스 사이에서만 가능

// 다음 코드에서 U 클래스는 V 클래스의 메서드를 final로 선언하여 자식 클래스가 오버라이드할 수 없게 할 수 있다. (O/X)
class V {
    final func sayBye() {
        print("Bye")
    }
}

class U: V {
    override func sayBye() {
        print("Bye Bye Bye")
    }
} // O

/*
차량 클래스를 정의하고, 자동차와 오토바이 클래스를 차량 클래스로부터 상속받아서 구현하세요.

차량 클래스는 모델과 색깔을 속성으로 가지고 있습니다.

자동차 클래스는 문의 개수를, 오토바이 클래스는 헬멧의 유무를 추가로 속성으로 가지고 있습니다.

자동차와 오토바이 클래스는 각각 운전하는 메서드를 오버라이딩해야 합니다.
*/
class Vehicle {
    var model = ""
    var color = ""

    init(model: String, color: String) {
        self.model = model
        self.color = color
    }

    func drive() -> String {
        model + " " + color
    }
}

class Car : Vehicle {
    var doorNumber = 0

    init(model: String, color: String, doorNumber: Int = 0) {
        self.doorNumber = doorNumber
        super.init(model: model, color: color)
    }

    override func drive() -> String {
        super.drive() + " 자동차가 \(doorNumber)개의 문을 열고 달립니다."
    }
}

class Motorcycle : Vehicle {
    var helmet = false

    init(model: String, color: String, helmet: Bool = false) {
        self.helmet = helmet
        super.init(model: model, color: color)
    }

    override func drive() -> String {
        if helmet {
            super.drive() + " 오토바이가 헬멧을 쓰고 달립니다."
        } else {
            super.drive() + " 오토바이가 헬멧을 쓰고 않고 달립니다."
        }
    }
}

/* 
음식 클래스를 정의하고, 피자와 파스타 클래스를 음식 클래스로부터 상속받아서 구현하세요.

음식 클래스는 이름과 가격을 속성으로 가지고 있습니다.

피자 클래스는 토핑을, 파스타 클래스는 소스를 추가로 속성으로 가지고 있습니다.

피자와 파스타 클래스는 각각 주문하는 메서드를 오버라이딩해야 합니다.
*/
class Food {
    var name = ""
    var price = 0

    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }

    func order() -> String {
        "가격은 \(price)원입니다."
    }
}

class Pizza : Food {
    var topping = ""

    init(name: String, price: Int, topping: String = "") {
        self.topping = topping
        super.init(name: name, price: price)
    }

    override func order() -> String {
        "\(name) 피자에 \(topping)피자를 주문하였습니다. " + super.order()
    }
}

class Pasta : Food {
    var sauce = ""

    init(name: String, price: Int, sauce: String = "") {
        self.sauce = sauce
        super.init(name: name, price: price)
    }

    override func order() -> String {
        "\(name) 파스타에 \(sauce) 소스를 선택하였습니다. " + super.order()
    }
}

/* 
동물 클래스를 정의하고, 고양이와 개와 오리 클래스를 동물 클래스로부터 상속받아서 구현하세요.

동물 클래스는 이름과 나이를 속성으로 가지고 있습니다.

고양이와 개와 오리 클래스는 각각 울음소리를 추가로 속성으로 가지고 있습니다.

고양이와 개와 오리 클래스는 각각 울다라는 메서드를 오버라이딩해야 합니다.
*/
class Animal {
    var name = ""
    var age = 0

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func cry() -> String {
        ""
    }
}

class Cat : Animal {
    var meow = ""

    init(name: String, age: Int, meow: String) {
        self.meow = meow
        super.init(name: name, age: age)
    }

    override func cry() -> String {
        "\(name)이(가) \(meow)라고 울어요."
    }
}

class Dog : Animal {
    var bark = ""

    init(name: String, age: Int, bark: String) {
        self.bark = bark
        super.init(name: name, age: age)
    }

    override func cry() -> String {
        "\(name)이(가) \(bark)라고 짖어요."
    }
}

class Duck : Dog {
    override func cry() -> String {
        super.cry()
    }
}