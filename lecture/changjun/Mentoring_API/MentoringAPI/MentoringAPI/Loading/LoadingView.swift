//
//  LoadingView.swift
//  MentoringAPI
//
//  Created by phang on 11/16/23.
//

import SwiftUI

// 이미지 파일 -> 이미지 바이너리 파일 변환
// 변환 중 -> LoadingView
// 변환 완료 -> 네트워크 통신
// 통신 완료 -> ResultView
struct LoadingView: View {
    @State private var showResult = false
    @State private var responseData: CelebrityResponse?
    @EnvironmentObject var router: Router
    private let networkManager = NetworkManager()
    var image: UIImage
    
    var body: some View {
        VStack {
            Text("결과를 받아오는 중 입니다.")
                .modifier(SubTitle3())
            LoadingDots()
                .padding(.top, 60)
        }
        .onAppear {
            Task {
                do {
                    let imageData = try await imageToData()
                    let result = try await getImage(imageData)
                    print("responseData")
                    dump(result)
                    responseData = result
                    try await Task.sleep(nanoseconds: 1_500_000_000)
                    showResult = true
                } catch {
                    switch error {
                    case Errors.invalidImageData:
                        print("invalidImageData")
                    case Errors.invalidURL:
                        print("invalidURL")
                    case Errors.invalidResponse:
                        print("invalidResponse")
                    case Errors.invalidStatusCode(400):
                        print("invalidResponse 400")
                    case Errors.invalidStatusCode(500):
                        print("invalidResponse 500")
                    default: // alert & back
                        print("Alert plz")
                    }
                }
            }
        }
        .navigationDestination(isPresented: $showResult) {
            if let responseData = responseData {
                ResultView(result: responseData)
            } else {
                EmptyView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func imageToData() async throws -> Data {
        guard let resizedImage = image.resizeWithWidth(width: 700),
              let imageData = resizedImage.jpegData(compressionQuality: 1) else {
            throw Errors.invalidImageData
        }
        dump(imageData)
        return imageData
    }
    
    private func getImage(_ imageData: Data) async throws -> CelebrityResponse {
        let serverURL = "https://openapi.naver.com/v1/vision/celebrity"
        do {
            let result: CelebrityResponse = try await networkManager.request(fromURL: serverURL, imageData: imageData)
//            print("result")
//            dump(result)
            return result
        } catch Errors.invalidURL {
            throw Errors.invalidURL
        } catch Errors.invalidStatusCode(400) {
            throw Errors.invalidStatusCode(400)
        } catch Errors.invalidStatusCode(500) {
            throw Errors.invalidStatusCode(500)
        } catch Errors.invalidResponse {
            throw Errors.invalidResponse
        }
    }
}
