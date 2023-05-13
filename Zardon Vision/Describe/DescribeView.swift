//
//  DescribeView.swift
//  Zardon Vision
//
//  Created by Alaap Joshi on 5/13/23.
//

import SwiftUI
struct DescribeView: View {
    @State private var capturedImage: UIImage?
    @State private var showCameraView = false
    var body: some View {
        VStack {
            if let image = capturedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("No image captured")
                    .padding(30)
                Text("Remember to turn on your ringer!")

            }
            
            Button("Take Photo") {
                self.showCameraView = true
            }
        }
        .sheet(isPresented: $showCameraView) {
            CameraView(capturedImage: self.$capturedImage)
        }
    }
}
struct DescribeView_Previews: PreviewProvider {
    static var previews: some View {
        DescribeView()
    }
}
