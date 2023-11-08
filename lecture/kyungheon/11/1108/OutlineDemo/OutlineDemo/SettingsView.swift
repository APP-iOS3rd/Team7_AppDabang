//
//  SettingsView.swift
//  OutlineDemo
//
//  Created by lkh on 11/8/23.
//

/**
 # DisclosureGroup

 구조화되지 않은 항목들을 닫거나 펼칠 수 있도록 디스클로저 컨트롤을 제공
 */

import SwiftUI

struct SettingsView: View {
    @State private var hybridState: Bool = false
    @State private var electricState: Bool = true
    @State private var fuelCellState: Bool = false
    @State private var inversionState: Bool = true

    // 최초 표시될 때 확장 모드로 표시되도록
    // DisclosureGroup의 isExpanded: 초기화 매개변수에 설정
    @State private var filtersExpanded: Bool = true

    var body: some View {
        // DisclosureGroup 적용
        Form {
            DisclosureGroup(isExpanded: $filtersExpanded) {
                ToggleControl(title: "Hybrid Cars", state: hybridState)
                ToggleControl(title: "Electric Cars", state: electricState)
                ToggleControl(title: "Fuel Cell Cars", state: fuelCellState)
            } label: {
                Label("Categories Filters", systemImage: "car.2.fill")
            }

            DisclosureGroup {
                ColorControl(color: .red, label: "Background Color")
                ColorControl(color: .blue, label: "Foreground Color")
                ToggleControl(title: "Color Inversion", state: inversionState)
            } label: {
                Label("Color Settings", systemImage: "scribble.variable")
            }
        }
    }
}

struct ColorControl: View {
    var color: Color
    var label: String

    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Rectangle()
                .fill(color)
                .frame(width: 30, height: 30)
        }
    }
}

struct ToggleControl: View {
    var title: String
    @State var state: Bool

    var body: some View {
        Toggle(title, isOn: $state)
            .padding(.leading)
    }
}

#Preview {
    SettingsView()
}
