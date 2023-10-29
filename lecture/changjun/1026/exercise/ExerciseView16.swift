//
//  ExerciseView16.swift
//  DemoProject2
//
//  Created by phang on 10/26/23.
//

import SwiftUI

struct ExerciseView16: View {

    @StateObject var myColor: ColorThemeData = ColorThemeData()
    
    @AppStorage("mybgcolor") var bgcolor = ""
    
    var body: some View {
        ZStack {
            myColor.color.ignoresSafeArea(.all)
            
            VStack {
                ColorPicker("Change Scene BGColor",
                            selection: Binding(get: { myColor.color },
                                               set: { newValue in
                                                        bgcolor = updateBGColorAppStorage(color: newValue)
                                                        myColor.color = newValue
                                                    }))
                
                Divider()
                    .frame(height: 3)
                    .background(Color.black)
                    .padding(.vertical, 40)
                
                NavigationLink(destination: SecondExerciseView16().environmentObject(myColor)) {
                    Text("Go Second Scene!")
                }

            }
            .padding(20)
            .onAppear {
                if (!bgcolor.isEmpty) {
                    let rgbArr = bgcolor.components(separatedBy: ",")
                    if let red = Double(rgbArr[0]),
                       let green = Double(rgbArr[1]),
                       let blue = Double(rgbArr[2]),
                       let alpha = Double(rgbArr[3]) {
                        myColor.color = Color(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
                    }
                }
            }
        }
    }
    
    func updateBGColorAppStorage(color: Color) -> String {
        let uiColor = UIColor(color)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return "\(red),\(green),\(blue),\(alpha)"
    }
    
    
}

class ColorThemeData: ObservableObject {
    @Published var color: Color = Color(.sRGB, red: 1, green: 1, blue: 1)
}

struct RGBColor: Codable {
    let red: Double
    let green: Double
    let blue: Double
    let opacity: Double
}

#Preview {
    ExerciseView16()
}
