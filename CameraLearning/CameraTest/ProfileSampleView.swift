//
//  ProfileSampleView.swift
//  CameraLearning
//
//  Created by cmStudent on 2025/04/13.
//

import SwiftUI

struct ProfileSampleView: View {
    @StateObject private var vm = UserModel()
    @StateObject private var cmvm = CameraViewModel()
    
    var body: some View {
        VStack {
            //iconを表示
            Image(uiImage: vm.icon ?? UIImage(systemName: "person.crop.circle")!)
                .resizable()
                .frame(width: 100, height: 100)
            Button {
                //カメラ起動
                cmvm.showDialog = true
            } label: {
                Text("編集する")
                    .underline()
            }
            ProfileFormat(title: $vm.infoList[0], text: $vm.userEmail)
            ProfileFormat(title: $vm.infoList[1], text: $vm.userName)
        }
        .confirmationDialog("", isPresented: $cmvm.showDialog, titleVisibility: .hidden) {
            Button {
                cmvm.showCamera = true
            } label: {
                Text("カメラ")
            }
            
            Button {
                cmvm.showLibrary = true
            } label: {
                Text("ライブラリ")
            }

            Button("キャンセル",role: .cancel) {
                cmvm.showDialog = false
            }
        }
        .fullScreenCover(isPresented: $cmvm.showCamera) {
            CameraTestView(icon: $vm.icon)
                .ignoresSafeArea()
        }
        .sheet(isPresented: $cmvm.showLibrary) {
            
        }
    }
}

extension ProfileSampleView {
    @ViewBuilder
    func ProfileFormat(title:Binding<String>,text:Binding<String>) -> some View {
        VStack {
            HStack(alignment: .center) {
                Text(title.wrappedValue)
                    .frame(width: 100, alignment: .leading)
                    .foregroundColor(.gray)
                Text(text.wrappedValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

class UserModel:ObservableObject {
    @Published var userEmail:String = ""
    @Published var userName:String = ""
    @Published var icon:UIImage?
    
    var infoList = ["メール","ニックネーム"]
}

#Preview {
    ProfileSampleView()
}
