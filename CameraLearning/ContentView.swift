//
//  ContentView.swift
//  CameraLearning
//
//  Created by cmStudent on 2025/04/13.
//

import SwiftUI

struct ContentView: View {
    
    @State var image: UIImage?
    @State private var showImagePickerDialog = false
    @State private var showCamera: Bool = false
    @State private var showLibrary: Bool = false
    @State private var icon:UIImage?
    
    var body: some View {
        
        VStack {
            Button(action: {
                showImagePickerDialog = true
            }) {
                Text("編集する")
                    .underline()
            }
        }
        .sheet(isPresented: $showLibrary) {
            PhotoLibraryPickerView(image: Binding(
                get: { icon },
                set: { icon = $0 }
            ))
        }
        .fullScreenCover(isPresented: $showCamera) {
            CameraCaptureView(image: $image)
                .ignoresSafeArea()
        }
        .confirmationDialog("",isPresented: $showImagePickerDialog,titleVisibility: .hidden) {
            Button {
                showCamera = true
            } label: {
                Text("カメラで撮る")
            }
            Button {
                showLibrary = true
            } label: {
                Text("アルバムから選ぶ")
            }
            Button("キャンセル", role: .cancel) {
                showImagePickerDialog = false
            }
        }
    }
}

#Preview {
    ContentView()
}
