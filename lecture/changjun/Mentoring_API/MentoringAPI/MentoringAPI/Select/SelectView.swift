//
//  SelectView.swift
//  MentoringAPI
//
//  Created by phang on 11/8/23.
//

import SwiftUI

struct SelectView: View {
    @State private var selectedPhoto: UIImage?
    @State private var isAlbumPresented = false
    @State private var isCameraPresented = false
    @State private var isShowAlert = false
    @State private var showResult = false
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(spacing: 40) {
            if let image = selectedPhoto {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
            } else {
                Text("이미지를 선택해주세요!")
                    .font(.title3)
                    .fontWeight(.semibold)
                Rectangle()
                    .fill(.background)
                    .frame(width: 250, height: 250)
                    .border(Color.pink, width: 0.3)
            }
            Button {
                if let _ = selectedPhoto {
                    router.path.append(Route.loadingView)
                    showResult = true
                } else {
                    isShowAlert.toggle()
                }
            } label: {
                Text("나와 닮은 연예인 결과 보러가기")
                    .padding(6)
                    .fontWeight(.semibold)
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text("Error"),
                      message: Text("이미지를 선택해주세요!"),
                      dismissButton: .default(Text("돌아가기")))
            }
        }
        .navigationDestination(isPresented: $showResult) {
            if let image = selectedPhoto {
                LoadingView(image: image)
            } else {
                EmptyView()
            }
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
    }
}

#Preview {
    SelectView().environmentObject(Router())
}
