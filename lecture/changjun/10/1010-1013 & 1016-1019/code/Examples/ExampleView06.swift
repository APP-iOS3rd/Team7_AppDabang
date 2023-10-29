//
//  ExampleView06.swift
//  DemoProject2
//
//  Created by phang on 10/13/23.
//

import SwiftUI

// MARK: - ExampleView06
struct ExampleView06: View {
    let ex06Setting = ExampleView06Setting()
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Ex06TextView()
            Ex06TextChangeView()
            Ex06PickerView()
            
        }
        .environmentObject(ex06Setting)
        .padding(.horizontal, 20)
    }
}

// MARK: - ObservableObject - ExampleView06Setting
class ExampleView06Setting: ObservableObject {
    @Published var colorIndex = 0
    @Published var degree: Double = 0
    @Published var text = ""
    @Published var colors: [Color] = [.black, .blue, .pink, .yellow, .mint]
}

// MARK: - Text
struct Ex06TextView: View {
    @EnvironmentObject var ex06Setting: ExampleView06Setting
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text(ex06Setting.text.isEmpty ? "BonJour!" : ex06Setting.text)
                .font(.largeTitle)
                .fontWeight(.bold)
                .rotationEffect(.degrees(ex06Setting.degree))
                .animation(.easeInOut(duration: 1.5), value: ex06Setting.degree)
                .foregroundStyle(ex06Setting.colors[ex06Setting.colorIndex])
            
            Spacer()
            Divider()
                .frame(height: 1)
                .background(ex06Setting.colors[ex06Setting.colorIndex])
        }
    }
}

// MARK: - Text 돌리기 + 작성
struct Ex06TextChangeView: View {
    @EnvironmentObject var ex06Setting: ExampleView06Setting
    
    var body: some View {
        VStack(spacing: 20) {
            Slider(value: $ex06Setting.degree, in: 0...360, step: 0.1)
                .tint(ex06Setting.colors[ex06Setting.colorIndex])
            
            TextField("Enter Text Here", text: $ex06Setting.text)
                .textFieldStyle(.roundedBorder)
                .foregroundStyle(ex06Setting.colors[ex06Setting.colorIndex])
        }
    }
}

// MARK: - Text Color Picker 뷰
struct Ex06PickerView: View {
    @EnvironmentObject var ex06Setting: ExampleView06Setting
    
    let colorNames = ["Black", "Blue", "Pink", "Yellow", "Mint"]

    var body: some View {
        VStack {
            Picker(selection: $ex06Setting.colorIndex, label: Text("Color Pick")) {
                ForEach (0..<colorNames.count, id: \.self) {
                    Text(colorNames[$0])
                        .foregroundStyle(ex06Setting.colors[ex06Setting.colorIndex])
                }
            }
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(ex06Setting.colors[ex06Setting.colorIndex], lineWidth: 0.5))
            .pickerStyle(.wheel)
        }
    }
}

#Preview {
    ExampleView06()
}

