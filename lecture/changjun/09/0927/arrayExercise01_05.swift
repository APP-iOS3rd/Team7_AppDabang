//
//  arrayExercise01_05.swift
//  prac2
//
//  Created by phang on 2023/09/27.
//

import Foundation

// MARK: - array 예제 01 ~ 05

class ArrayExercise01_05 {
    private var arr = [Int]()
    private var randomIntRange: ClosedRange<Int> = 1...20
    
    init(arrCount: Int) {
        var initialArr = [Int]()
        initialArr = Array(repeating: 0, count: arrCount)
        for i in 0..<initialArr.count {
            initialArr[i] = Int.random(in: randomIntRange)
        }
        self.arr = initialArr
    }
    
    func arrayExercise01() {
        print(self.arr)
        print(self.arr[4] + self.arr[9])
        let arrSum = self.arr.reduce(0, + )
        print(arrSum)
        let arrAvg = arrSum / self.arr.count
        print(arrAvg)
     }
    
    func arrayExercise02() -> String {
        let evenNumArr = self.arr.filter{ $0 % 2 == 0 }
        return "array에 들어있는 홀수는 \(evenNumArr) 이며, 총 \(evenNumArr.count)개 입니다."
    }
    
    func arrayExercise03() -> String {
        let oddNumArr = self.arr.filter{ $0 % 2 == 1 }
        return "array에 들어있는 홀수는 \(oddNumArr) 이며, 총 \(oddNumArr.count)개 입니다."
    }
    
    func arrayExercise04() -> String {
        let maxNum = self.arr.max()!
        return "가장 큰 값은 \(maxNum) 입니다."
    }

    func arrayExercise05() -> String {
        let minNum = self.arr.min()!
        return "가장 작은 값은 \(minNum) 입니다."
    }
    
}
