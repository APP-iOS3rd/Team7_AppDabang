//
//  ObservableDemoView.swift
//  DemoProject2
//
//  Created by phang on 10/26/23.
//

/**
 # Observable 객체는 시간이 지남에 따라 반복적으로 변하는 데이터 값인 동적 데이터를 래핑하는데 사용

 - Foundation 프레임워크의 Timer 객체를 사용하여 매 초마다 카운트

 - ObservableObject 프로토콜을 구현하는 것으로 선언
 - Timer 인스턴스는 매초 timerDidFire() 함수를 호출
 - timerDidFire() 함수는 timeCount 변수에 값을 증가
 - timeCount 변수는 @Published 프로퍼티 래퍼를 사용하여 선언, 프로젝트 내에 있는 뷰에서 관찰 가능

 ObservableObject 에 접근하는 첫 번째 화면 구성
 - @ObservedObject 프로퍼티 래퍼의 대안으로
 - @State 상태 객체와 다르게 관찰되는 되는 객체 참조는 그것을 선언한 뷰가 소유하지 않으므로
        사용되는 동안에 (예, 뷰의 재랜더링) SwiftUI 시스템에 의해 파괴되거나 다시 생성될 위험이 있다.
 - @StateObject 를 사용하면 참조를 선언한 뷰가 소유하므로,
        해당 참조가 선언된 뷰에 의해 계속해서 필요로 하는 동안 유지된다.

 Observable 객체를 Environment 객체로 변환(전환)
 - 두 개의 뷰 모두가 동일한 TimerData 샛체에 대한 참조를 전달하지 않아도 접근이 가능
 - NavigationView .environmentObject(timerData) 수정자를 추가하여
        timerData 인스턴스를 뷰 계층 환경에 등록
 - timerData 가 더이상 두 번째 화면에 전달되지 않도록 네비게이션 링크의 destination: 을 수정(데이터 전달 삭제)
 - 두 번째 뷰의 @StateObject 프로퍼티 래퍼를 사용한 변수를 @EnvironmentObject 프로퍼티 래퍼로 수정
 */

import SwiftUI

struct ObservableDemoView: View {
    
    @StateObject var timerData: TimerData = TimerData()
    
    var body: some View {
            VStack {
                Text("시간 카운터 = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button("시간 초기화") {
                    timerData.resetCount()
                }
                .buttonStyle(.borderedProminent)
                
                Divider()
                    .padding(.vertical, 20)
                
                NavigationLink(destination: ObservableDemoSecondView().environmentObject(timerData)) {
                    Text("Next Screen")
                }
            }
    }
}

#Preview {
    ObservableDemoView()
}
