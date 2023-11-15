//
//  PhotoPicker.swift
//  MentoringAPI
//
//  Created by phang on 11/15/23.
//

import SwiftUI
import UIKit

// MARK: - UIKit 의 UIImagePickerController 를 사용하기 위함
struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var selectedPhoto: UIImage?
    @Binding var isAlbumPresented: Bool

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: PhotoPicker
        init(parent: PhotoPicker) {
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedPhoto = uiImage
            }
            parent.isAlbumPresented = false
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isAlbumPresented = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType =  .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<PhotoPicker>) {
        //
    }
}
