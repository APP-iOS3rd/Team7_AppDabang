//
//  AppStorageView.swift
//  DemoProject2
//
//  Created by phang on 10/26/23.
//

import SwiftUI

struct UserName: Encodable, Decodable {
    var firstName: String
    var secondName: String
}

struct AppStorageView: View {

    @AppStorage("mytext") var editorText = "Sample Text"
    @AppStorage("username") var namestore: Data = Data()
    
    @State var username = UserName(firstName: "", secondName: "")
    
    var body: some View {
        
        VStack {
            HStack {
                TextField("first name", text: $username.firstName)
                    .textFieldStyle(.roundedBorder)
                    .onAppear {
                        let decoder = JSONDecoder()
                        if let name = try? decoder.decode(UserName.self, from: namestore) {
                            username = name
                //            editorText = "\(name.firstName) & \(name.secondName)"
                        }
                    }
                TextField("second name", text: $username.secondName)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            
            Button("username save") {
                let encoder = JSONEncoder()
                if let data = try? encoder.encode(username) {
                    namestore = data
//                    editorText = data.base64EncodedString()
                }
            }
            .buttonStyle(.borderedProminent)
            
            TextEditor(text: $editorText)
                .padding()
                .font(.largeTitle)
        }
        .background(Color.yellow)
    }
}

#Preview {
    AppStorageView()
}
