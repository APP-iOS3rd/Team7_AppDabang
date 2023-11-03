//
//  ConcurrencyView2.swift
//  DemoProject
//
//  Created by lkh on 10/19/23.
//

import SwiftUI
enum DurationError: Error {
    case tooLong
    case tooShort
}

struct ConcurrencyView2: View {
    var body: some View {
        Button(action: {
            // 동기 함수에서 비동기 함수 호출
            Task {
                await doSomething()
            }
        }, label: {
            Text("Do Something")
        })
    }
    
    // 오류 핸들링과 함께  p.238
    func doSomething() async {
        print("Start \(Date())")
        do {
            try await takeTooLong(delay: 25)
        } catch DurationError.tooShort {
            print("Error: Duration too short")
        } catch DurationError.tooLong {
            print("Error: Duration too long")
        } catch {
            print("Unknown error")
        }
        
        print("End \(Date())")
    }
    
    func takeTooLong(delay: UInt32) async throws {
        if delay < 5 {
            throw DurationError.tooShort
        } else if delay > 20 {
            throw DurationError.tooLong
        }
        
        sleep(delay)            // 초 지연
        print("Async task complated at \(Date())")
    }
}
#Preview {
    ConcurrencyView2()
}
