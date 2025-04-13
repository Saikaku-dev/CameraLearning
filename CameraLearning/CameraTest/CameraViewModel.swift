//
//  CameraViewModel.swift
//  CameraLearning
//
//  Created by cmStudent on 2025/04/13.
//

import Foundation

class CameraViewModel:ObservableObject {
    @Published var showDialog:Bool = false
    @Published var showCamera:Bool = false
    @Published var showLibrary:Bool = false
}
