//
//  main.swift
//  Swift_sample
//
//  Created by 조민식 on 2023/09/21.
//

import Foundation

var RandomA = Int.random(in: 0...100)
var RandomB = Int.random(in: 0...100)
var sum = RandomA + RandomB
var input: Int?
var choice: String?

func plusGame() -> Bool{
    print("\(RandomA) + \(RandomB) =",terminator: " ")
    input = Int(readLine()!)!
    
    if sum == input{
        print("Success")
        print("계속 하시겠습니까? (Y/N)",terminator: " ")
        choice = readLine()!
        if choice == "Y"{
            return true
        }else{
            return false
        }
    }else{
        print("Fail")
        print("계속 하시겠습니까? (Y/N)",terminator: " ")
        choice = readLine()!
        if choice == "Y"{
            return plusGame()
        }else{
            return false
        }
    }
}

while true{
    print("=== Plus Game ===")
    
    RandomA = Int.random(in: 0...100)
    RandomB = Int.random(in: 0...100)
    sum = RandomA + RandomB
    
    let continuGame = plusGame()
    
    if continuGame {
        continue
    }else{
        break
    }
}
