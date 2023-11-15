//
//  SelectView.swift
//  MentoringAPI
//
//  Created by phang on 11/8/23.
//

import SwiftUI
import PhotosUI

struct SelectView: View {
    @State private var selectedPhoto: UIImage?
    @State private var isAlbumPresented = false
    @State private var isCameraPresented = false
    
    var body: some View {
        VStack(spacing: 50) {
            Text("이미지를 선택해주세요!")
                .font(.title3)
                .fontWeight(.semibold)
            if let image = selectedPhoto {
                Image(uiImage: image)
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
                    isCameraPresented.toggle()
                } label: {
                    Image(systemName: "camera")
                        .fontWeight(.semibold)
                }
                .sheet(isPresented: $isCameraPresented) {
                    CameraSnap(selectedPhoto: $selectedPhoto,
                               isCameraPresented: $isCameraPresented)
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isAlbumPresented.toggle()
                } label: {
                    Image(systemName: "photo")
                        .fontWeight(.semibold)
                }
                .sheet(isPresented: $isAlbumPresented) {
                    PhotoPicker(selectedPhoto: $selectedPhoto,
                                isAlbumPresented: $isAlbumPresented)
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
