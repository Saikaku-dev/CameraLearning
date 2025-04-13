//
//  CameraTestView.swift
//  CameraLearning
//
//  Created by cmStudent on 2025/04/13.
//

import SwiftUI

struct CameraTestView: UIViewControllerRepresentable {
    
    @Binding var icon: UIImage?
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera //设置来源为相机 //.photoLibrary为相册
        picker.delegate = context.coordinator //接受拍照或取消的结果
        picker.allowsEditing = true //编辑拍照后的图片
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    //创建配合SwiftUI使用UIKit的桥梁类[协调器]
    class Coordinator:NSObject,UINavigationControllerDelegate,
                      UIImagePickerControllerDelegate {
        let parent: CameraTestView
        
        init(_ parent: CameraTestView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.icon = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
