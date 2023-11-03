//
//  StateView.swift
//  DemoProject2
//
//  Created by phang on 10/13/23.
//

import SwiftUI

/**
 UI 내의 뷰들은 기본 데이터의 변경에 따른 처리 코드를 작성하지 않아도 뷰가 업데이트된다.
 이것은 데이터와 사용자 인터페이스(UI) 내의 뷰 사이에 게시자(publisher)와 구독자(subscriber)를 구축할 수 있다.
 >  UI의 모양과 동작을 결정하는 [상태 프로퍼티, Observable 객체, State 객체, Environment 객체]를 제공한다.
 */
struct StateView: View {
    @ObservedObject var demoData: DemoData = DemoData()
//    @StateObject var demoData: DemoData = DemoData()
    
    @State private var wifiEnabled = true
    @State private var userName = ""
    
    let speedSetting = SpeedSetting()
    
    var body: some View {
        Text("Bonjour! \(userName)")
            .font(.largeTitle)
            .padding(.bottom, 40)
        
        VStack(spacing: 20) {
            
            Text("\(demoData.currnetUser.isEmpty ? "Nobody" : demoData.currnetUser ) & \(demoData.userCount)")
            
            TextField("Enter User Name", text: $userName)
                .textFieldStyle(.roundedBorder)
            
            WifiImageView(wifiEnabled: $wifiEnabled)
            
            VStack {
                SpeedControlView()
                SpeedDisplayView()
            }
            .environmentObject(speedSetting)
            
        }.padding(.horizontal, 20)
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
        HStack(spacing: 20) {
            Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
            Toggle(isOn: $wifiEnabled, label: { Text("Enabled Wi-Fi") })
        }
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
    @Published var userCount = 0
    @Published var currnetUser = ""
    
    init() {
        updateData()
    }
    
    private func updateData() {
        
    }
}

/**
 # Environment 객체 p.211

 SwiftUI 환경에 저장되어 뷰에서 뷰로 전달할 필요없이 모든 자식 뷰가 접근할 수 있다.

 - @EnvironmentObject 프로퍼티 래퍼를 사용해서 구독
 - 작업을 수행하는 뷰의 상위 뷰에서 Observable 객체의 인스턴스 초기화
 - .en... 수정자를 사용해서 뷰 계층 구조에 인스턴스를 추가
 */
class SpeedSetting: ObservableObject {
    @Published var speed = 0.0
}

struct SpeedControlView: View {
    @EnvironmentObject var speedSetting: SpeedSetting
    
    var body: some View {
        Slider(value: $speedSetting.speed, in: 0...100)
    }
}

struct SpeedDisplayView: View {
    @EnvironmentObject var speedSetting: SpeedSetting
    
    var body: some View {
        Text("Speed = \(speedSetting.speed)")
    }
}

#Preview {
    StateView()
}
