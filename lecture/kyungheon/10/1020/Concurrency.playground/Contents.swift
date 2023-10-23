import Foundation

// MARK: - 동시성 예제 1
/*
 async let을 사용하여 두 개의 비동기 작업을 동시에 실행하고 결과를 출력하는 함수를 작성해보세요.
 
 1...100 더하는 함수
 
 1...50 더하는 함수 1개 작업을 실행
 51...100 더하는 함수 1개 작어블 실행
 
 두 결과를 더해서 1...100 합한 값을 출력하세요.
 */

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
    
//    for (key, value) in totalSum {
//        print(key, value)
//    }
    print(res)
}

Task {
    await Ex02()
}

// MARK: - 동시성 예제 3
/*
 비동기 함수를 호출하고 결과를 출력하는 코드를 작성해보세요.
*/

// 예시코드:
func asyncFunction() async -> Int {
    let random = Int.random(in: 1...10)
    return random
}

/* 요것도 가능
async let res = asyncFunction()
await print(res);
 */

Task {
    await print(asyncFunction())
}

// MARK: - 동시성 예제 4
/*
 다음 코드는 두 개의 비동기 함수를 호출하고, 그 결과를 더해서 출력하는 코드입니다.

 하지만 이 코드는 컴파일 에러가 발생합니다.

 에러의 원인과 해결 방법을 설명하고, 올바른 코드를 작성해보세요.
*/

func asyncAdd(_ x: Int, _ y: Int) async -> Int {
    return x + y
}

func asyncPrintSum(_ a: Int, _ b: Int) {
    /*
    let sum = await asyncAdd(a, b)
    print(sum)
    
    이유)
    비동기 반환값을 플레이 그라운드가 비동기 과정을 제어하지 못함
    그래서 Task를 비동기 부분을 감싸 sum을 받고 다음 코드줄로 넘어가게끔 해야 한다?
     */
    Task {
        async let sum = asyncAdd(a, b)
        //await print(asyncAdd(a, b))
        await print(sum)
        
        /*
        그냥 let으로 받고 싶으면
        let sum2 = await asyncAdd(a, b)
        print(sum2) exp
        
        exp: 여기서 awiat를 안써도 되는 것은 이미 let이란 일반 변수를 비동기 메소드의 결과를 await해서 받았기 때문
         */
    }
}

asyncPrintSum(1, 3)

// MARK: - 동시성 예제 5
/*
 다음 코드는 비동기 함수 fetchUser(id:)를 호출하고, 그 결과를 print하는 코드입니다.

 이 코드에 에러가 있는지, 있다면 어디에 있는지 찾아보고, 없다면 출력 결과를 예상해보세요.
*/

func fetchUser(id: Int) async -> String {
    // some network request
    return "User \(id)"
}

func printUser(id: Int) {
    /*
    let user = await fetchUser(id: id)
     예제 4와 동일 이유
    */
    
    Task {
        let user = await fetchUser(id: id)
        print(user)
    }
}

printUser(id: 1004)

// MARK: - 동시성 예제 6
/*
 다음 코드는 비동기 함수를 호출하고, 그 결과를 동기적으로 반환하는 함수입니다.

 하지만 이 코드는 런타임 에러가 발생합니다.

 에러의 원인과 해결 방법을 설명하고, 올바른 코드를 작성해보세요.
*/

func asyncDouble(_ x: Int) async -> Int {
    return x * 2
}

func syncDouble(_ x: Int) async -> Int {
    /*
     값을 리턴 전 await로 기다리고 반환한다는 것 자체가 곧 비동기로 리턴하겠다는 것
     이 함수 또한 async로 변경해줘야함
     
     cf.) async 키워드는 곧 메소드가 비동기 작업을 한다는 표시 같은 것
     func asyncDouble(_ x: Int) async -> Int {
         return x * 2
     }
     이 asyncDouble 내부 x에 대한 연산은 동기로 수행되더라도 호출되어 결과를 받는 것이 비동기로 온다는 것
    */
    
    return await asyncDouble(x)
}

Task {
    await print(syncDouble(4))
}

// MARK: - 동시성 예제 7
/*
 다음 코드는 두 개의 비동기 함수를 호출하고, 그 결과를 더해서 출력하는 코드입니다.

 하지만, 이 코드는 오류가 발생합니다.

 왜 그런지 설명하고, 오류를 수정한 코드를 작성하세요.
*/

func asyncPrintSum() {
    // 기존 것들과 동일
    Task {
        let a = await asyncAdd(10, 20)
        let b = await asyncAdd(30, 40)
        print(a + b)
    }
}

asyncPrintSum()
// 한번에 실행 하면
/* error: execution stopped with unexpected state.
error: Execution was interrupted.
The process has been left at the point where it was interrupted, use "thread return -x" to return to the state before expression evaluation.
 
 이런 에러 발생
 
 나머지를 주석처리하고 실행하면 잘됌;
*/
