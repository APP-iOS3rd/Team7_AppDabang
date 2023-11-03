/*
다음 코드에서 person의 name과 age를 출력하려고 합니다.

옵셔널 체이닝을 사용하여 코드를 완성하세요.
// 예시코드
struct Person {
    var name: String?
    var age: Int?
}

var person: Person? = Person(name: "Kim", age: 25)

print(person.name)
print(person.age)
*/
struct Person {
    var name: String?
    var age: Int?
}

var person: Person? = Person(name: "Kim", age: 25)
//var person: Person? = Person()

print(person?.name ?? "")
print(person?.age ?? 0)

/*
다음 코드에서 book의 title과 book.author의 name을 출력하려고 합니다.

옵셔널 체이닝을 사용하여 코드를 완성하세요.
// 예시코드
struct Author {
    var name: String?
}

struct Book {
    var title: String?
    var author: Author?
}

var book: Book? = Book(title: "The Little Prince", author: Author(name: "Antoine de Saint-Exupéry"))

print(book.title)              // The Little Prince
print(book.author.name)       // Antoine de Saint-Exupéry
*/
struct Author {
    var name: String?
}

struct Book {
    var title: String?
    var author: Author?
}

var book: Book? = Book(title: "The Little Prince", author: Author(name: "Antoine de Saint-Exupéry"))
//var book: Book? = Book()

print(book?.title ?? "없음")              // The Little Prince
print(book?.author?.name ?? "없음")       // Antoine de Saint-Exupéry

/*
다음 코드에서 numbers 배열의 첫번째 원소에 10을 더한 값을 출력하려고 합니다.

옵셔널 체이닝을 사용하여 코드를 완성하세요.
// 예시코드
var numbers: [Int]? = [1, 2, 3]

print(numbers[0] + 10)
*/
var numbers: [Int]? = [1, 2, 3]

print( numbers?[0] ?? 0 )
print( (numbers?[0] ?? 0) + 10)

/*
다음 코드에서 students 딕셔너리의 "Lee" 키에 해당하는 값에 1을 더한 값을 출력하려고 합니다.

옵셔널 체이닝을 사용하여 코드를 완성하세요.
// 예시코드
var students: [String: Int]? = ["Kim": 90, "Lee": 80, "Park": 85]

print(students["Lee"] + 1)
*/
var students: [String: Int]? = ["Kim": 90, "Lee": 80, "Park": 85]

print( (students?["Lee"] ?? 0) + 1)

/*
다음 코드에서 animal의 speak 메서드를 호출하려고 합니다.

옵셔널 체이닝을 사용하여 코드를 완성하세요.
// 예시코드
class Animal {
    func speak() {
        print("...")
    }
}

class Dog: Animal {
    override func speak() {
        print("Woof")
    }
}

var animal: Animal? = Dog()
animal.speak()
*/
class Animal {
    func speak() {
        print("...")
    }
}

class Dog: Animal {
    override func speak() {
        print("Woof")
    }
}

var animal: Animal? = Dog()
animal?.speak()

/*
다음 코드에서 matrix의 transpose 메서드를 호출하여 결과를 출력하려고 합니다.

옵셔널 체이닝을 사용하여 코드를 완성하세요.
// 예시코드
struct Matrix {
    var elements: [[Int]]

    func transpose() -> Matrix {
        var result = [[Int]]()
        for i in 0..<elements[0].count {
            var row = [Int]()
            for j in 0..<elements.count {
                row.append(elements[j][i])
            }
            result.append(row)
        }
        return Matrix(elements: result)
    }
}

var matrix: Matrix? = Matrix(elements: [[1, 2, 3], [4, 5, 6]])
print(matrix.transpose().elements)
*/
struct Matrix {
    var elements: [[Int]]

    func transpose() -> Matrix {
        var result = [[Int]]()
        for i in 0..<elements[0].count {
            var row = [Int]()
            for j in 0..<elements.count {
                row.append(elements[j][i])
            }
            result.append(row)
        }
        return Matrix(elements: result)
    }
}

var matrix: Matrix? = Matrix(elements: [[1, 2, 3], [4, 5, 6]])
//var matrix: Matrix? = nil
print(matrix?.transpose().elements ?? [[Int]]())

/*
다음 코드에서 옵셔널 체이닝을 이용하여 numbers 배열의 모든 요소를 더한 값을 출력하세요.

numbers가 nil이면 0을 출력하세요.
var numbers: [Int]? = [1, 2, 3, 4, 5]
*/
var numbers: [Int]? = [1, 2, 3, 4, 5]
//var numbers: [Int]? = nil
// ....

print( numbers?.reduce(0, +) ?? 0 )

/*
다음 코드에서 옵셔널 체이닝을 이용하여 students 배열의 모든 요소의 score 속성의 평균값을 출력하세요.

students가 nil이거나 비어있으면 0을 출력하세요.
struct Student {
    var name: String
    var score: Int
}

var students: [Student]? = [Student(name: "Kim", score: 80),
                            Student(name: "Lee", score: 90),
                            Student(name: "Park", score: 85)]

*/
struct Student {
    var name: String
    var score: Int
}

var students: [Student]? = [Student(name: "Kim", score: 80),
                            Student(name: "Lee", score: 90),
                            Student(name: "Park", score: 85)]
//var students: [Student]? = nil

print( students?.map { $0.score }.reduce(0, +) ?? 0 )
print( students?.count ?? 1 )
print( (students?.map { $0.score }.reduce(0, +) ?? 0) / (students?.count ?? 1) )
