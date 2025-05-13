//
//  ActivityView.swift
//  CameraLearning
//
//  Created by cmStudent on 2025/05/12.
//

import SwiftUI
import UIKit

struct ActivityView: UIViewControllerRepresentable {
    let shareItem: [Any]
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIActivityViewController(activityItems: shareItem,
                                                  applicationActivities: nil)
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
