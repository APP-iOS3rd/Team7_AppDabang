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

    // MARK: - 조건문 예제 07
    /*
     다음은 디즈니랜드 입장료 계산 프로그램입니다.
     기본료는 5000원이며 인원수에 따라 지불해야하는 프로그램을 만들어보세요.
     단, 미성년자인 경우 50%할인이 적용됩니다!
     
     ==== 디즈니랜드에 오신 걸 환영합니다! ====
     나이를 말씀해주세요
     15
     인원수를 말씀해주세요
     5
     총 12500원 입니다.
     */
    func exercise07() {
        
        func isAdult(_ age: Int) -> Bool {
            return age > 19
        }
        
        let defaulfFee = 5_000
        let minorFee = defaulfFee / 2
        var totalFee = 0
        
        print("==== 디즈니랜드에 오신 걸 환영합니다! ====")
        print("나이를 말씀해주세요.")
        let age = getIntTypeInputValue()
        print("인원수를 말씀해주세요.")
        let numberOfPeople = getIntTypeInputValue()
        
        if isAdult(age) {
            totalFee = numberOfPeople * defaulfFee
        } else {
            totalFee = numberOfPeople * minorFee
        }
        print("총 \(totalFee)원 입니다.")
        
    }
    
    
    // MARK: - 조건문 예제 08
    /*
     마트 계산대 프로그램입니다.
     10000원짜리 추석선물셋트를 구입했을 때 지불해야하는 금액을 계산해 보세요.
     단, 11개 이상 구매시에는 10%할인이 됩니다!
     
     구매하려는 상품 갯수를 입력하세요
     9
     가격은 90000 원 입니다.
     
     구매하려는 상품 갯수를 입력하세요
     12
     가격은 108000 원 입니다.
     */
    func exercise08() {
        let giftPrice = 10_000
        var total = 0
        
        print("구매하려는 상품 갯수를 입력하세요.")
        let num = getIntTypeInputValue()
        total = giftPrice * num
        
        if num >= 11 {
            total = Int(Double(total) * 0.9)
        }
        print("가격은 \(total) 원 입니다.")
    }
    
    // MARK: - 조건문 예제 09
    /*
     Int 타입의 변수 grade 를 선언하고 키보드로 값을 입력받으세요.
     Grade가
     90이상이면 “A학점입니다.”,
     80점 이상 90점 미만일 경우 “B학점입니다.”
     70점이상 80점 미만일 경우 “C학점입니다.” 를 출력하세요.
     */
    func exercise09() {
        print("점수를 입력해주세요: ", terminator: "")
        let grade = getIntTypeInputValue()
        
        switch grade {
        case 90...Int.max:
            print("A학점입니다.")
        case 80..<90:
            print("B학점입니다.")
        case 70..<80:
            print("C학점입니다.")
        default:
            print("F...🥲")
        }
    }
    
    // MARK: - 조건문 예제 10
    /*
     String 타입의 변수 data 를 선언하고 키보드로 값을 입력 받으세요.
     switch ~ case 문을 사용하여,
     data가 “안녕하세요.” 일 때,“네, 안녕하세요!” 출력,
     data 가 “반가워요.” 일 때, “네, 반가워요!” 출력,
     data가 “수고하세요.” 일 때, “네, 수고하세요!” 출력,
     그 외 다른 문장일 때는 “잘못 입력하셨습니다.” 라고 출력하는 프로그램을 작성하세요.
     
     user: 안녕하세요.
     mac: 네, 안녕하세요!
     
     user: 반가워요.
     mac: 네, 반가워요!
     
     user: 수고하세요.
     mac: 네, 수고하세요.
     
     user: 뭐야
     잘못 입력하셨습니다.
     */
    private func getInputValue() -> String {
        guard let input = readLine() else {
            print("입력 값 오류 - 올바른 값을 입력하세요. [ Ex) 안녕하세요 반가워요 수고하세요 ]")
            return getInputValue()
        }
        return input
    }
    
    func exercise10() {
        print("user: ", terminator: "")
        let inputData = getInputValue()
        
        print(inputData)
        
        switch inputData {
        case "안녕하세요", "반가워요":
            print("mac: 네, \(inputData)!")
        case "수고하세요":
            print("mac: 네, \(inputData).")
        default:
            print("잘못 입력하셨습니다.")
        }
    }
    
    // MARK: - 조건문 예제 12
    /*
     조건문 예제 12
     월을 입력받아 봄, 여름, 가을, 겨울 중 맞는 계절을 알려주는 프로그램을 만드세요.

     12, 1, 2월 → 겨울
     3, 4, 5월 → 봄
     6, 7, 8월 → 여름
     9, 10, 11월 →가을
     월 입력: 1
     1월은 겨울입니다!
     월 입력: 5
     5월은 봄입니다!
     월 입력: 7
     7월은 여름입니다!
     월 입력: 9
     9월은 가을입니다!
     */
    func exercise12() {
        print("월 입력: ", terminator: "")
        let month = getIntTypeInputValue()
        var season = ""
        switch month {
        case 12, 1, 2:
            season = "겨울"
        case 3, 4, 5:
            season = "봄"
        case 6, 7, 8:
            season = "여름"
        case 9, 10, 11:
            season = "가을"
        default:
            print("잘못된 입력입니다!")
            return
        }
        print("\(month)월은 \(season)입니다!")
    }
 
    // MARK: - 조건문 13 ~ 16 공통 자판기 함수
    private func vendingMachineSimulator() -> (Bool, Int, Int) {
        print("금액을 입력하세요.")
        let money = getIntTypeInputValue()
        print("1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원) : ", terminator: "")
        let pickNum = getIntTypeInputValue()
        
        var price = 0
        switch pickNum {
        case 1:
            price = 800
        case 2:
            price = 500
        case 3:
            price = 1500
        default:
            return (false, money, price)
        }
        return (true, money, price)
    }
    
    // MARK: - 조건문 예제 13
    /*
     조건문 예제 13
     자판기 프로그램을 만들어 봅시다.

     금액을 입력하고 메뉴를 고른 뒤 잔돈을 출력해 보세요!

     금액을 입력하세요.
     2500
     메뉴를 고르세요
     1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원) : 1
     잔돈: 1700원
     */
    func exercise13() {
        let (isWork, money, price) = vendingMachineSimulator()
        guard isWork else {
            print("잘못된 입력입니다.")
            return
        }
        let remainder = money - price
        print("잔돈: \(remainder)원")
    }
    
    // MARK: - 조건문 예제 14
    /*
    입력한 금액이 선택한 메뉴의 가격보다 부족하면
    돈이 부족하다는 문장을 출력하세요!

    금액을 입력하세요.
    800
    메뉴를 고르세요
    1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원) : 3
    돈이 부족해요ㅠㅠ
    잔돈: 800원
    */
    func exercise14() {
        var (isWork, money, price) = vendingMachineSimulator()
        guard isWork else {
            print("잘못된 입력입니다.")
            return
        }
        
        if money >= price {
            money -= price
        } else {
            print("돈이 부족해요ㅠㅠ")
        }
        print("잔돈: \(money)원")
    }
    
    // MARK: - 조건문 예제 15
    /*
    잔돈을 줄 때 천원을 몇 개 줘야 하는지 계산해 보세요!

    금액을 입력하세요.
    8500
    메뉴를 고르세요
    1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원) : 1
    잔돈: 7700원
    천원: 7개
    */
    func exercise15() {
        var (isWork, money, price) = vendingMachineSimulator()
        guard isWork else {
            print("잘못된 입력입니다.")
            return
        }
        
        if money >= price {
            money -= price
        } else {
            print("돈이 부족해요ㅠㅠ")
        }
        print("잔돈: \(money)원")
        print("천원: \(money / 1000)개")
    }
    
    // MARK: - 조건문 예제 16
    /*
    잔돈을 줄 때 천원, 오백원, 백원짜리를 몇 개 줘야하는지 계산해 보세요!

    금액을 입력하세요.
    8500
    메뉴를 고르세요
    1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원) : 1
    잔돈: 7700원
    천원: 7개, 오백원: 1개, 백원: 2개
    */
    func exercise16() {
        
        func getChange(_ money: Int) -> (Int, Int, Int) {
            let t = money / 1000
            let f = (money % 1000) / 500
            let h = ((money % 1000) % 500) / 100
            return (t, f, h)
        }
        
        var (isWork, money, price) = vendingMachineSimulator()
        guard isWork else {
            print("잘못된 입력입니다.")
            return
        }
        
        if money >= price {
            money -= price
        } else {
            print("돈이 부족해요ㅠㅠ")
        }
        
        let (thousand, fiveHundred, hundred) = getChange(money)
        let resultText = """
                        잔돈: \(money)원
                        천원: \(thousand)개
                        오백원: \(fiveHundred)개
                        백원: \(hundred)개
                        """
        print(resultText)
    }
    
}
