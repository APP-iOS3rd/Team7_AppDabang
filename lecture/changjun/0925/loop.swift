//
//  loop.swift
//  prac2
//
//  Created by phang on 2023/09/22.
//

import Foundation

struct Loop {
    
    // MARK: - [ 정수 입력 함수 ]
    private func getIntTypeInputValue(message msg: String) -> Int {
        print("\(msg)", terminator: "")
        guard let input = readLine(), let intNum = Int(input) else {
            print("입력 값 오류 - 정수를 입력하세요.")
            return getIntTypeInputValue(message: msg)
        }
        return intNum
    }
    
    // MARK: - [ 문자열 입력 함수 ]
    private func getStringInputValue(message msg: String) -> String {
        print("\(msg)", terminator: "")
        guard let input = readLine() else {
            print("입력 값 오류 - 올바른 값을 입력하세요.")
            return getStringInputValue(message: msg)
        }
        return input
    }
    
    // MARK: - [ (x) or (y) 답변 입력 함수 ]
    private func getAnswerInputValue(message msg: String, _ x: String, _ y: String) -> String {
        print("\(msg)", terminator: "")
        guard let input = readLine(), (input == "\(x)" || input == "\(y)") else {
            print("입력 값 오류 - 올바른 값을 입력하세요.")
            return getAnswerInputValue(message: msg, x, y)
        }
        return input
    }
    
    // MARK: - 약수 구하기 함수
    private func getDivisors(_ num: Int) -> [Int] {
        guard num != 1 else { return [1] }
        var arr = [Int]()
        let squareRoot = Int(sqrt(Double(num)))
        for n in 1...squareRoot {
            let (q, r) = num.quotientAndRemainder(dividingBy: n)
            if r == 0 {
                arr.append(q)
                arr.append(n)
            }
        }
        return arr.sorted()
    }
    
    // MARK: - while 예제 1
    /*
     while문을 사용하여 키보드로부터 입력 받은 수가 10보다 작을 때만 계속 정수를 입력 받으세요.

     정수 입력: 2
     정수 입력: 4
     정수 입력: 6
     정수 입력: 8
     정수 입력: 9
     정수 입력: 7
     정수 입력: 12
     종료되었습니다.
     */
    func whileExercise01() {
        var number = 0
        while number < 10 {
            number = getIntTypeInputValue(message: "정수 입력: ")
        }
        print("종료되었습니다.")
    }
    
    // MARK: - while 예제 2
    /*
     다이어트 관리 프로그램

     현재 몸무게와 목표몸무게를 입력 받고 주차 별 감량 몸무게를 입력 받으세요.
     목표 몸무게를 달성하면 축하한다는 문구를 출력 하고 입력을 멈추세요!
     현재 몸무게: 80
     목표 몸무게: 70
     1주차 감량 몸무게: 2
     2주차 감량 몸무게: 3
     3주차 감량 몸무게: 4
     4주차 감량 몸무게: 5
     66kg 달성! 축하합니다!!
     */
    func whileExercise02() {
        var nowWeight = getIntTypeInputValue(message: "현재 몸무게: ")
        let goalWeight = getIntTypeInputValue(message: "목표 몸무게: ")
        
        var week = 1
        while nowWeight > goalWeight {
            nowWeight -= getIntTypeInputValue(message: "\(week)주차 감량 몸무게: ")
            week += 1
        }
        print("\(nowWeight)kg 달성! 축하합니다!!")
    }
    
    // MARK: - while 예제 4
    /*
     Login프로그램

     로그인이 실패했을 경우에 계속 입력
     로그인이 성공하면 프로그램 종료

     아이디를 입력해 주세요: check
     비밀번호를 입력해 주세요: 1234
     아이디와 비밀번호가 잘못되었습니다.

     아이디를 입력해 주세요: Hello
     비밀번호를 입력해 주세요: 4321
     아이디와 비밀번호가 잘못되었습니다.

     아이디를 입력해 주세요: Hello
     비밀번호를 입력해 주세요: 1234
     로그인 성공!
     */
    
    func whileExercise04() {
        let userID = "Hello"
        let password = 1234
        
        while true {
            let inputID = getStringInputValue(message: "아이디를 입력해 주세요: ")
            let inputPW = getIntTypeInputValue(message: "비밀번호를 입력해 주세요: ")
            
            if userID != inputID || password != inputPW {
                print("아이디와 비밀번호가 잘못되었습니다.")
                continue
            }
            if userID == inputID, password == inputPW {
                print("로그인 성공!")
                break
            }
        }
    }
    
    // MARK: - while 예제 5
    /*
     Login프로그램
     아이디와 비밀번호가 틀렸을 경우 "계속 하시겠습니까?" 라는 문장을 출력하세요.
     Y를 입력하면 아이디 비밀번호 입력 계속,
     N을 입력하면 종료
     로그인 성공 시 종료
     
     아이디를 입력해 주세요: hi
     비밀번호를 입력해 주세요: 1234
     아이디와 비밀번호가 잘못되었습니다.
     계속 하시겠습니까? (Y/N) Y

     아이디를 입력해 주세요: Hello
     비밀번호를 입력해 주세요: 4321
     아이디와 비밀번호가 잘못되었습니다.
     계속 하시겠습니까? (Y/N) N

     종료되었습니다.
     아이디를 입력해 주세요: Hello
     비밀번호를 입력해 주세요: 4321
     아이디와 비밀번호가 잘못되었습니다.
     계속 하시겠습니까? (Y/N) Y

     아이디를 입력해 주세요: Hello
     비밀번호를 입력해 주세요: 1234
     로그인 성공!

     종료되었습니다.
     */
    func whileExercise05() {
        let userID = "Hello"
        let password = 1234
        
        while true {
            let inputID = getStringInputValue(message: "아이디를 입력해 주세요: ")
            let inputPW = getIntTypeInputValue(message: "비밀번호를 입력해 주세요: ")
            
            if userID == inputID, password == inputPW {
                print("로그인 성공!")
                break
            } else {
                print("아이디와 비밀번호가 잘못되었습니다.")
                let answer = getAnswerInputValue(message: "계속 하시겠습니까? (Y/N): ", "Y", "N")
                if answer == "N" {
                    break
                }
            }
        }
        print("종료되었습니다.")
    }
    
    // MARK: - while 예제 6
    /*
     (+, -) 계산기프로그램
     첫 번째 정수를 입력 받는다.
     두 번째 정수를 입력 받는다.
     연산자를 선택한다.
     선택한 연산자에 따라 연산결과를 출력한다.
     다시 실행할 것인가를 물어본다.
     “Y” 를 입력하면 다시 실행.
     “N”을 입력하면 반복문 종료.
     
     첫 번째 정수를 입력하세요: 50
     두 번째 정수를 입력하세요: 25
     1.더하기 2.빼기 : 1
     더하기 연산 결과는 75입니다.
     다시 실행 하시겠습니까? (Y/N) Y

     첫 번째 정수를 입력하세요: 30
     두 번째 정수를 입력하세요: 46
     1.더하기 2.빼기 : 2
     빼기 연산 결과는 -16입니다.
     다시 실행 하시겠습니까? (Y/N) N

     종료되었습니다.
     */
    func whileExercise06() {
        
        func calculatorProgram() {
            let num1 = getIntTypeInputValue(message: "첫 번째 정수를 입력하세요: ")
            let num2 = getIntTypeInputValue(message: "두 번째 정수를 입력하세요: ")
            let pickNumber = Int(getAnswerInputValue(message: "1.더하기 2.빼기 : ", "1", "2"))
            
            while true {
                if pickNumber == 1 {
                    print("더하기 연산 결과는 \(num1 + num2)입니다.")
                    break
                } else if pickNumber == 2 {
                    print("빼기 연산 결과는 \(num1 - num2)입니다.")
                    break
                }
            }
        }

        while true {
            calculatorProgram()
            let answer = getAnswerInputValue(message: "다시 실행 하시겠습니까? (Y/N): ", "Y", "N")
            if answer == "N" {
                break
            }
        }
        print("종료되었습니다.")
    }
    
    // MARK: - while 예제 7
    /*
     PlusGame
     랜덤으로 정수 2개를 뽑아 아래와 같이 출력
     사용자는 두 수의 합을 입력
     두 수의 합과 입력한 수가 일치하면 “Success”
     두 수의 합과 입력한 수가 일치하지 않으면 “Fail”을 출력
     
     === Plus Game ===
     12+17= 30
     Success
     === Plus Game ===
     12+17= 20
     Fail
     */
    func whileExercise07() {
        print("=== Plus Game ===")
        let num1 = Int.random(in: 0...100)
        let num2 = Int.random(in: 0...100)
        let answer = getIntTypeInputValue(message: "\(num1) + \(num2) = ")
        if answer == (num1 + num2) {
            print("Success")
        } else {
            print("Fail")
        }
    }
    
    // MARK: - while 예제 7-1
    /*
     PlusGame
     사용자가 원할 때까지 반복
     Fail 후 계속하기를 선택할 시 기존 숫자를 출력
     */
    func whileExercise07_1() {
        print("=== Plus Game ===")
        let num1 = Int.random(in: 0...100)
        let num2 = Int.random(in: 0...100)
        while true {
            let answer = getIntTypeInputValue(message: "\(num1) + \(num2) = ")
            if answer == (num1 + num2) {
                print("Success")
            } else {
                print("Fail")
            }
            let keep = getAnswerInputValue(message: "계속 하시겠습니까? (Y/N) ", "Y", "N")
            if keep == "N" {
                break
            }
        }
    }
    
    // MARK: - while 예제 7-2
    /*
     PlusGame
     Success 후 계속하기를 선택할 시 새로운 숫자를 뽑아서 출력
     */
    func whileExercise07_2() {
        while true {
            whileExercise07()
            let keep = getAnswerInputValue(message: "계속 하시겠습니까? (Y/N) ", "Y", "N")
            if keep == "N" {
                break
            }
        }
    }
    
    // MARK: - for 예제 0
    /*
     for문을 사용하여 96에서 53까지 출력하시오.
     for문을 사용하여 21에서 57까지의 수 중 홀수만 출력하시오.
     정수를 입력 받아 1부터 입력 받은 정수까지 차례대로 출력하는 프로그램을 작성하시오.
     정수입력: 10
     1 2 3 4 5 6 7 8 9 10
     한 개의 자연수를 입력 받아 그 수의 배수를 차례로 10개 출력하는 프로그램을 작성하시오.
     정수입력: 5
     5 10 15 20 25 30 35 40 45 50
     1~100까지 3의 배수의 합을 출력하세요. (1683)
     */
    func forExercise00() {
        print("for문을 사용하여 96에서 53까지 출력하시오.")
        let range1 = (53...96).reversed()
        for num in range1 {
            print(num, terminator: " ")
        }
        
        print("\n\nfor문을 사용하여 21에서 57까지의 수 중 홀수만 출력하시오.")
        for num in 21...57 {
            if num % 2 == 1 {
                print(num, terminator: " ")
            }
        }
        
        print("\n\n정수를 입력 받아 1부터 입력 받은 정수까지 차례대로 출력하는 프로그램을 작성하시오.")
        let inputNum1 = getIntTypeInputValue(message: "정수입력: ")
        for num in 1...inputNum1 {
            print(num, terminator: " ")
        }
        
        print("\n\n한 개의 자연수를 입력 받아 그 수의 배수를 차례로 10개 출력하는 프로그램을 작성하시오.")
        let inputNum2 = getIntTypeInputValue(message: "정수입력: ")
        for num in 1...10 {
            print(inputNum2 * num, terminator: " ")
        }
        
        print("\n\n1~100까지 3의 배수의 합을 출력하세요.")
        var result = 0
        for num in 1...100 {
            if num % 3 == 0 {
                result += num
            }
        }
        print(result)
    }
    // MARK: - for 예제 3
    /*
     for문을 사용하여 구구단 2단을 출력하세요
     */
    func forExercise03() {
        for i in 1...9 {
            print("2 * \(i) = \(i * 2)")
        }
    }
    
    // MARK: - for 예제 4
    /*
     원하는 단을 입력 받아 구구단을 출력하세요.
     단 입력: 8
     8 * 1 = 8
     8 * 2 = 16
     8 * 3 = 24
     8 * 4 = 32
     8 * 5 = 40
     8 * 6 = 48
     8 * 7 = 56
     8 * 8 = 64
     8 * 9 = 72
     */
    func forExercise04() {
        let num = getIntTypeInputValue(message: "단 입력: ")
        for i in 1...9 {
            print("\(num) * \(i) = \(i * num)")
        }
    }
    
    // MARK: - for 예제 5
    /*
     구구단 1단~9단까지 출력하세요
     ===1단===
     1 * 1 = 1
     1 * 2 = 2
     1 * 3 = 3
     1 * 4 = 4
     1 * 5 = 5
     1 * 6 = 6
     1 * 7 = 7
     1 * 8 = 8
     1 * 9 = 9
     ...
     */
    func forExercise05() {
        let myRange = (1...9)
        for i in myRange {
            let titleText = "===\(i)단==="
            print(i > 1 ? "\n" + titleText : titleText)
            for j in myRange {
                print("\(i) * \(j) = \(i * j)")
            }
        }
    }
    
    // MARK: - for 예제 6
    /*
     구구단 1단~9단까지 출력하세요
     1단: 1 * 1 =  1    1 * 2 =  2    1 * 3 =  3    1 * 4 =  4    1 * 5 =  5    1 * 6 =  6    1 * 7 =  7    1 * 8 =  8    1 * 9 =  9
     2단: 2 * 1 =  2    2 * 2 =  4    2 * 3 =  6    2 * 4 =  8    2 * 5 = 10    2 * 6 = 12    2 * 7 = 14    2 * 8 = 16    2 * 9 = 18
     3단: 3 * 1 =  3    3 * 2 =  6    3 * 3 =  9    3 * 4 = 12    3 * 5 = 15    3 * 6 = 18    3 * 7 = 21    3 * 8 = 24    3 * 9 = 27
     4단: 4 * 1 =  4    4 * 2 =  8    4 * 3 = 12    4 * 4 = 16    4 * 5 = 20    4 * 6 = 24    4 * 7 = 28    4 * 8 = 32    4 * 9 = 36
     5단: 5 * 1 =  5    5 * 2 = 10    5 * 3 = 15    5 * 4 = 20    5 * 5 = 25    5 * 6 = 30    5 * 7 = 35    5 * 8 = 40    5 * 9 = 45
     6단: 6 * 1 =  6    6 * 2 = 12    6 * 3 = 18    6 * 4 = 24    6 * 5 = 30    6 * 6 = 36    6 * 7 = 42    6 * 8 = 48    6 * 9 = 54
     7단: 7 * 1 =  7    7 * 2 = 14    7 * 3 = 21    7 * 4 = 28    7 * 5 = 35    7 * 6 = 42    7 * 7 = 49    7 * 8 = 56    7 * 9 = 63
     8단: 8 * 1 =  8    8 * 2 = 16    8 * 3 = 24    8 * 4 = 32    8 * 5 = 40    8 * 6 = 48    8 * 7 = 56    8 * 8 = 64    8 * 9 = 72
     9단: 9 * 1 =  9    9 * 2 = 18    9 * 3 = 27    9 * 4 = 36    9 * 5 = 45    9 * 6 = 54    9 * 7 = 63    9 * 8 = 72    9 * 9 = 81
     */
    func forExercise06() {
        let myRange = (1...9)
        for i in myRange {
            print("\(i)단: ", terminator: "")
            for j in myRange {
                let answer = String(format: "%2d", (i * j))
                print("\(i) * \(j) = \(answer)", terminator: "   ")
            }
            print("")
        }
    }
    
    // MARK: - for 예제 7
    /*
     입력 받은 정수의 약수를 구하세요
     정수입력: 32
     32의 약수: 1 2 4 8 16 32
     */
    func forExercise07() {
        let inputNum = getIntTypeInputValue(message: "정수입력: ")
        let divisorArr = getDivisors(inputNum)

        print("32의 약수: ", terminator: "")
        divisorArr.forEach { print($0, terminator: " ") }
    }
    
    // MARK: - for 예제 8
    /*
     2~30까지의 약수를 구하세요

     2의 약수: 1 2
     3의 약수: 1 3
     ...
     29의 약수: 1 29
     30의 약수: 1 2 3 5 6 10 15 30
     */
    func forExercise08() {
        for num in 2...30 {
            let divisorArr = getDivisors(num)
            print("\(num)의 약수: ", terminator: "")
            divisorArr.forEach { print($0, terminator: " ") }
            print("")
        }
    }
    
    // MARK: - for 예제 9
    /*
     다음과 같은 별 모양으로 출력하세요
     */
    func forExercise09() {
//         *
//         **
//         ***
//         ****
//         *****
        var text1 = ""
        for _ in 1...5 {
            text1 += "*"
            print(text1)
        }
//         *****
//         ****
//         ***
//         **
//         *
        var text2 = "*****"
        for _ in 1...5 {
            text2.removeFirst()
            print(text2)
        }
//         *
//        **
//       ***
//      ****
//     *****
        /// ver 1
        var text3_1 = "     "
        for _ in 1...5 {
            text3_1.removeFirst()
            text3_1 += "*"
            print(text3_1)
        }
        /// ver 2
        var text3_2 = ""
        for i in 1...5 {
            text3_2 += "*"
            let paddingCount = 5 - i
            let padding = String(repeating: " ", count: paddingCount)
            let result = padding + text3_2
            print(result)
        }
//         **
//        ****
//       ******
//      ********
//     **********
//     **********
//      ********
//       ******
//        ****
//         **
        var left = "     "
        var right = "     "
        for i in 1...10 {
            if i <= 5 {
                left.removeFirst()
                left += "*"
                right.removeLast()
                right = "*" + right
            } else if i > 6 {
                left.removeLast()
                left = " " + left
                right.removeFirst()
                right += " "
            }
            print("\(left + right)")
        }
        
    }
    
    // MARK: - for 예제 10
    /*
     369게임 0부터 99까지

     00
     01
     02
     03*
     ...
     97*
     98*
     99**
     */
    func forExercise10() {
        for num in 0...99 {
            var strNum = String(format: "%02d", num)
            var tmp = ""
            for s in strNum {
                if let intS = Int(String(s)), intS != 0, intS % 3 == 0 {
                    tmp += "*"
                }
            }
            strNum += tmp
            tmp = ""
            print(strNum)
        }
    }
    
}
