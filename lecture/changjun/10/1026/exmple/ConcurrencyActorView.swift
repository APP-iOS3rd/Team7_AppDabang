//
//  ConcurrencyActorView.swift
//  DemoProject2
//
//  Created by phang on 10/23/23.
//

import SwiftUI

actor TimeStore {
    var timeStamps = [Int: Date]()
    
    func addStamp(task: Int, date: Date) {
        timeStamps[task] = date
    }
}

struct ConcurrencyActorView: View {
    var body: some View {
        VStack {
            Button(action: {
                Task {
                    await doSomething()
                }
            }, label: {
                Text("Do Something")
            })
        }
    }
    
    func doSomething() async {

        let store = TimeStore()
        
        print("Start \(Date())")
        
        await withTaskGroup(of: Void.self) { group in
            for i in 1...5 {
                group.addTask {
                    await store.addStamp(task: i, date: await takeTooLong())
                }
            }
        }
        
        for (task, date) in await store.timeStamps {
            print("Task = \(task), Date = \(date)")
        }
        
        print("End \(Date())")
    }
    
    func takeTooLong() async -> Date {
        sleep(UInt32.random(in: 1...5))
        return Date()
    }
}

#Preview {
    ConcurrencyActorView()
}
