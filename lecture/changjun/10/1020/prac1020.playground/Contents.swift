import UIKit

// MARK: - concurrency 03

func asyncFunction() async -> Int {
    let random = Int.random(in: 1...10)
    return random
}

func printResult() async {
    let result = await asyncFunction()
    print(result)
}

Task {
    await asyncFunction()
}


// MARK: - concurrency 04

func asyncAdd(_ x: Int, _ y: Int) async -> Int {
    return x + y
}

func asyncPrintSum(_ a: Int, _ b: Int) async {
    let sum = await asyncAdd(a, b)
    print(sum)
}

Task {
    await asyncPrintSum(1, 5)
}


// MARK: - concurrency 05

func fetchUser(id: Int) async -> String {
    // some network request
    return "User \(id)"
}

func printUser(id: Int) async {
    let user = await fetchUser(id: id)
    print(user)
}

Task {
    await printUser(id: 14)
}


// MARK: - concurrency 06

func asyncDouble(_ x: Int) async -> Int {
    return x * 2
}

func syncDouble(_ x: Int) async -> Int {
    return await asyncDouble(x)
}

Task {
    print(await syncDouble(10))
}


// MARK: - concurrency 07

func asyncPrintSum() async {
    let a = await asyncAdd(10, 20)
    let b = await asyncAdd(30, 40)
    print(a + b)
}

Task {
    await asyncPrintSum()
}
