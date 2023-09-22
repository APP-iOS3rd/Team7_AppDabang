import Foundation

// 0922
//print("월 입력: ", terminator: "")
//var month = Int(readLine()!)!
//
//if month == 12 || month == 1 || month == 2 {
//    print("\(month)월은 겨울입니다!")
//}else if month == 3 || month == 4 || month == 5 {
//    print("\(month)월은 봄입니다!")
//}else if month == 6 || month == 7 || month == 8 {
//    print("\(month)월은 여름입니다!")
//}else {
//    print("\(month)월은 가을입니다!")
//}

// switch
//print("월 입력 :  ", terminator: "")
//let month: Int = Int(readLine()!)!
//
//switch month {
//case 12,1,2 :
//    print("\(month)월은 겨울입니다!")
//case 3,4,5 :
//    print("\(month)월은 봄입니다!")
//case 6,7,8 :
//    print("\(month)월은 여름입니다!")
//case 9,10,11 :
//    print("\(month)월은 가을입니다!")
//default :
//    break
//    
//}

// 자판기 프로그램
//print("금액을 입력하세요. ",terminator: "")
//var money = Int(readLine()!)!
//print("메뉴를 고르세요 1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원): ", terminator: "")
//var menu = Int(readLine()!)!
//if menu == 1 {
//    print("잔돈: ", money - 800)
//}else if menu == 2 {
//    print("잔돈: ", money - 500)
//}else{
//    print("잔돈: ", money - 1500)
//}

// 입력한 금액이 선택한 메뉴의 가격보다 부족하면 돈이 부족하는 문장
//print("금액을 입력하세요. ",terminator: "")
//var money = Int(readLine()!)!
//print("메뉴를 고르세요")
//print("1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원): ", terminator: "")
//var menu = Int(readLine()!)!
//if menu == 1 {
//    if money < 800 {
//        print("돈이 부족해요ㅠㅠ")
//        print("잔돈: \(money)")
//    }
//}else if menu == 2 {
//    if money < 500 {
//        print("돈이 부족해요ㅠㅠ")
//        print("잔돈: \(money)")
//    }
//}else{
//    if money < 1500 {
//        print("돈이 부족해요ㅠㅠ")
//        print("잔돈: \(money)")
//    }
//}

// 잔돈을 줄 때 천원을 몇개 줘야하는 지 계산
//print("금액을 입력하세요. ",terminator: "")
//var money = Int(readLine()!)!
//print("메뉴를 고르세요")
//print("1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원): ", terminator: "")
//var menu = Int(readLine()!)!
//var col = money - 800
//var seng = money - 500
//var vita = money - 1500
//if menu == 1 {
//    if col >= 1000 {
//        let cheon = col/1000
//        print("잔돈: \(col)원")
//        print("천원: \(cheon)개")
//    }
//}else if menu == 2 {
//    if seng >= 1000 {
//        let cheon = seng/1000
//        print("잔돈: \(seng)원")
//        print("천원: \(cheon)개")
//    }
//}else{
//    if vita >= 1000 {
//        let cheon = vita/1000
//        print("잔돈: \(vita)원")
//        print("천원: \(cheon)개")
//    }
//}

//
//print("금액을 입력하세요. ",terminator: "")
//var money = Int(readLine()!)!
//print("메뉴를 고르세요")
//print("1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원): ", terminator: "")
//var menu = Int(readLine()!)!
//var gab = 0;
//
//if menu == 1 {
//    gab = 800
//} else if menu == 2 {
//    gab = 500
//} else if menu == 3 {
//    gab = 1500
//}
//
//if gab > money {
//    print("돈이 부족해요 ㅠㅠ")
//} else {
//    money -= gab
//}
//
//print("잔돈: \(money)원")
//let cheon = (money - (money%1000)) / 1000
//let oh = (money%1000) / 500
//let back = ((money%1000) - 500) / 100
//print("천원: \(cheon)개, 오백원: \(oh)개, 백원: \(back)개")

// 키보드로부터 입력 받은 수가 10보다 작을 떄만 계속 정수를 입력받기
//var number = 0;
//
//while number < 10 {
//    print("정수 입력:", terminator: "")
//    number = Int(readLine()!)!
//}
//
//print("종료되었습니다.")

// 다이어트 관리 프로그램
//print("현재 몸무게: ", terminator: "")
//var hyun = Int(readLine()!)!
//print("목표 몸무게: ", terminator: "")
//var mok = Int(readLine()!)!
//
//var week = 0
//
//while hyun > mok {
//    week += 1
//    print("\(week)주차 감량 몸무게: ", terminator: "")
//    var weight = Int(readLine()!)!
//    
//    hyun -= weight
//
//    if hyun <= mok {
//        break
//    }
//}
//print("\(hyun)kg 달성! 축하합니다!!")
