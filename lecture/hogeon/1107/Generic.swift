/*
다음 코드에서 컴파일 에러가 발생하는 이유를 설명하고, Generics을 사용하여 에러를 해결하는 방법을 제시하세요.
// 예시 코드:
struct Stack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

var intStack = Stack()
intStack.push(3)
intStack.push(5)
print(intStack.pop()) // 5

var stringStack = Stack()
stringStack.push("Hello")
stringStack.push("World")
print(stringStack.pop())
*/
// 완성 코드:
struct Stack<T> {
    var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var intStack = Stack<Int>()
intStack.push(3)
intStack.push(5)
print(intStack.pop()) // 5

var stringStack = Stack<String>()
stringStack.push("Hello")
stringStack.push("World")
print(stringStack.pop())

/*
제너릭 함수로 두 개의 값을 교환하는 swap 함수를 작성해보세요
// 예시 코드:
var a = 10
var b = 20
swap(&a, &b)
print(a, b) // 20, 10
*/
func swap<T>(_ a: inout T, _ b: inout T) {
    (a, b) = (b, a)
}


// 예시 코드:
var a = 10
var b = 20
swap(&a, &b)
print(a, b) // 20, 10

/*
제너릭 타입으로 스택을 구현해보세요.

스택은 push, pop, peek, isEmpty 등의 메서드를 가지고 있어야 합니다.
// 예시 코드:
var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
print(stack.pop())   // 3
print(stack.peek())  // 2
print(stack.isEmpty) // false
*/
struct Stack<T> {
    private var items = [T]()

    mutating func push(_ item: T) {
        items.append(item)
    }

    mutating func pop() -> T? {
        return items.popLast()
    }

    func peek() -> T? {
        return items.last
    }

    var isEmpty: Bool {
        return items.isEmpty
    }
}

/*
제너릭 타입으로 큐를 구현해보세요.

큐는 enqueue, dequeue, front, isEmpty 등의 메서드를 가지고 있어야 합니다.
// 예시 코드:
var queue = Queue<String>()
queue.enqueue("A")
queue.enqueue("B")
queue.enqueue("C")
print(queue.dequeue()) // A
print(queue.front()) // B
print(queue.isEmpty) // false
*/
struct Queue<T> {
    private var items = [T]()

    mutating func enqueue(_ item: T) {
        items.append(item)
    }

    mutating func dequeue() -> T? {
        return items.isEmpty ? nil : items.removeFirst()
    }

    func front() -> T? {
        return items.first
    }

    var isEmpty: Bool {
        return items.isEmpty
    }
}

/*
다음의 함수는 제네릭 타입 T를 인자로 받아서 T의 타입을 출력하는 함수입니다.

제네릭을 이용하여 함수를 완성하세요.
// 예시 코드:

printType(3) // The type of 3 is Int
printType("Hello") // The type of Hello is String
printType(true) // The type of true is Bool
*/
func printType<T>(_ value: T) {
    print("The type of \(value) is \(T.self)")
}

/*
다음의 클래스는 제네릭 타입 Key와 Value를 가지는 Node 클래스입니다.

제네릭을 이용하여 클래스를 완성하세요.
// 예시 코드:

let node = Node(key: "name", value: "Alice")
print(node.key) // name
print(node.value) // Alice
*/
class Node<Key, Value> {
    var key: Key
    var value: Value

    init(key: Key, value: Value) {
        self.key = key
        self.value = value
    }
}

/*
다음의 함수는 두 개의 제네릭 타입 두 개의 인자를 받아서 두 값이 같은지 비교하는 함수입니다.

제네릭을 이용하여 함수를 완성하세요.
// 예시 코드:

print(isEqual(1, 1)) // true
print(isEqual("Hello", "World")) // false
print(isEqual(true, false)) // false
*/
func isEqual<T: Equatable> (_ first: T, _ second: T) -> Bool {
    return first == second
}

/*
다음의 함수는 제네릭 타입 T를 인자로 받아서 T의 타입이 Int인지 확인하는 함수입니다.

제네릭을 이용하여 함수를 완성하세요.
// 예시 코드:

print(isInt(3)) // true
print(isInt("Hello")) // false
print(isInt(true)) // false
*/
func isInt<T>(_ value: T) -> Bool {
    return value is Int
}

/*
다음의 함수는 제네릭 타입 T를 인자로 받아서 T의 타입을 Int로 캐스팅하는 함수입니다.

제네릭을 이용하여 함수를 완성하세요.
// 예시 코드:

print(castToInt(3)) // 3
print(castToInt("Hello")) // nil
print(castToInt(true)) // nil
*/
func castToInt<T>(_ value: T) -> Int? {
    return value as? Int
}

// 예시 코드:

print(castToInt(3))         // 3
print(castToInt("Hello"))   // nil
print(castToInt(true))      // nil

/*
다음의 함수는 제네릭 타입 T를 가지는 배열을 인자로 받아서 배열의 첫 번째 원소와 마지막 원소를 교환하는 함수입니다.

제네릭을 이용하여 함수를 완성하세요.
// 예시 코드:

var array = [1, 2, 3, 4, 5]
swapFirstAndLast(&array)
print(array) // [5, 2, 3, 4, 1]

var array2 = ["A", "B", "C", "D"]
swapFirstAndLast(&array2)
print(array2) // ["D", "B", "C", "A"]
*/
func swapFirstAndLast<T>(_ array: inout [T]) {
    guard  !array.isEmpty else { return }

    let temp = array[0]
    array[0] = array[ array.count - 1 ]
    array[ array.count - 1 ] = temp
}

var array = [1, 2, 3, 4, 5]
swapFirstAndLast(&array)
print(array) // [5, 2, 3, 4, 1]

var array2 = ["A", "B", "C", "D"]
swapFirstAndLast(&array2)
print(array2) // ["D", "B", "C", "A"]

var array3 = [Int]()
swapFirstAndLast(&array3)

/*
다음의 함수는 제네릭 타입 T를 가지는 배열을 인자로 받아서 배열의 모든 원소를 역순으로 출력하는 함수입니다.

제네릭을 이용하여 함수를 완성하세요.
// 예시 코드:

let array = [1, 2, 3, 4, 5]
printReverse(array)
// 5
// 4
// 3
// 2
// 1

let array2 = ["A", "B", "C", "D"]
printReverse(array2)
// D
// C
// B
// A
*/
func printReverse<T>(_ arr: [T]) {
    for i in stride(from: arr.count - 1, through: 0, by: -1) {
        print(arr[i])
    }
}

/*
제너릭 타입으로 연결 리스트를 구현해보세요.

연결 리스트는 append, insert, remove, nodeAt 등의 메서드를 가지고 있어야 합니다.
// 예시 코드:
var list = LinkedList<Int>()
list.append(1)
list.append(2)
list.append(3)
list.insert(4, at: 1)
list.remove(at: 2)
print(list.nodeAt(0)?.value) // 1
print(list.nodeAt(1)?.value) // 4
print(list.nodeAt(2)?.value) // 3
*/
class Node<T> {
    var value: T
    var next: Node?

    init(value: T) {
        self.value = value
    }
}
