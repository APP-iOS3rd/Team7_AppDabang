import UIKit

// MARK: - 제네릭 예제 01

struct Stack01<T> {
    var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var intStack = Stack01<Int>()
intStack.push(3)
intStack.push(5)
print(intStack.pop()) // 5

var stringStack = Stack01<String>()
stringStack.push("Hello")
stringStack.push("World")
print(stringStack.pop()) // World


// MARK: - 제네릭 예제 02

func Swap<T>(_ a: inout T, _ b: inout T ) {
    (a, b) = (b, a)
}

var a = 10
var b = 20
swap(&a, &b)
print(a, b) // 20 10


// MARK: - 제네릭 예제 03

struct Stack03<T> {
    private var items = [T]()
    var isEmpty: Bool { items.isEmpty }
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T? {
        guard !items.isEmpty else { return nil }
        return items.removeLast()
    }
    
    func peek() -> T? {
        guard let peek = items.last else { return nil }
        return peek
    }
}

var stack = Stack03<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
print(stack.pop() ?? "empty stack")   // 3
print(stack.peek() ?? "empty stack")  // 2
print(stack.isEmpty) // false


// MARK: - 제네릭 예제 04

struct Queue<T> {
    private var items = [T]()
    var isEmpty: Bool { items.isEmpty }
    
    mutating func enqueue(_ item: T) {
        items.append(item)
    }
    
    mutating func dequeue() -> T? {
        guard !items.isEmpty else { return nil }
        return items.removeFirst()
    }
    
    func front() -> T? {
        guard let front = items.first else { return nil }
        return front
    }
}

var queue = Queue<String>()
queue.enqueue("A")
queue.enqueue("B")
queue.enqueue("C")
print(queue.dequeue() ?? "empty queue") // A
print(queue.front() ?? "empty queue") // B
print(queue.isEmpty) // false


// MARK: - 제네릭 예제 05

func printType<T>(_ item: T) {
    print("The type of \(item) is \(T.self)")
}

printType(3) // The type of 3 is Int
printType("Hello") // The type of Hello is String
printType(true) // The type of true is Bool


// MARK: - 제네릭 예제 06

class Node06<K, V> {
    var key: K
    var value: V
    
    init(key: K, value: V) {
        self.key = key
        self.value = value
    }
}

let node = Node06(key: "name", value: "Alice")
print(node.key) // name
print(node.value) // Alice


// MARK: - 제네릭 예제 07

func isEqual<T: Equatable>(_ a: T, _ b: T) -> Bool {
    a == b
}

print(isEqual(1, 1)) // true
print(isEqual("Hello", "World")) // false
print(isEqual(true, false)) // false


// MARK: - 제네릭 예제 08

func isInt<T>(_ item: T) -> Bool {
    item is Int
}

print(isInt(3)) // true
print(isInt("Hello")) // false
print(isInt(true)) // false


// MARK: - 제네릭 예제 09

func castToInt<T>(_ item: T) -> Int? {
    item as? Int
}

print(castToInt(3)) // Optional(3)
print(castToInt("Hello")) // nil
print(castToInt(true)) // nil


// MARK: - 제네릭 예제 10

func swapFirstAndLast<T>(_ items: inout [T]) {
    if let first = items.first, let last = items.last {
        items[0] = last
        items[items.count - 1] = first
    }
}

var array = [1, 2, 3, 4, 5]
swapFirstAndLast(&array)
print(array) // [5, 2, 3, 4, 1]

var array2 = ["A", "B", "C", "D"]
swapFirstAndLast(&array2)
print(array2) // ["D", "B", "C", "A"]


// MARK: - 제네릭 예제 11

func printReverse<T>(_ items: [T]) {
    items.reversed().forEach { print($0) }
}

let arr = [1, 2, 3, 4, 5]
printReverse(arr)
// 5
// 4
// 3
// 2
// 1

let arr2 = ["A", "B", "C", "D"]
printReverse(arr2)
// D
// C
// B
// A


// MARK: - 제네릭 예제 12

class Node<T> {
    var value: T
    var next: Node?

    init(value: T) {
        self.value = value
    }
}

struct LinkedList<T> {
    private var head: Node<T>?
    
    mutating func append(_ item: T) {
        if head == nil {
            head = Node(value: item)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(value: item)
    }
    
    mutating func insert(_ item: T, at index: Int) {
        if head == nil {
            head = Node(value: item)
            return
        }
        
        let newNode = Node(value: item)
        if index == 0 {
            newNode.next = head
            head = newNode
            return
        }

        var node = head
        var count = 0
        var previous: Node<T>?
        while node?.next != nil && count < index {
            previous = node
            node = node?.next
            count += 1
        }
        previous?.next = newNode
        newNode.next = node
    }
    
    mutating func remove(at index: Int) {
        if head == nil {
            return
        }
        
        if index == 0 {
            head = head?.next
            return
        }
        
        var node = head
        var count = 0
        var previous: Node<T>?
        while node?.next != nil && count < index {
            previous = node
            node = node?.next
            count += 1
        }
        previous?.next = node?.next
    }
    
    func nodeAt(_ index: Int) -> Node<T>? {
        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        return node
    }
}

var list = LinkedList<Int>()
list.append(1)
list.append(2)
list.append(3)
list.insert(4, at: 1)
list.remove(at: 2)
print(list.nodeAt(0)?.value) // 1
print(list.nodeAt(1)?.value) // 4
print(list.nodeAt(2)?.value) // 3
