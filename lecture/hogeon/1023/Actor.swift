/*
다음 코드는 actor 를 사용하여 비동기적으로 두 개의 숫자를 더하는 함수를 정의하고 있습니다.

이 코드의 실행 결과는 무엇일까요?
*/
actor Calculator {
    func add(_ x: Int, _ y: Int) -> Int {
        return x + y
    }
}

let calculator = Calculator()
Task {
    let result = await calculator.add(3, 5)
    print(result) // 8
}


/*
actor 를 사용하여 비동기적으로 두 개의 숫자를 곱하는 함수를 가지고 있는 액터를 만들어 보세요.
// 예시:
let multiplier = Multiplier(factor: 2)
Task {
    let result = await multiplier.multiply(4)
    print(result)
}
*/
actor Multiplier {
    var factor: Int

    init(factor: Int) {
        self.factor = factor
    }

    func multiply(_ x: Int) -> Int {
        return x * factor
    }
}

/*
다음 코드에서 actor 를 사용하여 Counter 클래스를 정의하고, increment 메서드를 구현하세요.

(increment 메서드는 내부의 count 프로퍼티를 1 증가시킨다.)
// 예시코드
class Counter {
    var count = 0
}

let counter = Counter()
counter.increment()
*/
actor Counter {
    var count = 0

    func increment() {
        count += 1
    }
}

Task {
    let counter = Counter()
    await counter.increment()
    await counter.increment()
    await counter.increment()
    print( await counter.count )
}

/*
actor 를 사용하여 비동기적으로 두 개의 문자열을 연결하는 함수를 정의하고 호출하는 액터를 작성하세요.
// 예시:
let concatenator = Concatenator()
async {
    let result = await concatenator.concatenate("Hello", "World")
    print(result) // 출력 결과: HelloWorld
}
*/
actor Concatenator {
    func concatenate(_ x: String, _ y: String) -> String {
        return x + y
    }
}


// 예시:
let concatenator = Concatenator()
Task {
    let result = await concatenator.concatenate("Hello", "World")
    print(result) // 출력 결과: HelloWorld
}

/*
다음 기능들을 갖는 StringEx 액터를 정의하세요.

비동기적으로 문자열을 대문자로 변환하는 함수를 정의
비동기적으로 문자열을 소문자로 변환하는 함수를 정의
비동기적으로 문자열을 역순으로 변환하는 함수를 정의
// 예시:
let str = StringEx("swIFt")
Task {
    print(await str.capitalize()) // 출력 결과: SWIFT
    print(await str.lowercase()) // 출력 결과: swift
    print(await str.reverse()) // 출력 결과: tFIws
}
*/
actor StringEx {
    let x: String

    init(_ x: String) {
        self.x = x
    }

    func capitalize() -> String {
        x.uppercased()
    }

    func lowercase() -> String {
        x.lowercased()
    }

    func reverse() -> String {
        String( x.reversed() )
    }
}

/*
다음 코드는 actor 를 사용하여 은행 계좌의 입출금을 관리하는 예제이다.

코드를 완성하여 입출금 기능을 구현하고, 잔액을 출력하세요.

actor BankAccount {
  var balance = 0

  // TODO: 입금 기능을 구현

  // TODO: 출금 기능을 구현
}

let account = BankAccount()

Task {
  // TODO: account 에 1000원을 입금

  // TODO: account 에서 500원을 출금

  // TODO: account 의 잔액을 출력
}

Task {
  // TODO: account 에 3000원을 입금

  // TODO: account 에서 6000원을 출금

  // TODO: account 의 잔액을 출력
}
*/
enum BankError: Error {
    case negativeAmount
    case insufficientBalance
}

actor BankAccount {
    var balance: Double = 0

    // TODO: 입금 기능을 구현
    func deposit(_ amount: Double) -> Bool {
        if amount > 0 {
            self.balance += amount
            return true
        } else {
            return false
        }
    }

    // TODO: 출금 기능을 구현
    func withdraw(_ amount: Double) throws -> Double {
        if amount < 0 {
            throw BankError.negativeAmount
        }
        if amount > balance {
            throw BankError.insufficientBalance
        }
        self.balance -= amount
        return amount
    }
}

let account = BankAccount()

Task {
    // TODO: account 에 1000원을 입금
    await account.deposit(1000)

    // TODO: account 에서 500원을 출금
    try? await account.withdraw(500)

    // TODO: account 의 잔액을 출력
    print( await account.balance )
}

Task {
    // TODO: account 에 3000원을 입금
    await account.deposit(3000)

    // TODO: account 에서 6000원을 출금
    try? await account.withdraw(6000)

    // TODO: account 의 잔액을 출력
    print( await account.balance )
}