//
//  WebView.swift
//  DemoProject2
//
//  Created by phang on 10/12/23.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    
    var urlToLoad: String
    
    func makeUIView(context: Context) -> WKWebView {
        
        // unwrapping
         guard let url = URL(string: self.urlToLoad) else {
             return WKWebView()
         }
         // 웹뷰 인스턴스 생성
         let webView = WKWebView()
         
         // 웹뷰 로드
         webView.load(URLRequest(url: url))
         return webView
    }
    
    // 업데이트 ui view
    func updateUIView(_ uiView: WKWebView,
                      context: UIViewRepresentableContext<MyWebView>) {
    }
}

#Preview {
    MyWebView(urlToLoad: "https://github.com/APP-iOS3rd/Team7_AppDabang")
}
