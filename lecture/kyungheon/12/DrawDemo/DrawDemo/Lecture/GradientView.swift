//
//  GradientView.swift
//  DrawDemo
//
//  Created by lkh on 12/19/23.
//

import SwiftUI

struct GradientView: View {

    let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple])

    var body: some View {
        ScrollView {
            VStack {
                Text("그레이디언트")
                Circle()
                    .fill(.blue.gradient)
                    .frame(width: 200, height: 200)

                Text("드롭 섀도")
                Circle()
                    .fill(.blue.shadow(.drop(color: .black, radius: 10)))
                    .frame(width: 200, height: 200)

                Text("이너 섀도")
                Circle()
                    .fill(.blue.shadow(.inner(color: .black, radius: 10)))
                    .frame(width: 200, height: 200)


                Text("방사형 그레이디언트")
                Circle()
                    .fill(RadialGradient(gradient: colors,
                                         center: .center,
                                         startRadius: CGFloat(0),
                                         endRadius: CGFloat(100)))
                    .frame(width: 200, height: 200)

                Text("원뿔형 그레이디언트")
                Circle()
                    .fill(AngularGradient(gradient: colors,
                                         center: .center))
                    .frame(width: 200, height: 200)

                Text("선형 그레이디언트")
                Circle()
                    .fill(LinearGradient(gradient: colors,
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
                    .frame(width: 200, height: 200)

                Text("fill, background 그레이디언트 적용")
                MyShape()
                    .fill(RadialGradient(gradient: colors,
                                         center: .center,
                                         startRadius: CGFloat(0),
                                         endRadius: CGFloat(300)))
                    .background(LinearGradient(gradient: colors,
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing))
                    .frame(width: 200, height: 200)
            }
            .padding()
        }
    }
}

#Preview {
    GradientView()
}
