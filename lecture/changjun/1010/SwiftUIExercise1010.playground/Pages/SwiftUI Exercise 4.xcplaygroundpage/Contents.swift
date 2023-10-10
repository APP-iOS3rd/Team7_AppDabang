import SwiftUI
import PlaygroundSupport

// MARK: - SwiftUI Exercise 4

struct ExerciseView: View {
    @State private var number: Int?
    @State private var result = 0
    @State private var showingAlert = false
    
    private let buttonText = "Check"
    
    var body: some View {
        VStack {
            TextField("숫자를 입력해주세요.", value: $number, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding(10)
            Button(action: buttonPressed, label: {
                Text(buttonText)
                    .foregroundColor(.gray)
            })
            .buttonStyle(.bordered)
            .alert("입력이 잘못되었습니다.", isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    showingAlert = false
                    number = nil
                }
            }
            Text("Result: \(result)")
                .padding(10)
        }
        .padding(10)
    }
    
    private func buttonPressed() {
        guard let number = self.number else { return showingAlert = true }
        result = number / 10 * 10 + 1
    }
    
}

PlaygroundPage.current.setLiveView(ExerciseView().padding(100))
