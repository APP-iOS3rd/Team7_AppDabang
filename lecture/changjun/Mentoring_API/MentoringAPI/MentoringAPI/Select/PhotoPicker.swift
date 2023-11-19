//
//  PhotoPicker.swift
//  MentoringAPI
//
//  Created by phang on 11/15/23.
//

import SwiftUI
import PhotosUI

// MARK: - PHPickerViewController 를 사용
struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var selectedPhoto: UIImage?
    @Binding var isAlbumPresented: Bool

    class Coordinator: PHPickerViewControllerDelegate {
        private let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    DispatchQueue.main.async {
                        self.parent.selectedPhoto = image as? UIImage
                    }
                }
            }
            parent.isAlbumPresented = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        configuration.preferredAssetRepresentationMode = .current
        //        configuration.preselectedAssetIdentifiers = selectedPhoto
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        //
    }
}
