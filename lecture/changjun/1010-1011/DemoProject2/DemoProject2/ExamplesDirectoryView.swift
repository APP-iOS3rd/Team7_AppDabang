//
//  ExamplesDirectoryView.swift
//  DemoProject2
//
//  Created by phang on 10/11/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ExamplesDirectoryView: View {
    private let example1010: [Example]
    private let example1011: [Example]
    private let exerciseArr: [ExampleArray]
    
    init() {
        self.example1010 = [
            Example(title: "ExampleView01"),
            Example(title: "ExampleView02")
        ]
        self.example1011 = [
            Example(title: "ExampleView03")
        ]
        self.exerciseArr = [
            ExampleArray(day: "10.10", arr: self.example1010),
            ExampleArray(day: "10.11", arr: self.example1011)
        ]
    }
    
    var body: some View {
        
        VStack {
            
            List {
                ForEach(exerciseArr, id: \.day) { section in
                    Section(
                        header: Text(section.day)
                            .font(.headline)
                    ) {
                        ForEach(section.arr, id: \.title) { example in
                            NavigationLink(destination: getView(example.title) ) {
                                VStack(alignment: .leading) {
                                    Text(example.title)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Example")
        }

    }
    
    @ViewBuilder
    private func getView(_ str: String) -> some View {
        switch str {
            case "ExampleView01":
                ExampleView01()
            case "ExampleView02":
                ExampleView02()
            case "ExampleView03":
                BasicView()
            default:
                Text("Unknown View")
        }
    }
    
}

@available(iOS 17.0, *)
#Preview {
    ExamplesDirectoryView()
}

// example array
struct ExampleArray {
    var day: String
    var arr: [Example]
}

// example
struct Example: Hashable {
    var title: String
}
