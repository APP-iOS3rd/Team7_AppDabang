import Foundation

// MARK: - 제너릭 예제 01
// 다음 코드에서 컴파일 에러가 발생하는 이유를 설명하고, Generics을 사용하여 에러를 해결하는 방법을 제시하세요.

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

// 스택의 원소를 Int형으로 정의하였기 때문

// MARK: - 제너릭 예제 02
// 제너릭 함수로 두 개의 값을 교환하는 swap 함수를 작성해보세요.

func swap<T>(_ a: inout T, _ b: inout T) {
    let tmp = a
    a = b
    b = tmp
}

var a = 10
var b = 20
swap(&a, &b)
print(a, b) // 20, 10

// MARK: - 제너릭 예제 03
/*
 제너릭 타입으로 스택을 구현해보세요.
 
 스택은 push, pop, peek, isEmpty 등의 메서드를 가지고 있어야 합니다.
 */

extension Stack {
    func peek() -> T? {
        if let val = items.last {
            return val
        }
        return nil
    }
    
    func isEmpty() -> Bool {
        items.isEmpty
    }
    
    func count() -> Int {
        items.count
    }
}

// MARK: - 제너릭 예제 04
/*
 제너릭 타입으로 큐를 구현해보세요.
 큐는 enqueue, dequeue, front, isEmpty 등의 메서드를 가지고 있어야 합니다
 */

struct Queue<T> {
    var items = [T]()
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    var count: Int {
        items.count
    }
    
    func front() -> T? {
        return items.first
    }
    
    mutating func enqueue(_ item: T) {
        items.append(item)
    }
    
    mutating func dequeue() -> T? {
        !isEmpty ? items.removeFirst() : nil
    }
}

// 예시 코드:
var queue = Queue<String>()
queue.enqueue("A")
queue.enqueue("B")
queue.enqueue("C")
print(queue.dequeue()!) // A
print(queue.front()!) // B
print(queue.isEmpty) // false

// MARK: - 제너릭 예제 05
/*
 다음의 함수는 제네릭 타입 T를 인자로 받아서 T의 타입을 출력하는 함수입니다.
 
 제네릭을 이용하여 함수를 완성하세요.
 */

func printType<T>(_ val: T) {
    print("The type of \(val) is \(type(of: val))")
}

printType(3) // The type of 3 is Int
printType("Hello") // The type of Hello is String
printType(true) // The type of true is Bool

//// MARK: - 제너릭 예제 06
///*
// 다음의 클래스는 제네릭 타입 Key와 Value를 가지는 Node 클래스입니다.
//
// 제네릭을 이용하여 클래스를 완성하세요.
// */
//
//class Node<T> {
//    var key: T
//    var value: T
//
//    init(key: T, value: T) {
//        self.key = key
//        self.value = value
//    }
//}
//
//let node = Node(key: "name", value: "Alice")
//print(node.key) // name
//print(node.value) // Alice

// MARK: - 제너릭 예제 07
/*
 다음의 함수는 두 개의 제네릭 타입 두 개의 인자를 받아서 두 값이 같은지 비교하는 함수입니다.
 
 제네릭을 이용하여 함수를 완성하세요.
 */

func isEqual<T: Equatable>(_ a: T, _ b: T) -> Bool {
    a == b
}

print(isEqual(1, 1)) // true
print(isEqual("Hello", "World")) // false
print(isEqual(true, false)) // false

// MARK: - 제너릭 예제 08
/*
 다음의 함수는 제네릭 타입 T를 인자로 받아서 T의 타입이 Int인지 확인하는 함수입니다.
 
 제네릭을 이용하여 함수를 완성하세요.
 */

func isInt<T>(_ val: T) -> Bool {
    val is Int
}

print(isInt(3)) // true
print(isInt("Hello")) // false
print(isInt(true)) // false

// MARK: - 제너릭 예제 09
/*
 다음의 함수는 제네릭 타입 T를 인자로 받아서 T의 타입을 Int로 캐스팅하는 함수입니다.
 
 제네릭을 이용하여 함수를 완성하세요.
 */

func castToInt<T>(_ val: T) -> Int? {
    val as? Int // 다운 캐스팅
}
print(castToInt(3)) // 3
print(castToInt("Hello")) // nil
print(castToInt(true)) // nil

// MARK: - 제너릭 예제 10
/*
 다음의 함수는 제네릭 타입 T를 가지는 배열을 인자로 받아서 배열의 첫 번째 원소와 마지막 원소를 교환하는 함수입니다.
 
 제네릭을 이용하여 함수를 완성하세요.
 */
func swapFirstAndLast<T>(_ arr: inout [T]) {
    if !arr.isEmpty && arr.count > 1 {
        let tmp = arr.first!
        arr[0] = arr.last!
        arr[arr.count-1] = tmp
    }
}

var array = [1, 2, 3, 4, 5]
swapFirstAndLast(&array)
print(array) // [5, 2, 3, 4, 1]

var array2 = ["A", "B", "C", "D"]
swapFirstAndLast(&array2)
print(array2) // ["D", "B", "C", "A"]

// MARK: - 제너릭 예제 11
/*
 다음의 함수는 제네릭 타입 T를 가지는 배열을 인자로 받아서 배열의 모든 원소를 역순으로 출력하는 함수입니다.
 
 제네릭을 이용하여 함수를 완성하세요
 */

func printReverse<T>(_ arr: [T]) {
    for a in arr.reversed() {
        print(a)
    }
}

let array3 = [1, 2, 3, 4, 5]
printReverse(array3)
// 5
// 4
// 3
// 2
// 1

let array4 = ["A", "B", "C", "D"]
printReverse(array4)
// D
// C
// B
// A
// MARK: - 제너릭 예제 12
/*
 제너릭 타입으로 연결 리스트를 구현해보세요.
 
 연결 리스트는 append, insert, remove, nodeAt 등의 메서드를 가지고 있어야 합니다.
 */
class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var size: Int = 0
    var isEmpty: Bool {
        size == 0
    }
    
    func append(_ val: T) {
        if head == nil {
            head = Node(value: val)
            tail = Node(value: val)
            size += 1
        } else {
            tail?.next = Node(value: val)
            tail = Node(value: val)
        }
    }
    
    func inset(_ val: T, at idx: Int) {
        let newNode = Node(value: val)
        if idx == 0 {
            newNode.next = head
            head = newNode
            if tail == nil {
                tail = newNode
            }
        } else {
            var currentNode = head
            var currentIndex = 0
            
            while currentNode != nil, currentIndex < idx - 1 {
                currentNode = currentNode?.next
                currentIndex += 1
            }
            
            if currentNode != nil {
                newNode.next = currentNode?.next
                currentNode?.next = newNode
                if newNode.next == nil {
                    tail = newNode
                }
            }
        }
    }
    
    func remove(at idx: Int) {
        if idx == 0 {
            head = head?.next
            if head == nil {
                tail = nil
            }
        } else {
            var currentNode = head
            var currentIndex = 0
            
            while currentNode != nil, currentIndex < idx - 1 {
                currentNode = currentNode?.next
                currentIndex += 1
            }
            
            if currentNode != nil, currentNode?.next != nil {
                currentNode?.next = currentNode?.next?.next
                if currentNode?.next == nil {
                    tail = currentNode
                }
            }
        }
    }
    
    func nodeAt(idx: Int) -> Node<T>? {
        if idx == 0 {
            return head
        } else {
            var currentNode = head
            var currentIndex = 0
            
            while currentNode != nil, currentIndex < idx {
                currentNode = currentNode?.next
                currentIndex += 1
            }
            
            return currentNode
        }
    }
}


// 참고: https://iosdevlime.tistory.com/entry/iOSSwift-%ED%83%80%EC%9E%85%EC%97%90-%EC%9D%98%EC%A1%B4%ED%95%98%EC%A7%80-%EC%95%8A%EB%8A%94-%EB%B2%94%EC%9A%A9%EC%BD%94%EB%93%9C-%EC%A0%9C%EB%84%A4%EB%A6%ADGeneric
// https://babbab2.tistory.com/127
