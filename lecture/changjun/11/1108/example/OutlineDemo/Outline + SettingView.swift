//
//  Outline + SettingView.swift
//  DemoProject2
//
//  Created by phang on 11/8/23.
//

import SwiftUI

struct OutlineSettingView: View {
    @State private var hybridState: Bool = false
    @State private var electricState: Bool = true
    @State private var fuelCellState: Bool = false
    @State private var colorInversionState: Bool = true
    @State private var filterExpanded: Bool = true
    
    var body: some View {
        Form {
            DisclosureGroup(isExpanded: $filterExpanded) {
                ToggleControl(title: "Hybrid Cars", state: hybridState)
                ToggleControl(title: "Electric Cars", state: electricState)
                ToggleControl(title: "Fuel Cell Cars", state: fuelCellState)
            } label: {
                Label("Categories Filters", systemImage: "car.2.fill")
            }
            
            DisclosureGroup {
                ColorControl(color: .red, label: "Background Color")
                ColorControl(color: .blue, label: "Foreground Color")
                ToggleControl(title: "Color Inversion", state: colorInversionState)
            }  label: {
                Label("Color Settings", systemImage: "scribble.variable")
            }
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
                .clipShape(.rect(cornerRadius: 5))
        }
        .padding(.leading)
    }
}

#Preview {
    OutlineSettingView()
}
