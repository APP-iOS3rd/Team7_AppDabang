//
//  ObservableDemoSecondView.swift
//  DemoProject2
//
//  Created by phang on 10/26/23.
//

import SwiftUI

struct ObservableDemoSecondView: View {
    
    @EnvironmentObject var timerData: TimerData
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Divider()
                .padding(.vertical, 20)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.largeTitle)
        }
    }
}

#Preview {
    ObservableDemoSecondView().environmentObject(TimerData())
}
