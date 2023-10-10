import SwiftUI
import PlaygroundSupport

// MARK: - SwiftUI Exercise 2

struct ExerciseView: View {
    @State private var totalOrange = 3729
    @State private var buyCount: Int?
    @State private var boxLimit: Int?
    @State private var result = (box: 0, remainder: 0)
    @State private var showingAlert = false

    private let buttonText = "Check - SVP"
    
    var body: some View {
        VStack {
            Text("🍊")
                .font(.system(size: 100))
                .padding(.vertical, -5)

            Text("현재 귤 개수: \(totalOrange)")
                .padding(10)
            
            Text("총 몇개의 귤을 구매하시겠습니까?")
            TextField("구매할 귤 개수", value: $buyCount, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            Text("한 박스에 몇개의 귤을 담으시겠습니까?")
            TextField("박스당 귤 개수", value: $boxLimit, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            Button(action: buttonPressed, label: {
                Image(systemName: "creditcard")
                Text(buttonText)
                    .foregroundColor(.gray)
            })
            .padding(10)
            .buttonStyle(.bordered)
            .alert("입력이 잘못되었습니다.", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { 
                    showingAlert = false
                    buyCount = nil
                    boxLimit = nil
                }
            }
        
            Text("귤 박스의 수: " + "\(result.box)")
                .padding(5)
            Text("박스에 담고 남은 귤 수: \(result.remainder)")
                .padding(5)
        }
        .padding(10)
    }
    
    private func buttonPressed() {
        guard let buyCount = self.buyCount,
              let boxLimit = self.boxLimit,
              totalOrange - buyCount >= 0 else { return showingAlert = true }
        result.box = buyCount / boxLimit == 0 ? 1 : buyCount / boxLimit
        result.remainder = buyCount / boxLimit == 0 ? 0 : buyCount % boxLimit
        totalOrange -= buyCount
    }
    
}

PlaygroundPage.current.setLiveView(ExerciseView().padding(100))
