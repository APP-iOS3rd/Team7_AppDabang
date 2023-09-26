import Foundation

// 0926
// 두 수의 합을 받는 addNumber()만들기
//func addNumber(a:Int, b:Int) -> Int{
//    return a + b
//}
//
//print("1번째 수: ",terminator: "")
//let a = Int(readLine()!)!
//print("2번째 수 : ",terminator: "")
//let b = Int(readLine()!)!
//print("연산결과 : \(addNumber(a: a, b: b))")


// 2개의 정수를 받아 2개의 숫자 중 더 큰수를 반환
//func largerNumber(a: Int, b:Int) -> Int {
//    if a == b {
//        return 0
//    }
//    return a > b ? a : b
//}
//print("1번째 수: ",terminator: "")
//let c = Int(readLine()!)!
//print("2번째 수 : ",terminator: "")
//let d = Int(readLine()!)!
//print("큰 수 확인 : \(largerNumber(a: c, b: d))")


// 2개의 정수를 받아 2개의 숫자 중 10에 더 가까운 수를 반환
//func close10(a: Int, b:Int){
//    var a_ten = abs(10 - a)
//    var b_ten = abs(10 - b)
//    var result = 0
//    if a_ten == b_ten {
//        result = 0
//    } else if a_ten > b_ten {
//       result = b
//    } else {
//        result = a
//    }
//    print("10에 가까운 수: \(result)")
//}

// 2개의 정수 base,n을 받아 base의 n제곱 만큼 값을 반환
//func powerN(num1: Int, num2: Int) {
//    var num = 1
//    for _ in 1...num2 {
//        num *= num1
//    }
//    print(num)
//}
//print("1번째 수: ", terminator: "")
//var powerNum1 = Int(readLine()!)!
//print("2번째 수: ", terminator: "")
//var powerNum2 = Int(readLine()!)!
//print("결과 확인: ", terminator: "")
//
//powerN(num1: powerNum1, num2: powerNum2)

// 키보드로부터 입력받은 두 개의 정수를 인자로 겨받아 num1에서 num2를 뺀 결과값을 절대값으로 바꾸어 출력

// 두 개의 정수를 인자(매개변수)로 넘겨받아 앞의 정수가 뒤의 정수로 나누어지는지를 판별
// (이때 나누어지면 true, 나누어지지 않으면 false을 반환)
//func isDivide (a:Int, b:Int) -> Bool {
//    if b == 0 {
//        return false
//    }
//    return (a % b == 0)
//}
//
//func getDivisor (a: Int) -> String {
//    var str = "\(a)의 약수: "
//    for i in 1...a {
//        if isDivide(a: a, b: i) {
//            str += "\(i)"
//        }
//    }
//    return ""
//}
//
//let a: Int = 10
//let b: Int = 3
//
////let c: Bool = isDivide(a: a, b: b)
//let c: String = getDivisor(a: a)
//print(c)

// 약수의 합을 구해 반환
//func getSumOfDivisors (a: Int) -> Int {
//    var sum = 0
//    for i in 1...a {
//        if isDivide(a: a, b: i) {
//            sum += i
//        }
//    }
//    return sum
//}
//
//let a: Int = 10
//let c: Int = getSumOfDivisors(a: a)
//print("\(a)의 약수의 합:", c)

// startValue...endValue까지의 숫자 중 완전수를 출력
//func getSumOfDivisors (a: Int) -> Int {
//    var sum = 0
//    for i in 1...a {
//        if isDivide(a: a, b: i) {
//            sum += i
//        }
//    }
//    return sum
//}
//
//var str = ""
//for num in 2...1000 {
//    let c = getSumOfDivisors(a: num)
//    if (c - num) == num {
//        str += "\(num) "
//    }
//}
//
//print(str)

// startValue~endValue까지의 숫자 중 소수를 출력
//func getCountOfDivisors (a: Int) -> Int {
//    var cnt = 0
//    for i in 1...a {
//        if isDivide(a: a, b: i) {
//            cnt += 1
//        }
//    }
//    return cnt
//}
//
//var str = ""
//for i in 2...30 {
//    let c = getCountOfDivisors(a: i)
//    if c == 2 {
//        str += "\(i) "
//    }
//}
//
//print(str)

// 저금통에 1500원, 700원을 입금한 후 출력
//저금통에서 500원을 인출한 후 출력
//class pigBank {
//    var currentMoney: Int = 0
//    
//    func deposit(depositMoeny: Int) {
//        
//        currentMoney += depositMoeny
//        print("현재 잔액: \(currentMoney)")
//    }
//    
//    func withdrawal(withdrawalMoney: Int) {
//        currentMoney -= withdrawalMoney
//        print("현재 잔액: \(currentMoney)")
//    }
//}
//
//var bank = pigBank()
//
//bank.deposit(depositMoeny: 1500)
//bank.deposit(depositMoeny: 700)
//bank.withdrawal(withdrawalMoney: 500)
