//
//  ListNavDemoView.swift
//  ListNavDemo
//
//  Created by lkh on 11/2/23.
//

import SwiftUI

// 사용자 인테페이스 콘텐트 뷰 설계
struct ListNavDemoView: View {
    @StateObject var carStore = CarStore(cars: carData)
    @State private var stackPath = NavigationPath()     // <- 내비게이션 경로 추가
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (0..<carStore.cars.count, id: \.self) { i in
                    NavigationLink(value: i) {
                        ListCell(car: carStore.cars[i])
                    }
                }
            }
            .navigationDestination(for: Int.self) { i in
                CarDetailView(selectedCar: carStore.cars[i])
            }
            .navigationDestination(for: String.self) { _ in
                AddNewCar(carStore: self.carStore, path: $stackPath)    // <- 추가화면에서 돌아올 수 있도록 내비게이션 경로 전달
            }
            .navigationTitle(Text("Ev Cars"))
            .toolbar {
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    NavigationLink(value: "Add Car") {
                        Text("Add")
                    }
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
}

// 하위 뷰로 추출
struct ListCell: View {
    var car: Car
    
    var body: some View {
        HStack {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            Text(car.name)
        }
    }
}


#Preview {
    ListNavDemoView()
}
