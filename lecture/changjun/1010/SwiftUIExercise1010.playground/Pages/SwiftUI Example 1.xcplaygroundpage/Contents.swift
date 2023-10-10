import SwiftUI
import PlaygroundSupport

// MARK: - SwiftUI

struct ExampleView: View {
    @State private var msg = "Bonjour, Phang!"
    private let sendButtonText = "Send"
    
    var body: some View {
        VStack {
            Image(systemName: "pencil.and.scribble")
                .imageScale(.large)
                .foregroundStyle(.pink)
            Text(msg)
                .foregroundStyle(.white)
            HStack {
                TextField("Placeholder", text: $msg)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: buttonPressed, label: {
                    Text(sendButtonText)
                        .foregroundColor(.white)
                })
            }
        }
        .padding()
        .background(Color.gray)
        
        Text("hello")
    }
    
    private func buttonPressed() {
        msg = "Achèvement!"
    }
    
}

PlaygroundPage.current.setLiveView(ExampleView().padding(100))
