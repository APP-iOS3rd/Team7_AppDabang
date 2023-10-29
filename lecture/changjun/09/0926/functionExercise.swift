//
//  functionExercise.swift
//  prac2
//
//  Created by phang on 2023/09/25.
//

import Foundation

struct FunctionExercise {
    
    // MARK: - [ 정수 입력 함수 ]
    private func getIntTypeInputValue(message msg: String) -> Int {
        print("\(msg)", terminator: "")
        guard let input = readLine(), let intNum = Int(input) else {
            print("입력 값 오류 - 정수를 입력하세요.")
            return getIntTypeInputValue(message: msg)
        }
        return intNum
    }
    
    // MARK: - 출력 양식 MultiLine
    private func formattedOutput(_ num1: Int, _ num2: Int, resultMessage: String, result: Any) -> String {
        let multiLine = """
                        1번째 수: \(num1)
                        2번째 수: \(num2)
                        \(resultMessage): \(result)
                        """
        return multiLine
    }
    
    // MARK: - 함수 예제 1
    /*
     두 수의 합을 받아 아래와 같은 결과가 나올 수 있도록 addNumber() 를 작성하시오
     */
    private func addNumber(_ num1: Int, _ num2: Int) -> Int {
        return (num1 + num2)
    }
    
    func functionExercise01() {
        print("-----addNumber-----")
        let (num1, num2) = (30, 5)
        let result = addNumber(num1, num2)
        let answer = formattedOutput(num1, num2, resultMessage: "연산결과", result: result)
        print(answer)
    }
    
    // MARK: - 함수 예제 2
    /*
     2개의 정수를 받아 2개의 숫자 중 더 큰 수를 반환하는 largerNumbers() 을 만들어보세요
     (만약 두 숫자가 같다면 0을 반환)
     */
    private func largerNumbers(_ num1: Int, _ num2: Int) -> Int {
        var largerNumber = 0
        if num1 > num2 {
            largerNumber = num1
        } else if num1 < num2 {
            largerNumber = num2
        }
        return largerNumber
    }
    
    func functionExercise02() {
        print("-----largerNumbers-----")
        let (num1, num2) = (2, 7)
        let result = largerNumbers(num1, num2)
        let answer = formattedOutput(num1, num2, resultMessage: "큰 수 확인", result: result)
        print(answer)
    }
    
    
    // MARK: - 함수 예제 3
    /*
     2개의 정수를 받아 2개의 숫자 중 10에 더 가까운 수를 반환하는 close10() 을 만들어보세요
     (만약 두 숫자 모두 10과의 차이가 같다면 0을 반환)
     */
    private func close10(_ num1: Int, _ num2: Int) -> Int {
        var close10Number = 0
        if (10 - num1) < (10 - num2) {
            close10Number = num1
        } else if (10 - num1) > (10 - num2) {
            close10Number = num2
        }
        return close10Number
    }
    
    func functionExercise03() {
        print("-----close10-----")
        let (num1, num2) = (-5, -1)
        let result = close10(num1, num2)
        let answer = formattedOutput(num1, num2, resultMessage: "10에 가까운 수", result: result)
        print(answer)
    }
    
    // MARK: - 함수 예제 4
    /*
     2개의 정수 base, n을 받아 base의 n제곱 만큼 값을 반환하는 powerN() 를 작성하세요
     */
    private func powerN(_ num1: Int, _ num2: Int) -> Int {
        let tmp = pow(Decimal(num1), num2)
        let result = NSDecimalNumber(decimal: tmp).intValue
        return result
    }
    
    func functionExercise04() {
        print("-----powerN-----")
        let (num1, num2) = (10, 2)
        let result = powerN(num1, num2)
        let answer = formattedOutput(num1, num2, resultMessage: "결과 확인", result: result)
        print(answer)
    }
    
    // MARK: - 함수 예제 5
    /*
     키보드로부터 입력받은 두 개의 정수를 인자(매개변수)로 넘겨받아 num1에서 num2를 뺀 결과값을 절대값으로 바꾸어 출력하는 getAbsoluteValue( ) 를 구현하세요
     */
    private func getAbsoluteValue(_ num1: Int, _ num2: Int) -> Int {
        return abs(num1 - num2)
    }
    
    func functionExercise05() {
        print("-----getAbsoluteValue-----")
        let (num1, num2) = (5, 10)
        let result = getAbsoluteValue(num1, num2)
        let answer = formattedOutput(num1, num2, resultMessage: "결과 확인", result: result)
        print(answer)
    }
    
    // MARK: - 함수 예제 6
    /*
     두 개의 정수를 인자(매개변수)로 넘겨받아 앞의 정수가 뒤의 정수로 나누어지는지를 판별하는 isDivide( ) 를 작성하세요.
     (이때 나누어지면 true, 나누어지지 않으면 false을 반환)
     */
    private func isDivide(_ num1: Int, _ num2: Int) -> Bool {
        return num1 % num2 == 0
    }
    
    func functionExercise06() {
        print("-----isDivide-----")
        let (num1, num2) = (10, 3)
        let result = isDivide(num1, num2)
        let answer = formattedOutput(num1, num2, resultMessage: "결과 확인", result: result)
        print(answer)
    }
    
    // MARK: - 함수 예제 7
    /*
     약수를 구하는 getDivisor() 를 구현하세요
     10의 약수: 1 2 5 10
     16의 약수: 1 2 4 8 16
     24의 약수: 1 2 3 4 6 8 12 24
     */
    private func getDivisor(_ num: Int) -> [Int]? {
        guard num >= 1 else { return nil }
        var divisorSet: Set<Int> = []
        let squareRoot = Int(sqrt(Double(num)))
        for n in 1...squareRoot {
            let (q, r) = num.quotientAndRemainder(dividingBy: n)
            if r == 0 {
                divisorSet.insert(q)
                divisorSet.insert(n)
            }
        }
        let divisorArr = Array(divisorSet).sorted()
        return divisorArr
    }

    func functionExercise07() {
        print("-----getDivisor-----")
        let num = 16
        guard let divisorArr = getDivisor(num) else {
            print("약수를 구할 수 없습니다.")
            return
        }
        let stringDivisorArr = divisorArr.map{ String($0) }.joined(separator: " ")
        print("\(num)의 약수: \(stringDivisorArr)")
    }

    // MARK: - 함수 예제 8
    /*
     약수의 합을 구하여 반환하는 getSumOfDivisors() 를 구현하세요
     10의 약수의 합: 18
     16의 약수의 합: 31
     */
    private func getSumOfDivisors(_ num: Int) -> Int {
        var result = 0
        guard let arr = getDivisor(num) else {
            return result
        }
        result = arr.reduce(0, { $0 + $1 })
        return result
    }
    
    func functionExercise08() {
        print("-----getSumOfDivisors-----")
        let num = 16
        let result = getSumOfDivisors(num)
        print("\(num)의 약수의 합: \(result)")
    }
    
    // MARK: - 함수 예제 9
    /*
     startValue...endValue까지의 숫자 중 완전수를 출력하는 getPerfectNumber() 를 구현하세요
     2~1000까지의 완전수: 6 28 496
     */
    private func isPerfectNumber(_ num: Int) -> Bool {
        return num == getSumOfDivisors(num) - num
    }
    
    private func getPerfectNumber(_ startValue: Int, _ endValue: Int) -> [Int]? {
        var perfectNumberArr = [Int]()
        for num in startValue...endValue {
            if isPerfectNumber(num) {
                perfectNumberArr.append(num)
            }
        }
        return perfectNumberArr
    }
    
    func functionExercise09() {
        print("-----getPerfectNumber-----")
        let startValue = 2
        let endValue = 1000
        guard let resultArr = getPerfectNumber(startValue, endValue) else {
            print("\(startValue)~\(endValue)까지의 완전수가 없습니다.")
            return
        }
        let result = resultArr.map{ String($0) }.joined(separator: " ")
        print("\(startValue)~\(endValue)까지의 완전수: \(result)")
    }
    
    // MARK: - 함수 예제 10
    /*
     startValue~endValue까지의 숫자 중 소수를 출력하는 getPrimeNumber() 를 구현하세요
     2~30까지의 소수: 2 3 5 7 11 13 17 19 23 29
     */
    private func getPrimeNumber(_ startValue: Int, _ endValue: Int) -> [Int] {
        var primeNumberArr = [Int]()
        for num in startValue...endValue {
            guard let arr = getDivisor(num) else { return primeNumberArr }
            if arr.count == 2 {
                primeNumberArr.append(num)
            }
        }
        return primeNumberArr
    }
    
    func functionExercise10() {
        print("-----getPrimeNumber-----")
        let startValue = 2
        let endValue = 30
        let resultArr = getPrimeNumber(startValue, endValue)
        if resultArr.count == 0 {
            print("\(startValue)~\(endValue)까지의 소수가 없습니다.")
        } else {
            let result = resultArr.map{ String($0) }.joined(separator: " ")
            print("\(startValue)~\(endValue)까지의 소수: \(result)")
        }
    }
    
    // MARK: - 함수 예제 10-1 ( 에라토스테네스의 체 )
    /*
     예제 10 과 동일
     2~30까지의 소수: 2 3 5 7 11 13 17 19 23 29
     */
    private func getPrimeNumberArr(_ startValue: Int, _ endValue: Int) -> [Int] {
        let endValueSquareRoot = Int(sqrt(Double(endValue)))
        var checkArr = Array(repeating: 0, count: endValue + 1)
        
        for num in 2...endValueSquareRoot {
            if checkArr[num] == 0 {
                var x = 2
                while num * x <= endValue {
                    checkArr[num * x] = 1
                    x += 1
                }
            }
        }
        return checkArr
    }
    
    func functionExercise10_1() {
        let startValue = 2
        let endValue = 30
        let primeNumberArr = getPrimeNumberArr(startValue, endValue)
        var tmp = [Int]()
        for idx in startValue...endValue {
            if primeNumberArr[idx] == 0 {
                tmp.append(idx)
            }
        }
        if tmp.count == 0 {
            print("\(startValue)~\(endValue)까지의 소수가 없습니다.")
        } else {
            let result = tmp.map{ String($0) }.joined(separator: " ")
            print("\(startValue)~\(endValue)까지의 소수: \(result)")
        }
    }
    
}
