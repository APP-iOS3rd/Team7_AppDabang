//
//  recursiveFunctionExercise.swift
//  prac2
//
//  Created by phang on 10/5/23.
//

import Foundation

struct RecursiveFunctionExercise {
    
    /*
     재귀함수 예제 1
     리스트에 포함된 원소의 숫자를 세는 재귀 함수를 작성
     */
    func recursiveExercise01(arr: [Int]) -> Int {
        if arr.isEmpty {
            return 0
        }
        return 1 + recursiveExercise01(arr: arr.dropLast())
    }
    
    /*
     재귀함수 예제 2
     리스트에서 가장 큰 수를 검색
     */
    func recursiveExercise02(arr: [Int], index: Int = 0, maxVal: Int = Int.min) -> Int {
        if index >= arr.count - 1 {
            return maxVal < arr[index] ? arr[index] : maxVal
        }
        return recursiveExercise02(arr: arr, index: index + 1, maxVal: maxVal < arr[index] ? arr[index] : maxVal)
    }
    
    /*
     재귀함수 예제 3
     피보나치 수열
     1) 일반 함수 구현
     2) 재귀 함수 구현
     3) 반복자
     */
    func fibonacci_1(num: Int) -> Int {
        var a = 1
        var b = 1
        if num == 1 || num == 2 {
            return 1
        }
        for _ in 1..<num {
            (a, b) = (b, a + b)
        }
        return a
    }
    
    func fibonacci_2(num: Int) -> Int {
        if num <= 1 { return num }
        
        return fibonacci_2(num: num - 1) + fibonacci_2(num: num - 2)
    }
    
    func fibonacci_3() -> AnyIterator<Int> {
        var a = 0
        var b = 1
        return AnyIterator {
            (a, b) = (b, a + b)
            return a
        }
    }
    
    /*
     재귀함수 예제 4
     가로 1680m x 세로 640m 인 사각형을 똑같은 크기의 가장 큰 정사각형으로 나눌려고 한다. 정사각형의 크기는?
     재귀적 알고리즘을 사용하기 위한 분할 정복 기법 2단계 (기본단계, 재귀단계)
     가장 간단한 경우의 기본 단계를 찾는다
     주어진 문제를 작게 줄여서 기본 단계가 되도록 만드는 법을 찾는다
     */
    func divideSquare(x: Int, y: Int) -> Int {
        if x == 0 || y == 0 {
            return x + y
        }
        if x > y {
            return divideSquare(x: (x % y), y: y)
        }
        return divideSquare(x: y, y: (y % x))
    }

}
