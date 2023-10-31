//
//  ExerciseView24.swift
//  DemoProject2
//
//  Created by phang on 10/30/23.
//

import SwiftUI

struct ExerciseView24: View {
    var body: some View {
        VStack {
            HStack(alignment: VerticalAlignment.top) {
                Circle()
                    .fill(Color.green)
                    .frame(width: 50, height: 50)
                    .alignmentGuide(VerticalAlignment.top, computeValue: { d in
                        d.height
                    })
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 50, height: 50)
                Circle()
                    .fill(Color.orange)
                    .frame(width: 50, height: 50)
                    .alignmentGuide(VerticalAlignment.top, computeValue: { d in
                        -d.height
                    })
            }
        }
    }
}

#Preview {
    ExerciseView24()
}
