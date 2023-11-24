//
//  ViewController.swift
//  CameraDemo
//
//  Created by lkh on 11/24/23.
//

import UIKit

import MobileCoreServices
import UniformTypeIdentifiers

import AVKit
import AVFoundation

class ViewController: UIViewController,
                        UIImagePickerControllerDelegate,
                        UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    
    // 뒷 부분에서 필요할 Boolean 속성 선언
    var newMeida: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func useCamera(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            
            let imagePicker = UIImagePickerController()

            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.mediaTypes = [UTType.image.identifier]
            imagePicker.allowsEditing = false

            self.present(imagePicker, animated: true, completion: nil)
            
            newMeida = true
        }
        
    }
    
    @IBAction func useCameraRoll(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum) {
            
            let imagePicker = UIImagePickerController()

            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.mediaTypes = [UTType.image.identifier]
            imagePicker.allowsEditing = false

            self.present(imagePicker, animated: true, completion: nil)
            
            newMeida = false
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // UIImagePickerController.InfoKey.mediaType
        let mediaType = info[.mediaType] as! NSString
        
        self.dismiss(animated: true, completion: nil)
        
        if mediaType.isEqual(to: UTType.image.identifier) {
            let image = info[.originalImage] as! UIImage
            
            imageView.image = image
            
            if (newMeida == true) {
                UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
                
                // 오류가 발생하면 경고 상자를 통해 사용자에게 보고하고 싶은 경우
                // UIImageWriteToSavedPhotosAlbum(image, self, #selector(ViewController.image(image:didFinishSavingWithError:contextInfo:)), nil)
            }
            
        }
    }
    
    // 오류가 발생하면 경고 상자를 통해 사용자에게 보고
    @objc func image(image: UIImage, 
                     didFinishSavingWithError error: NSErrorPointer,
                     contextInfo: UnsafeRawPointer) {
        if error != nil {
            let alert = UIAlertController(title: "Save Failed",
                                          message: "Failed to save image",
                                          preferredStyle: .alert) // UIAlertController.Style.alert
            let cancelAction = UIAlertAction(title: "OK",
                                             style: .cancel,
                                             handler: nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dest = segue.destination as! AVPlayerViewController
        let url = URL(string: "https://www.ebookfrenzy.com/ios_book/movie/movie.mov")
        
        if let movieURL = url {
            dest.player = AVPlayer(url: movieURL)
        }
    }
    
}

