//
//  main.swift
//  07
//
//  Created by lkh on 2023/10/05.
//

import Foundation

// MARK: - input 관련
func inputLineInt(_ msg: String) -> Int {
    print(msg, terminator: " ")
    return Int(readLine()!)!
}

func inputLineArrayInt(_ msg: String) -> [Int] {
    print(msg, terminator: " ")
    return readLine()!.split(separator: " ").map { Int(String($0))! }
}

func inputLineString(_ msg: String) -> String {
    print(msg, terminator: " ")
    return readLine()!
}

// MARK: - 버블 정렬
/* 버블 정렬(bubble sort)은 배열의 인접한 두 원소를 비교하면서 정렬하는 알고리즘이다.

시간 복잡도는 O(n^2)이다.

1. 배열을 복사해서 새로운 배열을 만든다.
2. 배열의 크기를 n이라고...
3. n-1번 반복한다
4. i번째부터 n-1번째까지의 원소들을 순회
5. j번째 원소가 j+1번째 원소보다 크면 서로 교환
6.  정렬된 배열을 반환한다.
*/

func bubbleSort(_ arr:[Int]) -> [Int] {
    var sortedArr = arr; // 1
    let size = arr.count // 2
    
    for i in stride(from: size-1, through:0, by: -1) { // 3, 4
        for j in 0..<i {
            if sortedArr[j] > sortedArr[j+1] { // 5
                let tmp = sortedArr[j];
                sortedArr[j] = sortedArr[j+1]
                sortedArr[j+1] = tmp;
            }
        }
    }
    
    return sortedArr; // 6
}

//print(bubbleSort([0, 1, 2, 3, 4, 5]))

// MARK: - 선택 정렬
func selectionSort(_ arr: [Int]) -> [Int] {
    var sortedArr = arr
    let size = arr.count
    
    for i in 0..<size {
        var minIndex = i;
        for j in i+1..<size {
            if sortedArr[minIndex] > sortedArr[j] {
                minIndex = j
            }
        }
        
        let tmp = sortedArr[i]
        sortedArr[i] = sortedArr[minIndex]
        sortedArr[minIndex] = tmp
    }
    
    return sortedArr;
}

// MARK: - 정렬 예제 1
// 가장 많이 들은 것부터 가장 적게 들은 것 순서로 정렬하여 가장 좋아하는 곡 순위를 알고 싶다면?
//  곡명    가수    연주 횟수
//  롤린 (Rollin')    브레이브걸스    156
//  Celebrity    아이유    141
//  On The Ground    로제 (ROSÉ)    35
//  LOVE DAY (2021)    양요섭, 정은지    94
//  밤하늘의 별을(2020)    경서    88
//  Gone    로제 (ROSÉ)    61
//  Dynamite    방탄소년단    111


func one(_ playList : [[String]]) -> [[String]] {
    var sortedArr: [[String]] = playList
    
    // 입력은 [["롤린", "브레브걸스", "156"], ["Celebrity", "아이유", "131"]] 이런식으로 생각
    // 선택정렬 이용
    let size = playList.count
    
    for i in 0..<size {
        var minIndex = i;
        for j in i+1..<size {
            if Int(sortedArr[minIndex][2])! > Int(sortedArr[j][2])! {
                minIndex = j
            }
        }
        
        let tmp = sortedArr[i]
        sortedArr[i] = sortedArr[minIndex]
        sortedArr[minIndex] = tmp
    }
    
    return sortedArr;
}

struct MusicInfo {
    let name: String;
    let artist: String;
    let playCount: Int
    
    init(name: String, artist: String, playCount: Int) {
        self.name = name
        self.artist = artist
        self.playCount = playCount
    }
}

func one2(_ playList: [MusicInfo]) -> [MusicInfo] {
    var sortedArr: [MusicInfo] = playList
    
    let size = playList.count
    
    for i in 0..<size {
        var minIndex = i;
        for j in i+1..<size {
            if sortedArr[minIndex].playCount > sortedArr[j].playCount {
                minIndex = j
            }
        }
        
        let tmp = sortedArr[i]
        sortedArr[i] = sortedArr[minIndex]
        sortedArr[minIndex] = tmp
    }
    
    return sortedArr;
}
print("정렬 예제 1")

print(one([["롤린 (Rollin')","브브걸", "156"],["Celebrity", "아이유", "141"],
            ["On The Ground","로제 (ROSÉ)", "35"],["LOVE DAY (2021)", "양요서, 은지", "94"],
            ["밤하늘의 별을(2020)","경서", "88"],["Gone", "로제 (ROSÉ)", "61"],
            ["Dynamite","방탄소년단", "111"]]))
print("===============================")

// MARK: - 카운드다운
func countDown(_ i: Int) {
    print(i)
    if i > 0 {
        countDown(i-1)
    }
    return
}

//countDown(5)

// MARK: - 팩토리얼
func Factorial(_ i : Int) -> Int {
    if i == 1 {
        return 1;
    }
    return i*Factorial(i-1)
    
//    var ret = 1
//    for n in 1...i {
//        ret *= n
//    }
}


//print(Factorial(5))

// MARK: - 재귀함수 예제 1
// 리스트에 포함된 원소의 숫자를 세는 재귀 함수를 작성

// count([1,2,3,4,5])

func count(_ arr: [Int]) -> Int {
    if arr.isEmpty {
        return 0
    }
    var arr = arr
    arr.removeFirst()
    return 1 + count(arr)
}
print("재귀함수 예제 1")

print("count([1,2,3,4,5]):", count([1,2,3,4,5]))
print("===============================")


// MARK: - 재귀함수 예제 2
//리스트에서 가장 큰 수를 검색
//
//max([1,2,6,9,10,3,4])

func max(_ arr: [Int]) -> Int {
    if arr.count == 1 {
        return arr.first! // 없는 경우
    }
    var arr = arr
    let fir = arr.removeFirst()
    return fir > max(arr) ? fir : max(arr)
}

print("재귀함수 예제 2")
print("max([1,2,6,9,10,3,4]):",max([1,2,6,9,10,3,4]))
print("===============================")


// MARK: - 재귀함수 예제 3
//피보나치 수열
//
//1) 일반 함수 구현
//
//2) 재귀 함수 구현

func commonFibo(_ number: Int) -> Int{
    var f: [Int] = Array(repeating: 0, count: number+1)
    f[1] = 1
    f[2] = 1
    
    for i in 3...number {
        f[i] = f[i-1]+f[i-2]
    }
    return f[number]
}

func recurFibo(_ number: Int) -> Int {
    if number == 1 || number == 2 {
        return 1;
    }
    return recurFibo(number-1)+recurFibo(number-2)
}

print("재귀함수 예제 3")
print("commonFibo(3):", commonFibo(3))
print("commonFibo(5):",commonFibo(5))

print("===============================")

// MARK: - 재귀함수 예제 4 (선택)
// 가로 1680m x 세로 640m 인 사각형을 똑같은 크기의 가장 큰 정사각형으로 나눌려고 한다. 정사각형의 크기는?
// 재귀적 알고리즘을 사용하기 위한 분할 정복 기법 2단계 (기본단계, 재귀단계)
//
//1.가장 간단한 경우의 기본 단계를 찾는다
//2.주어진 문제를 작게 줄여서 기본 단계가 되도록 만드는 법을 찾는다

func divideSquare(x: Int, y: Int) -> Int {
    if x == y {
        return x*y
    } else if x > y {
        return divideSquare(x: x/2, y: y)
    } else {
        return divideSquare(x: x, y: y/2)
    }
    
//    var x = x
//    var y = y
//    while true {
//        if x == y {
//            return x*y;
//        } else if x > y {
//            x /= 2
//        } else {
//            y /= 2
//        }
//    }
}
print("재귀함수 예제 4")
print("divideSquare(x: 1680, y: 640):", divideSquare(x: 1680, y: 640) ) // 정수(정사각형의 한변의 길이 값)
print("===============================")
