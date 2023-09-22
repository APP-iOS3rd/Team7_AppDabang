//
//  calculation.swift
//  prac2
//
//  Created by phang on 2023/09/21.
//

import Foundation

struct Calculation {
    
    // MARK: - 연산자 예제 5
    /*
     Swift, iOS, Web 점수를 키보드로부터 입력 받아 합계와 평균을 출력하세요

     Swift 점수입력: 90
     iOS 점수입력: 95
     Web 점수입력: 100
     합계: 285
     평균: 95
     */
    func exercise05() {
        let subjects: Array<String> = ["Swift", "iOS", "Web"]
        var total: Int = 0

        for idx in 0..<subjects.count {
            print("\(subjects[idx]) 점수입력: ", terminator: "")
            let input = Int(readLine()!)!
            total += input
        }

        let avg: Int = total / subjects.count

        print("합계: \(total)")
        print("평균: \(avg)")
    }

    // MARK: -  연산자 예제 6
    /*
     초를 입력 받아 [시, 분, 초] 형태로 출력하세요.

     초 입력: 3723
     1 시 2 분 3 초
     */

    func exercise06() {
        func getHMS(seconds: Int) -> (Int, Int, Int) {
            let h = (seconds / 60) / 60
            let m = (seconds / 60) % 60
            let s = seconds % 60
            return (h, m, s)
        }

        print("초 입력: ", terminator: "")
        let input = Int(readLine()!)!
        let (h, m, s) = getHMS(seconds: input)
        print("\(h)시 \(m)분 \(s)초")
    }

    // MARK: -  연산자 예제 7
    /*
     시급계산기 입니다. 기본시급은 5,000원이고, 8시간이 넘을 경우 초과된 시간은 시급의 1.5배를 책정해줍니다. (하루 13시간 이하 근무)

     노동 시간 입력: 11
     총 임금은 62,500 원 입니다.
     */
    
    func exercise07() {
        func getTotalWage(workTime: Int) -> Int {
            let defaultWage = 5000
            let overTimeWage = Int(Double(defaultWage) * 1.5)
            if workTime > 8 {
                let overTime = workTime - 8
                return (overTimeWage * overTime) + (defaultWage * 8)
            } else {
                return workTime * defaultWage
            }
        }
        
        print("노동 시간 입력: ", terminator: "")
        let input = Int(readLine()!)!
        
        let totalWage = getTotalWage(workTime: input)
        print("총 임금은 \(totalWage) 원 입니다.")
    }

    // MARK: -  연산자 예제 8
    /*
     정수를 입력받아 홀수인지 짝수인지 판별하세요.(삼항연산자 이용)

     정수를 입력하세요: 35
     35는(은) 홀수입니다.

     정수를 입력하세요: 24
     35는(은) 짝수입니다.
     0과 -는? 어떻게 처리할까
     오버플로우 또는 언더플로우가 발생하면 어떻게 처리할까?
     */

    func exercise08() {
        print("정수를 입력하세요: ", terminator: "")
        guard let input = Int(readLine()!) else {
            print("입력이 올바르지 않습니다.")
            fatalError("프로그램 종료")
        }
        if input == 0 {
            print("0은 홀수일까요 짝수일까요..?")
        } else {
            let result = input % 2 == 1 ? "\(input)는(은) 홀수입니다." : "\(input)는(은) 짝수입니다."
            print(result)
        }
    }

    // MARK: -  연산자 예제 9
    /*
     두 개의 정수를 입력 받아 큰 수에서 작은 수를 뺀 결과값을 출력하세요. .(삼항연산자 이용)

     첫 번째 정수 입력: 10
     두 번째 정수 입력: 45
     두 수의 차: 35

     첫 번째 정수 입력: 87
     두 번째 정수 입력: 23
     두 수의 차: 64
     */
    func exercise09() {
        print("첫 번째 정수 입력: ", terminator: "")
        let inputA = Int(readLine()!)!
        print("두 번째 정수 입력: ", terminator: "")
        let inputB = Int(readLine()!)!
        
        let result = inputA >= inputB ? (inputA - inputB) : (inputB - inputA)
        print("두 수의 차: \(result)")
    }

    // MARK: -  연산자 예제 10
    /*
     농구공을 담기 위해 필요한 상자의 개수를 구하세요.
     상자 하나에는 농구공이 5개 들어갈 수 있습니다. 만일 농구공이 ‘23’개라면 필요한 상자의 개수는 ‘5’개입니다.

     농구공의 개수를 입력하세요: 33
     필요한 상자의 수: 7

     농구공의 개수를 입력하세요: 20
     필요한 상자의 수: 4
     */
    func exercise10() {
        print("농구공의 개수를 입력하세요: ", terminator: "")
        let input = Int(readLine()!)!
        var (box, remainder) = input.quotientAndRemainder(dividingBy: 5)
        if remainder > 0 {
            box += 1
        }
        print("필요한 상자의 수: \(box)")
    }
}
