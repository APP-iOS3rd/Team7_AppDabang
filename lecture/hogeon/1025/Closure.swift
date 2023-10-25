/*
다음 코드에서 클로저를 사용하여 배열의 모든 요소에 10을 곱한 새로운 배열을 만들어보세요.
let numbers = [1, 2, 3, 4, 5]
*/
let numbers = [1, 2, 3, 4, 5]
print( numbers.map { $0 * 10 } )

/*
다음 코드에서 클로저를 사용하여 배열의 홀수 요소만 필터링하여 새로운 배열을 만들어보세요.
let numbers = [1, 2, 3, 4, 5]
*/
let numbers = [1, 2, 3, 4, 5]
print( numbers.filter { $0 % 2 == 1 } )

/*
다음 코드에서 클로저를 사용하여 배열의 요소들의 합을 구해보세요.
let numbers = [1, 2, 3, 4, 5]
*/
let numbers = [1, 2, 3, 4, 5]
print( numbers.reduce(0) { $0 + $1 } )          // 1형
print( numbers.reduce(into: 0) { $0 += $1 } )   // 2형

/*
다음 코드에서 클로저를 사용하여 배열의 요소들을 문자열로 변환하여 새로운 배열을 만들어보세요.
let numbers = [1, 2, 3, 4, 5]
*/
let numbers = [1, 2, 3, 4, 5]
print( numbers.map { "\($0)" } )
print( numbers.map { String($0) } )