//
//  ExerciseView12.swift
//  DemoProject2
//
//  Created by phang on 10/16/23.
//

import SwiftUI

class ClassExercise12Object: ObservableObject {
    @Published var text = "HELLO, WORLD!"
    @Published var inputText: String?
}

struct ExerciseView12: View {
    @StateObject var obj = ClassExercise12Object()
    
    var body: some View {
        VStack {
            Image("cat")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.rect(cornerSize: CGSize(width: 15, height: 15)))
            
            Exercise12ButtonAndTextView()
                .environmentObject(obj)
            
            Spacer()
            
            Exercise12TextFieldView()
                .environmentObject(obj)
        }
        .padding(20)
        .background(Color.teal)
    }
}

struct Exercise12ButtonAndTextView: View {
    @EnvironmentObject var obj: ClassExercise12Object
    
    var body: some View {
        HStack {
//            Link(
//                destination: URL(string: "https://www.apple.com")!,
//                label: { Text("HOME") }
//            )
//            .modifier(CustomPinkButton())

            NavigationLink(
                destination: MyWebView(urlToLoad: "https://www.apple.com"),
                label: { Text("HOME") }
            )
            .modifier(CustomPinkButton())
            
            Spacer()
            
            Text(obj.text)
            
            Spacer()
            
            Button("CALL") {
                let numberString = "01011112222"
                let telephone = "tel://"
                let formattedString = telephone + numberString
                guard let url = URL(string: formattedString) else { return }
                UIApplication.shared.open(url)
            }
            .modifier(CustomPinkButton())
        }
        .padding(.vertical, 10)
    }
}

struct Exercise12TextFieldView: View {
    @EnvironmentObject var obj: ClassExercise12Object
    
    var body: some View {
        HStack {
            TextField("text here", text: Binding(
                get: { obj.inputText ?? "" },
                set: { obj.inputText = $0 }
            ))
            .textFieldStyle(.roundedBorder)
            Button("HELLO BUTTON", action: { obj.text = updateText() })
                .modifier(CustomPinkButton())
        }
    }
    
    private func updateText() -> String {
        guard let inputText = self.obj.inputText else { return "" }
        return inputText
    }
}

#Preview {
    ExerciseView12()
}
