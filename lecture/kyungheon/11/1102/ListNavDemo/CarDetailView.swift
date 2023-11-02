//
//  CarDetailView.swift
//  ListNavDemo
//
//  Created by lkh on 11/2/23.
//

import SwiftUI

struct CarDetailView: View {
    let selectedCar: Car

    var body: some View {
        Form {
            Section {
                Image(selectedCar.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()

                Text(selectedCar.name)
                    .font(.headline)

                Text(selectedCar.description)
                    .font(.body)

                HStack {
                    Text("Hybrid").font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ?  "checkmark.circle" : "xmark.circle")
                }
            } header: {
                Text("Car Details")
            }

        }
    }}

#Preview {
    CarDetailView(selectedCar: carData[0])
}
