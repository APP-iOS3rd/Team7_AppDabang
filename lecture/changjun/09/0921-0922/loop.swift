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
        
}
