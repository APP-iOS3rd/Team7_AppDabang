/*
1부터 100까지의 합을 구하는 비동기 함수

async let을 사용하여 두 개의 비동기 작업을 동시에 실행하고 결과를 합하여 출력하는 함수를 작성해보세요.
*/
import SwiftUI

struct ConcurrencyView1: View {
    var body: some View {
        Button(action: {
            // 동기 함수에서 비동기 함수 호출
            Task {
                await doSomething()
            }
        }, label: {
            Text("Do Something")
        })
    }

    func doSomething() async {
        // async let을 사용하여 두 개의 비동기 작업을 동시에 실행
        async let result1 = sumFrom(1, 50)
        async let result2 = sumFrom(51, 100)
        // 결과를 출력
        var a = await result1
        var b = await result2
        print("\(a + b)")
    }

    // s부터 e까지의 합을 구하는 비동기 함수
    func sumFrom(_ s: Int, _ e: Int) async -> Int {
        var sum = 0
        for i in s...e {
            sum += i
        }
        return sum
    }
}

/*
동시성 예제 02
동시성 예제 01을 withTaskGroup 사용으로 변환해 보세요.
*/
struct ConcurrencyView1: View {
    var body: some View {
        Button(action: {
            // 동기 함수에서 비동기 함수 호출
            Task {
                await doSomething()
            }
        }, label: {
            Text("Do Something")
        })
    }

    func doSomething() async {
        var totalSum: [Int: Int] = [:]
        let indexlist = [1, 50]

        await withTaskGroup(of: (Int, Int).self) { group in
            for i in 1...5 {
                group.addTask {
                    return ( i, await sumFrom(indexlist[0] + 1, indexlist[0] + 50) )
                }
            }

            for await (task, sum) in group {
                totalSum[task] = sum
            }

        }

        // 작업 그룹이 종료된 후 저장된 totalSum 딕셔너리 항목을 출력
        for (task, sum) in totalSum {
            print("Task = \(task), Sum = \(sum)")
        }
    }

    // s부터 e까지의 합을 구하는 비동기 함수
    func sumFrom(_ s: Int, _ e: Int) async -> Int {
        var sum = 0
        for i in s...e {
            sum += i
        }
        return sum
    }
}

/*
동시성 예제 03
비동기 함수를 호출하고 결과를 출력하는 코드를 작성해보세요.
*/
func printResult() async {
    let result = await asyncFunction()
    print(result)
}

Task {
    await printResult()
}

/*
다음 코드는 두 개의 비동기 함수를 호출하고, 그 결과를 더해서 출력하는 코드입니다.

하지만 이 코드는 컴파일 에러가 발생합니다.

에러의 원인과 해결 방법을 설명하고, 올바른 코드를 작성해보세요.
*/
func asyncAdd(_ x: Int, _ y: Int) async -> Int {
    return x + y
}

func asyncPrintSum(_ a: Int, _ b: Int) {
    let sum = await asyncAdd(a, b)
    print(sum)
}

/*
다음 코드는 비동기 함수 fetchUser(id:)를 호출하고, 그 결과를 print하는 코드입니다.

이 코드에 에러가 있는지, 있다면 어디에 있는지 찾아보고, 없다면 출력 결과를 예상해보세요.
*/
func asyncAdd(_ x: Int, _ y: Int) async -> Int {
    return x + y
}

func asyncPrintSum(_ a: Int, _ b: Int) async {
    let sum = await asyncAdd(a, b)
    print(sum)
}

Task {
    await asyncPrintSum(1, 4)
}

/*
다음 코드는 비동기 함수를 호출하고, 그 결과를 동기적으로 반환하는 함수입니다.

하지만 이 코드는 런타임 에러가 발생합니다.

에러의 원인과 해결 방법을 설명하고, 올바른 코드를 작성해보세요.
*/
func asyncDouble(_ x: Int) async -> Int {
    return x * 2
}


func syncDouble(_ x: Int)  {
    Task.detached { print( await asyncDouble(x) ) }
}

syncDouble(2)

/*
다음 코드는 두 개의 비동기 함수를 호출하고, 그 결과를 더해서 출력하는 코드입니다.

하지만, 이 코드는 오류가 발생합니다.

왜 그런지 설명하고, 오류를 수정한 코드를 작성하세요.

func asyncAdd(_ x: Int, _ y: Int) async -> Int {
    return x + y
}

func asyncPrintSum() {
    let a = await asyncAdd(10, 20)
    let b = await asyncAdd(30, 40)
    print(a + b)
}

asyncPrintSum()
*/

func asyncAdd(_ x: Int, _ y: Int) async -> Int {
    return x + y
}

func asyncPrintSum() async {
    let a = await asyncAdd(10, 20)
    let b = await asyncAdd(30, 40)
    print(a + b)
}

Task {
    await asyncPrintSum()
}