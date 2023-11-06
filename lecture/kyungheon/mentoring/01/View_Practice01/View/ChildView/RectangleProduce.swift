//
//  RectangleProduce.swift
//  View_Practice01
//
//  Created by lkh on 11/6/23.
//

import SwiftUI

// MARK: pw 절차
struct RectangleProduce: View {
    @EnvironmentObject var viewModel: LoginViewModel

    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            RoundedRectangle(cornerRadius: 20)
                .fill(viewModel.rectangColor.0)
            RoundedRectangle(cornerRadius: 20)
                .fill(viewModel.rectangColor.1)
            RoundedRectangle(cornerRadius: 20)
                .fill(viewModel.rectangColor.2)
            RoundedRectangle(cornerRadius: 20)
                .fill(viewModel.rectangColor.3)
        }
        .padding(.horizontal)
    }
}

