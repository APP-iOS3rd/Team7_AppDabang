//
//  ListNavDemo + CarDetail.swift
//  DemoProject2
//
//  Created by phang on 11/2/23.
//

import SwiftUI

// MARK: - detail view

struct CarDetail: View {
    let selectedCar: Car
    
    var body: some View {
        Form {
            Section {
                Image(selectedCar.imageName)
                    .resizable()
                    .clipShape(.rect(cornerRadius: 12))
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text(selectedCar.name)
                    .font(.headline)
                Text(selectedCar.description)
                    .font(.body)
                HStack {
                    Text("Hybrid")
                        .font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ? 
                          "checkmark.circle" : "xmark.circle")
                }
            } header: {
                Text("Car Details")
            }
        }
    }
}

#Preview {
    CarDetail(selectedCar: carData[0])
}
