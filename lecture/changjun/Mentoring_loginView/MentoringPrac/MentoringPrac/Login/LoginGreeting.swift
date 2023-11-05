//
//  GreetingView.swift
//  MentoringPrac
//
//  Created by phang on 10/31/23.
//

import SwiftUI

// MARK: - Login Greetings

struct LoginGreeting: View {
    var body: some View {
        VStack {
            Text(Texts.loginGreetings.rawValue)
                .font(.system(size: Texts.loginGreetings.size))
                .fontWeight(.bold)
                .padding(.vertical, 40)
                .foregroundStyle(Color.mtMainText)
        }
    }
}

#Preview {
    LoginGreeting()
}
