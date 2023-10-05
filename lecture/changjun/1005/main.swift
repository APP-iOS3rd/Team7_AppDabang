//
//  main.swift
//  prac2
//
//  Created by phang on 2023/09/21.
//

import Foundation

// MARK: - SortExercise
let sortExercise = SortExercise()
print(sortExercise.bubbleSort([5,3,6,2,1]))
print(sortExercise.selectionSort([5,3,6,2,1]))

let myPlayList = [Song(title: "롤린 (Rollin')", artist: "브레이브걸스", play: 156),
                  Song(title: "Celebrity", artist: "아이유", play: 141),
                  Song(title: "On The Ground", artist: "로제 (ROSÉ)", play: 35),
                  Song(title: "LOVE DAY (2021)", artist: "양요섭, 정은지", play: 94),
                  Song(title: "밤하늘의 별을(2020)", artist: "경서", play: 88),
                  Song(title: "Gone", artist: "로제 (ROSÉ)", play: 61),
                  Song(title: "Dynamite", artist: "방탄소년단", play: 111)
]
sortExercise.sortExercise01_1(data: myPlayList).forEach { print($0) }

let jsonFile = "sortExerciseData.json"
sortExercise.sortExercise01_2(file: jsonFile)!.forEach{ print($0) }

// MARK: - RecursiveFunctionExercise
let recursiveFunctionExercise = RecursiveFunctionExercise()
print(recursiveFunctionExercise.recursiveExercise01(arr: [1, 2, 3, 4, 5, 6]))
print(recursiveFunctionExercise.recursiveExercise02(arr: [7, 2, 4, 12, 5]))
print(recursiveFunctionExercise.fibonacci_1(num: 5))
print((1...9).map { recursiveFunctionExercise.fibonacci_1(num: $0) })
print(recursiveFunctionExercise.fibonacci_2(num: 5))
print((1...6).map { recursiveFunctionExercise.fibonacci_2(num: $0) })
print(recursiveFunctionExercise.divideSquare(x: 1680, y: 640))
