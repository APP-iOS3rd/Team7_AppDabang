import UIKit

// MARK: - Inheritance 14

class Vehicle {
    var model: String
    var color: String

    init(model: String, color: String) {
        self.model = model
        self.color = color
    }
    
    func drive() {
        print("\(model) \(color)", terminator: " ")
    }
}

class Car: Vehicle {
    var doorNumber: Int
    
    init(model: String, color: String, doorNumber: Int) {
        self.doorNumber = doorNumber
        super.init(model: model, color: color)
    }
    
    override func drive() {
        super.drive()
        print("자동차가 \(doorNumber)개의 문을 열고 달립니다.")
    }
}

class Motorcycle: Vehicle {
    var helmet: Bool
    
    init(model: String, color: String, helmet: Bool) {
        self.helmet = helmet
        super.init(model: model, color: color)
    }
    
    override func drive() {
        super.drive()
        print("오토바이가 헬멧을 \(helmet ? "쓰고" : "쓰지 않고") 달립니다.")
    }
}


let car: Vehicle = Car(model: "소나타", color: "검정", doorNumber: 4)
let motorcycle: Vehicle = Motorcycle(model: "니노", color: "노랑", helmet: true)
car.drive() // 소나타 검정 자동차가 4개의 문을 열고 달립니다.
motorcycle.drive() // 니노 노랑 오토바이가 헬멧을 쓰고 달립니다. or // ~오토바이가 헬멧을 쓰지 않고 달립니다

// MARK: - Inheritance 15
class Food {
    var name: String
    var price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    func order() { }
}

class Pizza: Food {
    var topping: String
    
    init(name: String, price: Int, topping: String) {
        self.topping = topping
        super.init(name: name, price: price)
    }
    
    override func order() {
        print("\(name) 피자에 \(topping) 토핑을 선택하였습니다. 가격은 \(price)원입니다.")
    }
}

class Pasta: Food {
    var sauce: String
    
    init(name: String, price: Int, sauce: String) {
        self.sauce = sauce
        super.init(name: name, price: price)
    }
    
    override func order() {
        print("\(name) 파스타에 \(sauce) 소스를 선택하였습니다. 가격은 \(price)원입니다.")
    }
}


let cheesePizza: Food = Pizza(name: "치즈", price: 15000, topping: "치즈")
let carbonara: Food = Pasta(name: "카르보나라", price: 12000, sauce: "크림")
cheesePizza.order() // 치즈 피자에 치즈 토핑을 선택하였습니다. 가격은 15000원입니다.
carbonara.order()   // 카르보나라 파스타에 크림 소스를 선택하였습니다. 가격은 12000원입니다.

// MARK: - Inheritance 16
class AnimalClass {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func cry() { }
}

class Cat: AnimalClass {
    var meow: String
    
    init(name: String, age: Int, meow: String) {
        self.meow = meow
        super.init(name: name, age: age)
    }
    
    override func cry() {
        print("\(name)이(가) \(meow)라고 울어요.")
    }
}

class Dog: AnimalClass {
    var bark: String

    init(name: String, age: Int, bark: String) {
        self.bark = bark
        super.init(name: name, age: age)
    }
    
    override func cry() {
        print("\(name)이(가) \(bark)라고 울어요.")
    }
}

class Duck: AnimalClass {
    var bark: String

    init(name: String, age: Int, bark: String) {
        self.bark = bark
        super.init(name: name, age: age)
    }
    
    override func cry() {
        print("\(name)이(가) \(bark)라고 울어요.")
    }
}

let kitty = Cat(name: "나비", age: 3, meow: "야옹")
let puppy = Dog(name: "초코", age: 2, bark: "멍멍")
let duck = Duck(name: "멋쟁", age: 2, bark: "꽥꽥")

let animalsArr: [AnimalClass] = [kitty, puppy, duck]
animalsArr[0].cry()    // 나비이(가) 야옹라고 울어요.
animalsArr[1].cry()    // 초코이(가) 멍멍라고 짖어요.
animalsArr[2].cry()    // 멋쟁이(가) 꽥꽥라고 짖어요.
for ani in animalsArr { ani.cry() }

// MARK: - Enum 01
enum Suit {
    case spade, heart, diamond, club
}

enum Rank {
    case ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
}

struct Card {
    var suit: Suit
    var rank: Rank
}

func compareCards(card1: Card, card2: Card) {
    switch (card1.suit == card2.suit, card1.rank == card2.rank) {
    case (true, true):
        print("두 카드는 모두 같습니다.")
    case (true, false):
        print("두 카드는 같은 무늬입니다.")
    case (false, true):
        print("두 카드는 같은 숫자입니다.")
    default: // (false, false)
        print("두 카드는 모두 다릅니다.")
    }
}

let card1 = Card(suit: .spade, rank: .ace)
let card2 = Card(suit: .heart, rank: .king)
let card3 = Card(suit: .spade, rank: .king)
let card4 = Card(suit: .heart, rank: .king)

compareCards(card1: card2, card2: card4)  // 두 카드는 모두 같습니다.
compareCards(card1: card1, card2: card3)  // 두 카드는 같은 무늬입니다.
compareCards(card1: card2, card2: card3)  // 두 카드는 같은 숫자입니다.
compareCards(card1: card1, card2: card2)  // 두 카드는 모두 다릅니다.

// MARK: - Enum 02
enum Animal {
    case dog(name: String)
    case cat(name: String)
    case bird(name: String)
}

func checkAnimal(animals: [Animal]) {
    animals.forEach { animal in
        switch animal {
        case .dog(name: let name):
            print("이 동물은 개이고, 이름은 \(name)입니다.")
        case .cat(name: let name):
            print("이 동물은 고양이이고, 이름은 \(name)입니다.")
        case .bird(name: let name):
            print("이 동물은 새이고, 이름은 \(name)입니다.")
        }
    }
}

let animals = [Animal.dog(name: "바둑이"), Animal.cat(name: "나비"), Animal.bird(name: "짹짹이")]
checkAnimal(animals: animals)
//이 동물은 개이고 이름은 바둑이입니다.
//이 동물은 고양이이고 이름은 나비입니다.
//이 동물은 새이고 이름은 짹짹이입니다.

// MARK: - Enum 03
enum Season {
    case spring, summer, autumn, winter
}

func getSeason(date: (month: Int, day: Int)) -> Season {
    let (day28, day30, day31) = (1...28, 1...30, 1...31)
    
    switch date {
    case (12, day31), (1, day31), (2, day28):
        return .winter
    case (3, day31), (4, day30), (5, day31):
        return .spring
    case (6, day30), (7, day31), (8, day31):
        return .summer
    case (9, day30), (10, day31), (11, day30):
        return .autumn
    default:
        fatalError("Invalid Date")
    }
}

let today = (month: 10, day: 17)
let season = getSeason(date: today)

print("오늘은 \(season)입니다.")  // 오늘은 autumn입니다.
print("오늘은 \( getSeason(date: (month: 6, day: 17)) )입니다.")      // 오늘은 summer입니다.
print("오늘은 \( getSeason(date: (month: 12, day: 15)) )입니다.")     // 오늘은 winter입니다.
print("오늘은 \( getSeason(date: (month: 3, day: 1)) )입니다.")       // 오늘은 spring입니다.

// MARK: - Enum 04
enum Operator {
    case add, subtract, multiply, divide
}

func calculate(num1: Int, num2: Int, op: Operator) -> Int {
    switch op {
    case .add:
        return num1 + num2
    case .subtract:
        return num1 - num2
    case .multiply:
        return num1 * num2
    case .divide:
        return num1 / num2
    }
}

let result = calculate(num1: 10, num2: 5, op: .divide)

print("결과는 \(result)입니다.")      //결과는 2입니다.
print("결과는 \( calculate(num1: 10, num2: 5, op: .add) )입니다.")        //결과는 15입니다.
print("결과는 \( calculate(num1: 10, num2: 5, op: .subtract) )입니다.")   //결과는 5입니다.
print("결과는 \( calculate(num1: 10, num2: 5, op: .multiply) )입니다.")   //결과는 50입니다.

// MARK: - Enum 05
enum Beverage {
    case coffee(price: Int)
    case tea(price: Int)
    case juice(price: Int)
}

func printTypeAndPrice(beverages: [Beverage]) {
    beverages.forEach { beverage in
        switch beverage {
        case .coffee(price: let price):
            print("이 음료는 커피이고 가격은 \(price)원입니다.")
        case .tea(price: let price):
            print("이 음료는 차이고 가격은 \(price)원입니다.")
        case .juice(price: let price):
            print("이 음료는 주스이고 가격은 \(price)원입니다.")
        }
    }
}

let beverages = [Beverage.coffee(price: 3000), Beverage.tea(price: 2000), Beverage.juice(price: 2500)]
printTypeAndPrice(beverages: beverages)
//이 음료는 커피이고 가격은 3000원입니다.
//이 음료는 차이고 가격은 2000원입니다.
//이 음료는 주스이고 가격은 2500원입니다.
