//
//  PhotoPickerSampleView.swift
//  DemoProject2
//
//  Created by phang on 11/3/23.
//

import SwiftUI
import PhotosUI

struct PhotoPickerSampleView: View {
    
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var image: Image?
    var body: some View {
        NavigationStack {
            ZStack {
                image?
                    .resizable()
                    .scaledToFit()
                
            }
            .toolbar {
                PhotosPicker(selection: $selectedPhoto, matching: .images) {
                    Image(systemName: "photo.fill")
                }
            }
            .task(id: selectedPhoto) {
                image = try? await selectedPhoto?.loadTransferable(type: Image.self)
            }
        }
    }
}

#Preview {
    PhotoPickerSampleView()
}
