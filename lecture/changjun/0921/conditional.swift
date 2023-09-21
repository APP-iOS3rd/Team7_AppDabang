//
//  conditional.swift
//  prac2
//
//  Created by phang on 2023/09/21.
//

import Foundation

struct Conditional {
    
    // MARK: - [ 정수 입력문 함수 ]
    private func getIntTypeInputValue() -> Int {
        guard let input = readLine(), let intNum = Int(input) else {
            print("입력 값 오류 - 정수를 입력하세요.")
            return getIntTypeInputValue()
        }
        return intNum
    }

    // MARK: - 조건문 예제 01
    /*
     Int 타입의 변수 age를 선언하고 키보드로 값을 입력받으세요.
     만약 age가 20보다 크거나 같다면 “성인입니다.” 라고
     출력하는 프로그램을 만들어 보세요.
     */
    func exercise01() {
        let age = getIntTypeInputValue()
        if age >= 20 {
            print("성인입니다.")
        }
    }
    
    // MARK: - 조건문 예제 02
    /*
     변수 num를 선언하고 키보드로 값을 입력받으세요.
     만약 num이 3의 배수이면서 5의 배수라면 “3과 5의 배수입니다”라고 출력하는
     프로그램을 만들어보세요.
     */
    func exercise02() {
        func isMultiple3And5(_ num: Int) -> Bool {
            return num % 3 == 0 && num % 5 == 0
        }
        
        print("num 입력: ", terminator: "")
        let num = getIntTypeInputValue()
        if isMultiple3And5(num) {
            print("3과 5의 배수입니다")
        }
    }

    // MARK: - 조건문 예제 03
    /*
     Int 타입의 변수 grade 를 선언하고 키보드로 값을 입력받으세요.

     만약 grade 가 60점이상이면 “합격입니다.” grade 가 60점 미만이면 “불합격입니다.” 를 출력하는 프로그램을 작성해보세요.
     */
    func exercise03() {
        print("grade 입력: ", terminator: "")
        let grade = getIntTypeInputValue()
        if grade >= 60 {
            print("합격입니다.")
        } else {
            print("불합격입니다.")
        }
    }

    // MARK: - 조건문 예제 04
    /*
     정수를 입력 받아 양수, 음수, 0을 판별하여 다음과 같이 출력하세요.

     정수입력: 5
     5 양수입니다.

     정수입력: -7
     -7 음수입니다.

     정수입력: 0
     0입니다.
     */
    func exercise04() {
        print("정수 입력: ", terminator: "")
        let intNum = getIntTypeInputValue()
        switch intNum {
        case 0:
            print("0 입니다.")
        case 1...Int.max:
            print("\(intNum) 양수입니다.")
        default:
            print("\(intNum) 음수입니다.")
        }
    }

    // MARK: - 조건문 예제 05
    /*
     Int 타입의 변수 num1, num2를 선언하고 키보드로 값을 입력받으세요.

     입력받은 num1과 num2 중 큰 수를 출력하는 프로그램을 만들어보세요.
     */
    func exercise05() {
        print("num1 입력: ", terminator: "")
        let num1 = getIntTypeInputValue()
        print("num2 입력: ", terminator: "")
        let num2 = getIntTypeInputValue()
        if num1 > num2 {
            print(num1)
        } else if num1 < num2 {
            print(num2)
        } else {
            print("\(num1) num1 과 num2 가 같음.")
        }
    }

    // MARK: - 조건문 예제 06
    /*
     정보처리기사의 각 과목의 정답개수를 Int형 타입의 변수 5개를 선언하고 입력받으세요.
     한 과목이라도 8개 미만인 경우, “불합격입니다!”를 출력하고 총 개수가 60개 이상이면 “합격입니다!”를 출력하는 프로그램을 만들어보세요.

     1과목 소프트웨어 설계: 8
     2과목 소프트웨어 개발: 7
     3과목 데이터베이스 구축: 8
     4과목 프로그래밍 언어 활용: 8
     5과목 정보시스템 구축관리: 8
     불합격입니다!
     1과목 소프트웨어 설계: 12
     2과목 소프트웨어 개발: 12
     3과목 데이터베이스 구축: 12
     4과목 프로그래밍 언어 활용: 12
     5과목 정보시스템 구축관리: 12
     합격입니다!
     */
    func exercise06() {
        var subjects: Dictionary<String, Int> = [
            "소프트웨어 설계": 0,
            "소프트웨어 개발": 0,
            "데이터베이스 구축": 0,
            "프로그래밍 언어 활용": 0,
            "정보시스템 구축관리": 0
        ]
        
        var idx = 1
        for (key, _) in subjects {
            print("\(idx)과목 \(key): ", terminator: "")
            subjects[key] = getIntTypeInputValue()
            idx += 1
        }
        
        if subjects.values.reduce(0, { $0 + $1 }) < 60 || subjects.values.contains(where: { $0 < 8 }) {
            print("불합격입니다!")
        } else {
            print("합격입니다!")
        }
    }

}
