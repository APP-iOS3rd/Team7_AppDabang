/*
열거형을 사용하여 카드의 무늬와 숫자를 나타내는 타입을 정의하고,

카드 두 장을 비교하여 같은 무늬인지, 같은 숫자인지, 모두 같은지 또는 모두 다른지 출력하는 함수를 작성하세요.
*/
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
    if card1.suit == card2.suit && card1.rank == card2.rank {
        print("두 카드는 모두 같습니다.")
    } else if card1.suit == card2.suit {
        print("두 카드는 같은 무늬입니다.")
    } else if card1.rank == card2.rank {
        print("두 카드는 같은 숫자입니다.")
    } else {
        print("두 카드는 모두 다릅니다.")
    }
}

/*
열거형을 사용하여 동물의 종류와 이름을 나타내는 타입을 정의하고,

동물의 배열을 만들어서 반복문으로 각 동물의 종류와 이름을 출력하는 함수를 작성하세요.
*/
enum Animal {
    case dog(name: String)
    case cat(name: String)
    case bird(name: String)
}

func checkAnimal(animals: [Animal]) {
    for animal in animals {
        switch animal {
        case .dog(let name):
            print("이 동물은 개이고 이름은 \(name)입니다.")
        case .cat(let name):
            print("이 동물은 고양이이고 이름은 \(name)입니다.")
        case .bird(let name):
            print("이 동물은 새이고 이름은 \(name)입니다.")
        }
    }
}

/*
열거형을 사용하여 계절을 나타내는 타입을 정의하고,

현재 날짜에 따라서 어떤 계절인지 출력하는 함수를 작성하세요.

(날짜는 임의로 지정해도 됩니다.)
*/
enum Season {
    case spring, summer, autumn, winter
}

func getSeason(date: (month: Int, day: Int)) -> Season {

    switch date.month {
    case 3...5:
        return .spring
    case 6...8:
        return .summer
    case 9...11:
        return .autumn
    default:
        return .winter
    }

}

/*
열거형을 사용하여 산술 연산자를 나타내는 타입을 정의하고,

두 개의 정수와 산술 연산자를 매개변수로 받아서 해당 연산을 수행하고 결과를 반환하는 함수를 작성하세요.
*/
enum ArithmeticOperator {
    case add, subtract, multiply, divide
}

func calculate(num1: Int, num2: Int, op: ArithmeticOperator) -> Int {

    switch op {
    case .add:
        num1 + num2
    case .subtract:
        num1 - num2
    case .multiply:
        num1 * num2
    default:
        num1 / num2
    }

}

/*
열거형을 사용하여 음료의 종류와 가격을 나타내는 타입을 정의하고,

음료의 배열을 만들어서 반복문으로 각 음료의 종류와 가격을 출력하는 함수를 작성하세요.

*/
enum Beverage {
    case coffee(price: Int)
    case tea(price: Int)
    case juice(price: Int)
}

func printTypeAndPrice(beverages: [Beverage])  {

    for beverage in beverages {
        switch beverage {
        case .coffee(let price):
            print("이 음료는 커피이고 가격은 \(price)원입니다.")
        case .tea(let price):
            print("이 음료는 차이고 가격은 \(price)원입니다.")
        case .juice(let price):
            print("이 음료는 주스이고 가격은 \(price)원입니다.")
        }
    }

}

/*
열거형을 사용하여 방향을 나타내는 타입을 정의하고,

현재 위치와 방향을 매개변수로 받아서 다음 위치를 반환하는 함수를 작성하세요.

(위치는 x, y 좌표로 표현하고, 방향은 상, 하, 좌, 우로 표현합니다.)
*/
enum Direction {
    case up, down, right, left
}

func move(position: (x: Int, y: Int), direction: Direction) -> (x: Int, y: Int) {
    switch direction {
    case .up:    (position.x, position.y + 1)
    case .down:  (position.x, position.y - 1)
    case .left:  (position.x - 1, position.y)
    case .right: (position.x + 1, position.y)
    }
}

/*
열거형을 사용하여 주사위의 면을 나타내는 타입을 정의하고,

랜덤한 주사위의 면을 반환하는 함수를 작성하세요.
*/
enum Dice {
    case one, two, three, four, five, six
}

func rollDice() -> Dice {
    let random = Int.random(in: 1...6)
    switch random {
    case 1:  return .one
    case 2:  return .two
    case 3:  return .three
    case 4:  return .four
    case 5:  return .five
    case 6:  return .six
    default: return .one  // 이 경우는 발생하지 않지만 컴파일러를 만족시키기 위해 작성
    }
}

/*
열거형을 사용하여 색상을 나타내는 타입을 정의하고,

색상의 배열을 만들어서 반복문으로 각 색상의 이름과 RGB 값을 출력하는 함수를 작성하세요.

*/
enum Color {
    case red(r: Int, g: Int, b: Int)
    case green(r: Int, g: Int, b: Int)
    case blue(r: Int, g: Int, b: Int)
}

func printColors(colors: [Color]) {
    for color in colors {
        switch color {
        case .red(let r, let g, let b):
            print("이 색상은 빨강이고 RGB 값은 (\(r), \(g), \(b)입니다.")
        case .green(let r, let g, let b):
            print("이 색상은 빨강이고 RGB 값은 (\(r), \(g), \(b)입니다.")
        case .blue(let r, let g, let b):
            print("이 색상은 빨강이고 RGB 값은 (\(r), \(g), \(b)입니다.")
        }
    }
}