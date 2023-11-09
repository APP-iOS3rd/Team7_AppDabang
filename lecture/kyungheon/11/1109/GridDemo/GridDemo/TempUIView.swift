//
//  TempUIView.swift
//  GridDemo
//
//  Created by lkh on 11/9/23.
//

import SwiftUI

struct tmpModel: Identifiable {
    let id = UUID()
    let img: String
    let text: String?
    
    init(img: String) {
        self.img = img
        self.text = nil
    }
    
    init(img: String, text: String) {
        self.img = img
        self.text = text
    }
}

struct GridCellView: View {
    let text: String

    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
    }
}

struct TempUIView: View {
    let arr: [tmpModel] = [tmpModel(img: "dummyImg2", text: "ffsdㄹㅇㄴㄹㅍㅇㄴㅍㅍㅇㄴㅍㄴㅍㄴㅍㄴㅊㅍㅇㄴㅍㅊㄴㅍㅇㄴㅍㅇㄴㅍㅇㄴㅍㅊㅌㅍㅊㅇㄴㅍㅌㅍㅊㅌㄴㅍㄴㅊㅇㅍㅊㄴㅍㅈㄹㅍㅇㄹf"), tmpModel(img: "dummyImg2"), tmpModel(img: "dummyImg1"), tmpModel(img: "dummyImg2", text: "ffsdf"), tmpModel(img: "dummyImg2")]

    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 10) {
                ForEach(arr.prefix(9), id: \.id) { model in
                    
                        Image(model.img)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 200)
                            
                        if let text = model.text {
                            GridCellView(text: text)
                        }
                }
            }
        }
        .padding()
    }
}

struct TempUIView_Previews: PreviewProvider {
    static var previews: some View {
        TempUIView()
    }
}

#Preview {
    TempUIView()
}
