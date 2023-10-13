//
//  stateView.swift
//  DemoProject
//
//  Created by lkh on 10/13/23.
//

import SwiftUI

/**
 UI 내의 뷰들은 기본 데이터의 변경에 따른 처리 코드를 작성하지 않아도 뷰가 업데이트된다.

 이것은 데이터와 사용자 인터페이스(UI) 내의 뷰 사이에 게시자(publisher)와 구독자(subscriber)를 구축할 수 있다.

 >  UI의 모양과 동작을 결정하는 [상태 프로퍼티, Observable 객체, State 객체, Environment 객체]를 제공한다.
 */

struct stateView: View {
    // Observable 객체를 구독하기 위해 @ObservedObject 또는 @StateObject 프로퍼티 래퍼를 사용
    @ObservedObject var demoData: DemoData = DemoData()

    // @State 프로퍼티 래퍼 이용
    @State private var wifiEnabled = true
    @State private var userName = ""

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack {
            Text("\(demoData.currentUser), you \(demoData.userCount)")

            // 프로퍼티 이름 앞 '$' : 상태 프로퍼티와 바인딩(연결)
            Toggle(isOn: $wifiEnabled, label: {
                Text("Enable Wi-Fi")
            })
            TextField("Enter user name", text: $userName)

            // 상태 프로퍼티에 할당된 값을 참조할 때는 '$' 없이 사용
            Text( userName )
//            Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")

            // 하위 뷰가 호출될 때 상태 프로퍼티에 대한 바인딩을 전달
            WifiImageView(wifiEnabled: $wifiEnabled)
        }
    }
}

/**
 # State 바인딩

 하위뷰로 분리되어 있는 상황에 동일한 상태 프로퍼티에 대해 접근해야 하는 경우

 > @Binding 프로퍼티 래퍼를 이용하여 해결
 */
struct WifiImageView: View {
    @Binding var wifiEnabled: Bool
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
    }
}

/**
 # Observable 객체

 여러 다른 뷰들이 외부에서 접근할 수 있는 지속적인 데이터 표현을 위해 사용

 - ObservableObject 프로토콜을 따르는 클래스나 구조체 형태를 취함
 - 일반적으로 시간에 따라 변경되는 하나 이상의 데이터 값을 모으고 관리하는 역할을 담당

 @StateObject 프로퍼티 래퍼
  - @ObservedObject 래퍼의 대안
  - 상태 객체와 다르게 관찰되는 객체 참조는 그것을 선언한 뷰가 소유하지 않으므로 사용되는 동안에 (예, 뷰의 재렌더링) SwiftUI 시스템에 의해 파괴되거나 다시 생성될 위험이 있다.
  - @StateObject 를 사용하면 참조가 선언한 뷰가 참조를 소유하므로, 해당 참조가 선언된 뷰에 의해 계속해서 필요로 하는 동안에 유지된다.

 */
class DemoData: ObservableObject {
    // @Published 프로퍼티 래퍼를 이용하여 프로퍼티를 게시
    @Published var userCount = 0
    @Published var currentUser = ""

    init() {
        // 데이터 초기화 코드
        updateData()
    }

    func updateData() {
        // 데이터를 최신 상태로 유지위한 코드
    }

}
#Preview {
    stateView()
}
