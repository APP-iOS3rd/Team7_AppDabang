import Foundation

// MARK: - 동시성 예제 1
/*
 async let을 사용하여 두 개의 비동기 작업을 동시에 실행하고 결과를 출력하는 함수를 작성해보세요.
 
 1...100 더하는 함수
 
 1...50 더하는 함수 1개 작업을 실행
 51...100 더하는 함수 1개 작어블 실행
 
 두 결과를 더해서 1...100 합한 값을 출력하세요.
 */

// 그냥 기달리면서 하는 버전
func sum(_ start: Int, _ end: Int) async -> Int {
    async let a = sumSub(start, end / 2)
    async let b = sumSub(end / 2 + 1, end)
    var a2 = await a
    var b2 = await b
    
    return a2+b2
}

func sumSub(_ s: Int, _ e: Int) async -> Int {
    var ret = 0
    
    for i in s...e {
        ret += i
    }
    
    return ret
}

// 병렬버전
func doSomething() async {
    // async let을 사용하여 두 개의 비동기 작업을 동시에 실행
    async let result1 = sumSub(1, 50)
    async let result2 = sumSub(51, 100)
    // 결과를 출력
    var a = await result1
    var b = await result2
    print("\(a + b)")
}


Task {
    await print(sum(1, 100))
    await doSomething()
}

// MARK: - 동시성 예제 2
/*
 동시성 예제 01을 withTaskGroup 사용으로 변환해 보세요.
 */

func Ex02() async {
    var res = 0
    var totalSum: [Int: Int] = [:]
    var indexList = [1, 50]
    
    await withTaskGroup(of: (Int, Int).self) { group in
        for i in 0...1 {
            //indexList[i]이걸 쓰면 에러;;
            // Reference to captured var 'indexList' in concurrently-executing code

            
            group.addTask {
                return (i, await sumSub(i * 50 + 1, i * 50 + 50))
//                return (i, await sumSub(indexList[i], indexList[i] + 50))
            }
        }
        
        for await(task, number) in group {
            totalSum[task] = number
            res += number
        }
    }
    
    for (key, value) in totalSum {
        print(key, value)
    }
    print(res)
}

Task {
    await Ex02()
}
