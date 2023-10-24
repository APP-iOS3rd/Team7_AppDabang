/*
두 개의 세트를 입력받아, 그들의 교집합을 반환하는 함수를 작성
// 예시코드:
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]
let intersection = intersect(setA, setB)
print(intersection) // [3, 4, 5]
*/
func intersect(_ set1: Set<Int>, _ set2: Set<Int>) -> Set<Int> {
    return set1.intersection(set2)
}


/*
두 개의 세트를 입력받아, 그들의 합집합을 반환하는 함수를 작성하세요.
// 예시코드:
let setC: Set<String> = ["apple", "banana", "cherry"]
let setD: Set<String> = ["cherry", "durian", "elderberry"]
let union = unite(setC, setD)
print(union) // ["apple", "banana", "cherry", "durian", "elderberry"]
*/
func unite(_ set1: Set<String>, _ set2: Set<String>) -> Set<String> {
    return set1.union(set2)
}

/*
두 개의 세트를 입력받아, 첫 번째 세트에서 두 번째 세트의 원소들을 제외한 차집합을 반환하는 함수를 작성하세요.
// 예시코드:
let setE: Set<Double> = [1.0, 2.0, 3.0, 4.0, 5.0]
let setF: Set<Double> = [2.0, 4.0, 6.0]
let difference = subtract(setE, setF)
print(difference) // [1.0, 3.0, 5.0]
*/
func subtract(_ set1: Set<Double>, _ set2: Set<Double>) -> Set<Double> {
    return set1.subtracting(set2)
}

/*
두 개의 세트를 입력받아, 그들이 서로소인지 판별하는 함수를 작성하세요.
(서로소는 공통된 원소가 없는 것을 의미한다.)
// 예시코드:
let setG: Set<Character> = ["a", "b", "c"]
let setH: Set<Character> = ["d", "e", "f"]
let isDisjoint = disjoint(setG, setH)
print(isDisjoint) // true
*/
func disjoint(_ set1: Set<Character>, _ set2: Set<Character>) -> Bool {
    return set1.isDisjoint(with: set2)
}

/*
하나의 세트를 입력받아, 그 세트의 모든 부분집합을 배열로 반환하는 함수를 작성하세요.
// 예시코드:
let setI: Set<Int> = [1, 2, 3]
let subsets = getSubsets(setI)
print(subsets) // [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]
               // 또는 [Set([]), Set([2]), Set([1]), Set([1, 2]), Set([3]), Set([3, 2]), Set([1, 3]), Set([3, 2, 1])]
*/
func getSubsets(_ set: Set<Int>) -> [[Int]] {
    let array:[Int] = Array(set)
    var result: [[Int]] = []

    result.append([])
    for i in 0..<set.count {
        let cnt = result.count
        for j in 0..<result.count {
            result.append(result[j] + [array[i]])
        }
    }

    return result
}
// 세트의 부분집합을 구하는 함수
func getSubsets(_ set: Set<Int>) -> [[Int]] {
    let array:[Int] = Array(set)
    var result: [[Int]] = []
    let n = array.count

    print((1 << n))
    for i in 0..<(1 << n) {
        var subset = [Int]()
        for j in 0..<n {
            if i & (1 << j) != 0 {
                subset.append(array[j])
                print(i, j, i & (1 << j), array[j] )
            } else {
                print(i, j, i & (1 << j) )
            }
        }
        print()
        result.append(subset)
    }

    return result
}