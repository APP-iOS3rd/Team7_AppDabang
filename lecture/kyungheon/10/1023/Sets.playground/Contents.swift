import Foundation

// MARK: - 집합 예제 1
//두 개의 세트를 입력받아, 그들의 교집합을 반환하는 함수를 작성하세요.

func intersect(_ A: Set<Int>, _ B: Set<Int>) -> Set<Int> {
    A.intersection(B)
}

// 예시코드:
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]
let intersection = intersect(setA, setB)
print(intersection) // [3, 4, 5]

// MARK: - 집합 예제 2
// 두 개의 세트를 입력받아, 그들의 합집합을 반환하는 함수를 작성하세요.

func unite(_ A: Set<String>, _ B: Set<String>) -> [String] {
    let arrSet = Array(A.union(B))
    return arrSet.sorted()
}

// 예시코드:
let setC: Set<String> = ["apple", "banana", "cherry"]
let setD: Set<String> = ["cherry", "durian", "elderberry"]
let union = unite(setC, setD)
print(union) // ["apple", "banana", "cherry", "durian", "elderberry"]

// MARK: - 집합 예제 3
// 두 개의 세트를 입력받아, 첫 번째 세트에서 두 번째 세트의 원소들을 제외한 차집합을 반환하는 함수를 작성하세요.
// 예시코드:

func subtract(_ A: Set<Double>, _ B: Set<Double>) -> Set<Double> {
    A.subtracting(B)
}
let setE: Set<Double> = [1.0, 2.0, 3.0, 4.0, 5.0]
let setF: Set<Double> = [2.0, 4.0, 6.0]
let difference = subtract(setE, setF)
print(difference) // [1.0, 3.0, 5.0]

// MARK: - 집합 예제 4
/*
 두 개의 세트를 입력받아, 그들이 서로소인지 판별하는 함수를 작성하세요.
 (서로소는 공통된 원소가 없는 것을 의미한다.)
 */

func disjoint(_ A: Set<Character>, _ B: Set<Character>) -> Bool {
    A.intersection(B).count == 0 ? true : false
}

// MARK: - 집합 예제 05
// 하나의 세트를 입력받아, 그 세트의 모든 부분집합을 배열로 반환하는 함수를 작성하세요.
func getSubsets(_ A: Set<Int>) -> [[Int]] {
    var ret: [[Int]] = [[]]
    let A = Array(A)
    
    for i in 0..<A.count {
        for j in 0..<ret.count {
            ret.append(ret[j]+[A[i]])
        }
    }
    
    for i in 0..<ret.count {
        ret[i].sort()
    }
    
    return ret.sorted(by: { $0.count < $1.count })
}

let setI: Set<Int> = [1, 2, 3]
let subsets = getSubsets(setI)
print(subsets) // [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]
