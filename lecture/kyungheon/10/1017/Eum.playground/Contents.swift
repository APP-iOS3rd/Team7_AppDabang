import Foundation

// MARK: - 열거형 예제 01
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
    switch (card1.suit == card2.suit, card1.rank == card2.rank) {
    case (true, true):
        print("두 카드는 모두 같습니다.")
    case (true, false):
        print("두 카드는 같은 무늬입니다.")
    case (false, true):
        print("두 카드는 같은 숫자입니다.")
    default:
        print("두 카드는 모두 다릅니다.")
    }
    
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

// MARK: - 열거형 예제 02
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

// 예시:
let animals = [Animal.dog(name: "바둑이"), Animal.cat(name: "나비"), Animal.bird(name: "짹짹이")]
checkAnimal(animals: animals)

// MARK: - 열거형 예제 03
/*
 열거형을 사용하여 계절을 나타내는 타입을 정의하고,

 현재 날짜에 따라서 어떤 계절인지 출력하는 함수를 작성하세요.

 (날짜는 임의로 지정해도 됩니다.)
 */

enum Season {
    case spring
    case summer
    case full
    case winter
}

func getSeason(date: (month: Int, day: Int)) -> String{
    switch date.month {
    case 3...4:
        "\(Season.spring)"
    case 6...8:
        "\(Season.summer)"
    case 9...11:
        "\(Season.full)"
    case 12, 1, 2:
        "\(Season.winter)"
    default:
        if date.day >= 1 && date.day <= 15 {
            "\(Season.spring)"
        } else {
            "\(Season.summer)"
        }
    }
}

let today = (month: 10, day: 17)
let season = getSeason(date: today)

print("오늘은 \(season)입니다.")  // 오늘은 autumn입니다.
print("오늘은 \( getSeason(date: (month: 6, day: 17)) )입니다.")      // 오늘은 summer입니다.
print("오늘은 \( getSeason(date: (month: 12, day: 15)) )입니다.")     // 오늘은 winter입니다.
print("오늘은 \( getSeason(date: (month: 3, day: 1)) )입니다.")       // 오늘은 spring입니다.

// MARK: - 열거형 예제 04
/*
열거형을 사용하여 산술 연산자를 나타내는 타입을 정의하고,

두 개의 정수와 산술 연산자를 매개변수로 받아서 해당 연산을 수행하고 결과를 반환하는 함수를 작성하세요
*/

enum Op {
    case add
    case subtract
    case multiply
    case divide
}

func calculate(num1: Int, num2: Int, op: Op) -> Int {
    switch op {
    case .add:
        num1+num2
    case .subtract:
        num1-num2
    case .multiply:
        num1*num2
    case .divide:
        num1/num2
    }
}

// 예시:
let result = calculate(num1: 10, num2: 5, op: .divide)

print("결과는 \(result)입니다.")      //결과는 2입니다.
print("결과는 \( calculate(num1: 10, num2: 5, op: .add) )입니다.")        //결과는 15입니다.
print("결과는 \( calculate(num1: 10, num2: 5, op: .subtract) )입니다.")   //결과는 5입니다.
print("결과는 \( calculate(num1: 10, num2: 5, op: .multiply) )입니다.")   //결과는 50입니다.

// MARK: - 열거형 예제 05
/*
열거형을 사용하여 음료의 종류와 가격을 나타내는 타입을 정의하고,

음료의 배열을 만들어서 반복문으로 각 음료의 종류와 가격을 출력하는 함수를 작성하세요.
*/

enum Beverage {
    case coffee(price: Int)
    case tea(price: Int)
    case juice(price: Int)

}

func printTypeAndPrice(beverages: [Beverage]) {
    for beverage in beverages {
        switch beverage {
        case .coffee(let price):
            print("이 음료는 커피이고 가격은 \(price)입니다.")
        case .tea(let price):
            print("이 음료는 차이고 가격은 \(price)입니다.")
        case .juice(let price):
            print("이 음료는 주스이고 가격은 \(price)입니다.")
        }
    }
}

// 예시:
let beverages = [Beverage.coffee(price: 3000), Beverage.tea(price: 2000), Beverage.juice(price: 2500)]
printTypeAndPrice(beverages: beverages)
// 출력결과
/*
 이 음료는 커피이고 가격은 3000원입니다.
 이 음료는 차이고 가격은 2000원입니다.
 이 음료는 주스이고 가격은 2500원입니다.
 */
