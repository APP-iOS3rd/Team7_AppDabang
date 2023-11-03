//  Created by 박선구 on 2023/09/27.

import SwiftUI

struct example2: View {
    
    @State private var orange: String = ""
    @State private var box: String = ""
    @State private var result1: String = ""
    @State private var result2: String = ""
    @State private var anime: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            Text("제주도 귤")
//                .background(Color.orange)
                .font(.largeTitle)
                .foregroundColor(.orange)
//                .padding(.bottom, 150)
            Spacer()
            HStack{
                Image(systemName: anime ? "shippingbox.fill" : "shippingbox").resizable().frame(width: 200, height: 200).foregroundColor(anime ? .orange : .green)
                    .symbolEffect(.bounce, value: orange)
                    .symbolEffect(.bounce, value: box)
                    .contentTransition(.symbolEffect(.replace))
                //                .padding(.bottom, 150)
            }
            Spacer()
            
            VStack{
                HStack{
                    Text("귤 박스의 수?").font(.title)
                    Spacer()
                    Text("\(result1)").font(.title).foregroundColor(.orange)
                }
                HStack{
                    Text("박스에 담고 남은 귤 수?").font(.title)
                    Spacer()
                    Text("\(result2)").font(.title).foregroundColor(.orange)
                }
            }
            .padding()
            HStack{
                VStack{
                    TextField("귤?", text: $orange)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    TextField("한 박스 개수?", text: $box)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                }
                Button("계산",systemImage: box.isEmpty || orange.isEmpty ? "questionmark" : "checkmark", action: orangeNum)
                    .contentTransition(.symbolEffect(.replace))
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .disabled(self.orange.isEmpty)
                    .disabled(self.box.isEmpty)
            }
            .padding()
            .background(Color.green)
        }
        .background(Color.white)
    }
    func orangeNum () {
        anime = true
        let number1 = Int(orange)!
        let number2 = Int(box)!
        result1 = "\(number1 / number2)"
        result2 = "\(number1 % number2)"
    }
}
#Preview {
    example2()
}
