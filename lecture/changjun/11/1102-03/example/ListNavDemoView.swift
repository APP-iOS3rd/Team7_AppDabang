//
//  ListNavDemoView.swift
//  DemoProject2
//
//  Created by phang on 11/2/23.
//

import SwiftUI

// MARK: - 챕터 31 [ ListDemo ]

struct ListNavDemoView: View {
    @StateObject var carStore = CarStore(cars: carData)
    @State private var stackPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                ForEach (0..<carStore.cars.count, id: \.self) { idx in
                    NavigationLink(value: idx) {
                        ListCell(car: carStore.cars[idx])
                    }
                }
                .onDelete(perform: deleteItems )
                .onMove(perform: moveItems )
            }
            .navigationDestination(for: Int.self) { idx in
                CarDetail(selectedCar: carStore.cars[idx])
            }
            .navigationDestination(for: String.self) { _ in
                AddNewCar(carStore: self.carStore, path: $stackPath)
            }
            .navigationTitle(Text("EV Cars"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(value: "Add Car") {
                        Text("Add")
//                            .foregroundStyle(Color.blue)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    
    private func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}

// MARK: - 리스트 셀 뷰

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
