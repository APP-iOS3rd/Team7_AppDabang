//
//  AddNewCar.swift
//  ListNavDemo
//
//  Created by lkh on 11/2/23.
//

import SwiftUI

// 새로운 자동차 정보를 추가하는 뷰 설계
struct AddNewCar: View {
    
    @StateObject var carStore: CarStore
    @Binding var path: NavigationPath       // <- 이전화면으로 돌아갈 수 있도록 내비게이션 경로 전달받음
    
    
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
                
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid")
                        .font(.headline)
                }
                .padding()
            } header: {
                Text("Car Details")
            }
            
            
        }
        
        Button {
            addNewCar()
        } label: {
            Text("Add Car")
        }
        
    }
    
    func addNewCar() {
        // 프로젝트 간략화를 위해 사진 라이브러리에서 사진을 가져오지 않고 기존 이미지를 재사용
        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybrid, imageName: "tesla_model_3")
        
        carStore.cars.append(newCar)
        
        // 차량 추가 후 내비게이션 경로에서 현재 뷰를 스택에서 꺼내고 이전 뷰로 돌아감
        path.removeLast()
    }
}

// 새로운 차량의 상세 정보 입력을 위한 하위 뷰를 선언
struct DataInput : View {
    
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle( RoundedBorderTextFieldStyle() )
        }
        .padding()
    }
}
