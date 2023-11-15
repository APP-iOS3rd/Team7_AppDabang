//
//  SelectView.swift
//  MentoringAPI
//
//  Created by phang on 11/8/23.
//

import SwiftUI
import PhotosUI

struct SelectView: View {
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var image: Image?
    
    var body: some View {
        VStack(spacing: 50) {
            Text("이미지를 선택해주세요!")
                .font(.title3)
                .fontWeight(.semibold)
            if let selectedImage = image {
                selectedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            } else {
                Rectangle()
                    .fill(.background)
                    .frame(width: 300, height: 300)
                    .border(Color.gray, width: 0.5)
            }
            Button {
                // 이미지 파일 -> 이미지 바이너리 파일 변환
                // Navigation 으로 결과 화면 이동 ( 변환 중에 loading View 보여줄 것 )
            } label: {
                 Text("나와 닮은 연예인 결과 보러가기")
                    .fontWeight(.semibold)
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // 카메라 촬영으로 이동해야 함
                } label: {
                    Image(systemName: "camera")
                        .fontWeight(.semibold)
                }
                .tint(Color.pink)
            }
            ToolbarItem(placement: .topBarTrailing) {
                PhotosPicker(selection: $selectedPhoto, matching: .images) {
                    Image(systemName: "photo.badge.plus")
                        .fontWeight(.semibold)
                }
                .tint(Color.pink)
                .task(id: selectedPhoto) {
                    image = try? await selectedPhoto?.loadTransferable(type: Image.self)
                }
            }
        }
        // Json 파싱 되는지 테스트
        .onAppear {
            TestViewController().viewDidLoad()
        }
    }
}

#Preview {
    SelectView()
}
