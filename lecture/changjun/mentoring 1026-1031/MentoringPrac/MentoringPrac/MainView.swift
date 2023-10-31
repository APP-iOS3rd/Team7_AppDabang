//
//  MainView.swift
//  MentoringPrac
//
//  Created by phang on 10/29/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var loginUserData: LoginUserData
    
    var body: some View {
        VStack {
            Text("Hi, \(loginUserData.userName ?? "????") - !")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    MainView().environmentObject(LoginData())
}
