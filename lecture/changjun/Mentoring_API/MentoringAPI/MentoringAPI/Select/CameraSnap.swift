//
//  CameraSnap.swift
//  MentoringAPI
//
//  Created by phang on 11/16/23.
//

import SwiftUI
import UIKit

// MARK: - UIKit 의 UIImagePickerController 를 사용하기 위함
struct CameraSnap: UIViewControllerRepresentable {
    @Binding var selectedPhoto: UIImage?
    @Binding var isCameraPresented: Bool

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraSnap
        init(parent: CameraSnap) {
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedPhoto = uiImage
            }
            parent.isCameraPresented = false
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isCameraPresented = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraSnap>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType =  .camera
        picker.allowsEditing = true
        picker.cameraFlashMode = .auto
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CameraSnap>) {
        //
    }
}
