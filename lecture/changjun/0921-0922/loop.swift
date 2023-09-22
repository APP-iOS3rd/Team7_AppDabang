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
    
}
