//
//  EnvironmentObjectPracView.swift
//  DemoProject2
//
//  Created by phang on 10/16/23.
//

import SwiftUI

class ClassExampleObject: ObservableObject {
    @Published var integer: Int = 0
}

struct EnvironmentObjectPracView: View {
    
    @State private var isOn: Bool = false
    @StateObject var obj: ClassExampleObject = ClassExampleObject()

    var body: some View {
        NavigationStack {
            Text("FirstViewValue: \(obj.integer)")
            
            Button(action: {
                obj.integer += 10
            }, label: {
                Text("change integer value")
            })
            
            Button(action: {
                isOn = true
            }, label: {
                Text("navigate to second")
            })
            .padding(.bottom, 60)
            
            SecondClassExampleView()
                .environmentObject(obj)
        }
        
    }
}

struct SecondClassExampleView: View {
    
    @EnvironmentObject var obj: ClassExampleObject

    var body: some View {
        Text("SecondViewValue: \(obj.integer)")
    }
}

#Preview {
    EnvironmentObjectPracView()
}
