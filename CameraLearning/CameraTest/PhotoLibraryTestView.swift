//
//  PhotoLibraryTestView.swift
//  CameraLearning
//
//  Created by cmStudent on 2025/04/13.
//

import SwiftUI
import PhotosUI

struct PhotoLibraryTestView:UIViewControllerRepresentable {
    @Binding var icon: UIImage?
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator:NSObject,PHPickerViewControllerDelegate {
        let parent: PhotoLibraryTestView
        
        init(_ parent: PhotoLibraryTestView) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            guard let provider = results.first?.itemProvider else { return }
            
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    DispatchQueue.main.async {
                        self.parent.icon = image as? UIImage
                    }
                }
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
