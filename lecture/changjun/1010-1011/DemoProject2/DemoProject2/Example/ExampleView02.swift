//
//  ExampleView02.swift
//  DemoProject2
//
//  Created by phang on 10/11/23.
//

import SwiftUI

struct ExampleView02: View {
    @State var fileOpen = true
    
    var body: some View {
        
        var str = "File Closed"
        print(str)
        
        if fileOpen {
            str = "File Open"
            print(str)
        }
        
        return VStack {
                VStack {
                    Text("t1")
                    Text("t2")
                    HStack {
                        Text("t3")
                        Text("t4")
                    }
                }
                .padding(5)
                .background(Color.white)
                
                Text("t5")
            }
            .padding(10)
            .background(Color.gray)
    }
}

#Preview {
    ExampleView02()
}
