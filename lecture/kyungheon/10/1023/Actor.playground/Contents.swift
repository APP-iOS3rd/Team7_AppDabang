import SwiftUI

// MARK: - 액터 예제 01
/*
다음 코드는 actor 를 사용하여 비동기적으로 두 개의 숫자를 더하는 함수를 정의하고 있습니다.

이 코드의 실행 결과는 무엇일까요?
*/

actor Calculator {
    func add(_ x: Int, _ y: Int) async -> Int { // async를 지워도 가능
        return x + y
    }
}

let calculator = Calculator()
async {
    let result = await calculator.add(3, 5)
    print(result)
}

// Task를 씌워도 됌
Task {
    let result = await calculator.add(3, 5)
    print(result) // 8
}

// MARK: - 액터 예제 02
/*
 actor 를 사용하여 비동기적으로 두 개의 숫자를 곱하는 함수를 가지고 있는 액터를 만들어 보세요.
*/

actor Multiplier {
    var factor : Int
    
    init(factor: Int) {
        self.factor = factor
    }
    
    func multiply(_ n : Int) -> Int {
        return factor * n
    }
}

let multiplier = Multiplier(factor: 2)
Task {
    let result = await multiplier.multiply(4)
    print(result)
}

// MARK: - 액터 예제 03
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
    var count: Int
    
    init() {
        count = 0
    }
    
    init(count: Int) {
        self.count = count
    }
    
    func increment() {
        self.count += 1
    }
}

let counter = Counter()
Task {
    await print(counter.count) // 0
    await counter.increment()
    await print(counter.count) // 1
}


// MARK: - 액터 예제 04
/*
 actor 를 사용하여 비동기적으로 두 개의 문자열을 연결하는 함수를 정의하고 호출하는 액터를 작성하세요.
*/

actor Concatenator {
    func concatenate(_ s1: String, _ s2: String) -> String {
        return s1 + s2
    }
}

let concatenator = Concatenator()
async {
    let result = await concatenator.concatenate("Hello", "World")
    print(result) // 출력 결과: HelloWorld
}

// MARK: - 액터 예제 05
/*
다음 기능들을 갖는 StringEx 액터를 정의하세요.

비동기적으로 문자열을 대문자로 변환하는 함수를 정의
비동기적으로 문자열을 소문자로 변환하는 함수를 정의
비동기적으로 문자열을 역순으로 변환하는 함수를 정의
*/

actor StringEx {
    var str: String
    
    init(str: String) {
        self.str = str
    }
    
    func capitalize(_ newStr: String) -> String {
        str = newStr.uppercased()
        return str
    }
    
    func lowercase(_ newStr: String) -> String {
        str = newStr.lowercased()
        return str
    }
    
    func reverse(_ newStr: String) -> String {
        str = ""
        for i in newStr.reversed() {
            str += String(i)
        }
        // str.reversed().joined()
        return str
    }
}

let str = StringEx(str: "swift")
Task {
    print(await str.capitalize("swift")) // SWIFT
    print(await str.lowercase("SWIFT")) // swift
    print(await str.reverse("swift")) //tfiws
}

// MARK: - 액터 예제 06
/*
 다음 코드는 actor 를 사용하여 은행 계좌의 입출금을 관리하는 예제이다.

 코드를 완성하여 입출금 기능을 구현하고, 잔액을 출력하세요.
 */

actor BankAccount {
    var balance = 0
    
    func deposit(amount: Int) {
        guard amount > 0 else {
            return
        }
        balance += amount
        return
    }
    
    func withdraw(amount: Int) -> Int {
        guard amount > 0, balance >= amount else {
            return -1
        }
        balance -= amount
        
        return balance
    }
}

let account = BankAccount()

Task {
  // TODO: account 에 1000원을 입금
    await account.deposit(amount: 1000)
  // TODO: account 에서 500원을 출금
    let money = await account.withdraw(amount: 500)
    if money == -1 {
        print("잔액 부족 출금 불가")
    }
  // TODO: account 의 잔액을 출력
    print(await account.balance)
}

Task {
  // TODO: account 에 3000원을 입금
    await account.deposit(amount: 3000)

  // TODO: account 에서 6000원을 출금
    let money = await account.withdraw(amount: 6000)
    if money == -1 {
        print("잔액 부족, 출금 불가")
    }

  // TODO: account 의 잔액을 출력
    print(await account.balance)
}
