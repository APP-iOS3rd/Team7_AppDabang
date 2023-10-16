//
//  StackFrameView.swift
//  DemoProject2
//
//  Created by phang on 10/12/23.
//

import SwiftUI

struct StackFrameView: View {
    // 동적 HStack / VStack 변환
    @State private var myLayout: AnyLayout = AnyLayout(VStackLayout())
    
    var body: some View {
        VStack {
            
            // 동적 HStack / VStack 변환
            myLayout {
                Image(systemName: "goforward.10")
                Image(systemName: "goforward.15")
            }
            HStack {
                Button("HStack") { myLayout = AnyLayout(HStackLayout()) }
                Button("VStack") { myLayout = AnyLayout(VStackLayout()) }
            }
            
            Spacer()
            
            // ZStack - 중첩 됨
            ZStack {
                HStack {
                    Image(systemName: "goforward.10")
                    Image(systemName: "goforward.15")
                    Image(systemName: "goforward.30")
                }
                Spacer()
                VStack {
                    Image(systemName: "goforward.10")
                    Image(systemName: "goforward.15")
                    Image(systemName: "goforward.30")
                }
                Spacer()
                Text("Bonjour, Phang")
            }
            
            Spacer()
            
            // 그룹
            Group {
                Text("Bonjour, Phang")
                    .padding(.horizontal, 20)
                    .border(Color.black)
                
                HStack(alignment: .top, spacing: 80) {
                    Text("Q ======== ")
                        .border(Color.black)
                    VStack {
                        Text("Q1")
                        Text("Q2")
                        Text("Q3")
                    }
                    .border(Color.black)
                }
                .border(Color.black)
            }
            
            Spacer()
            
            // 텍스트 줄 제한과 레이아웃 우선순위
            HStack {
                Image(systemName: "airplane")
                Text("Flight Time: ")
                    .layoutPriority(1)
                Text("Seoul")
                    .layoutPriority(2)
                Text("Paris")
                Text("London")
            }
            .font(.title)
            .lineLimit(1)
//            .lineLimit(1..4)
            
            Spacer()
            
            // SwiftUI 프레임: 뷰 크기를 조절
            // .infinity -> 사용 가능한 모든 영역 차지
            // .edgesIgnoringSafeArea() -> 안전 영역을 무시
            Text("SwiftUi Frame")
                .font(.largeTitle)
                .border(Color.black)
                .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(Color.yellow)
            
            // 뷰들을 담고 있는 컨테이너의 크기에 따라 조절
            GeometryReader { geometry in
                VStack {
                    Text("GeometryReader")
                        .font(.largeTitle)
                        .border(Color.black)
                        .frame(width: geometry.size.width / 2,
                               height: (geometry.size.height / 4) * 3)
                        .background(Color.orange)
                    Text("Aurevoir...")
                        .font(.largeTitle)
                        .border(Color.black)
                        .frame(width: geometry.size.width / 3,
                               height: geometry.size.height / 4)
                        .background(Color.mint)
                }
            }
            .background(Color.red)
        }
    }
}

#Preview {
    StackFrameView()
}
