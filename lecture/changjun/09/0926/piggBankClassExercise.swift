//
//  piggBankClassExercise.swift
//  prac2
//
//  Created by phang on 2023/09/26.
//

import Foundation

class PiggBank {
    private var money: Int
    private let size: Int
    
    init(money: Int, size: Int) {
        self.money = money
        self.size = size
    }
    
    func deposit(_ money: Int) {
        if self.money + money <= size {
            self.money += money
        } else {
            print("더 이상 돈을 입금 할 수 없습니다.")
        }
    }
    
    func withdraw(_ money: Int) {
        if self.money >= money {
            self.money -= money
        } else {
            print("잔액이 부족합니다.")
        }
    }
    
    func show() {
        let formattedMoney = getFormatted(money)
        print("현재 잔액은 \(formattedMoney)원 입니다.")
    }
    
}

extension PiggBank {
    
    private func getFormatted(_ money: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: money))!
    }
    
}
