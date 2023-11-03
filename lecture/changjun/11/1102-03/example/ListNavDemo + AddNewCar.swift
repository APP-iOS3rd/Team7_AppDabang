//
//  ListNavDemo + AddNewCar.swift
//  DemoProject2
//
//  Created by phang on 11/2/23.
//

import SwiftUI

// MARK: - 정보 추가 view

struct AddNewCar: View {
    @StateObject var carStore: CarStore
    @Binding var path: NavigationPath
    @State private var isHybrid = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            Section {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid")
                        .font(.headline)
                }
                .padding()
            } header: {
                Text("Car Detail")
            }
            Button("Add Car") {
                addNewCar()
            }
        }
    }
    
    private func addNewCar() {
        let newCar = Car(id: UUID().uuidString,
                         name: self.name,
                         description: self.description,
                         isHybrid: self.isHybrid,
                         imageName: "bmw_x6")
        carStore.cars.append(newCar)
        path.removeLast()
    }
}

// MARK: - 정보 입력 하위 뷰

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}



//#Preview {
//    AddNewCar(carStore: CarStore(cars: carData))
//}
