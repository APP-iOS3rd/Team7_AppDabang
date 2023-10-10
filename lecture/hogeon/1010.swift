import SwiftUI
import PlaygroundSupport

// 예제 1
//struct ContentView: View {
//
//    @State private var num1: String = ""
//    @State private var num2: String = ""
//    @State private var result1: String = ""
//    @State private var result2: String = ""
//    @State private var result3: String = ""
//    @State private var result4: String = ""
//
//    var body: some View {
//        VStack {
//            Text("두 수를 입력받아 답을 출력하는 앱")
//            TextField("num1", text: $num1)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
////                .keyboardType = .numberPad
//            TextField("num2", text: $num2)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            Button(action: buttonPressed, label: {Text("Send")})
//                .foregroundColor(.white)
//            
//                Text("\(result1)")
//                Text("\(result2)")
//                Text("\(result3)")
//                Text("\(result4)")
//            
//        }
//        .padding(10)
//        .background(Color.indigo)
//    }
//
//    func buttonPressed() {
//        let a = Int(num1)!
//        let b = Int(num2)!
//        result1 = "더하기 결과: \(a + b)"
//        result2 = "빼기 결과: \(a - b)"
//        result3 = "곱하기 결과: \(a * b)"
//        result4 = "나누기 결과: \(Double(a) / Double(b))"
//    }
//}
//
//PlaygroundPage.current.setLiveView( ContentView().padding(100) )

// 예제 2
//struct ContentView: View {
//
//    @State private var num1: String = ""
//    @State private var num2: String = ""
//    @State private var result1: String = ""
//    @State private var result2: String = ""
//    
//
//    var body: some View {
//        VStack {
//            Text("제주도에서 귤을 구매 출력하는 앱")
//            HStack{
//                Text("귤 수?: ")
//                TextField("num1", text: $num1)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//            }
//            HStack{
//                Text("한 박스 개수?: ")
//                TextField("num2", text: $num2)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//            }
//            
//            
//            Button(action: buttonPressed, label: {Text("Send")})
//                .foregroundColor(.white)
//            
//                Text("\(result1)")
//                Text("\(result2)")
//                
//            
//        }
//        .padding(10)
//        .background(Color.indigo)
//    }
//
//    func buttonPressed() {
//        let a = Int(num1)!
//        let b = Int(num2)!
//        result1 = "귤 박스의 수?: \(a / b)"
//        result2 = "박스에 담고 남은 귤수?: \(a % b)"
//        
//    }
//}
//
//PlaygroundPage.current.setLiveView( ContentView().padding(100) )

// 예제 3
//struct ContentView: View {
//
//    @State private var num: String = ""
//    @State private var result: String = ""
//    
//    
//
//    var body: some View {
//        if self.num == nil {
//            print("nil num")
//        }
//        if self.num.isEmpty {
//            print("empty num")
//        }
//        
//        return VStack {
//            Text("백의 자리 이하를 버리는 앱")
//                TextField("num", text: $num)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//            
//            
//            Button(action: buttonPressed, label: {Text("Send")})
//                .foregroundColor(.white)
//                .disabled(self.num.isEmpty)
//            
//                Text("\(result)")
//                
//            
//        }
//        .padding(10)
//        .background(Color.indigo)
//    }
//
//    func buttonPressed() {
//        let num = Int(num)!
//        result = "\(num / 100 * 100)"
//        
//    }
//}
//
//PlaygroundPage.current.setLiveView( ContentView().padding(100) )
