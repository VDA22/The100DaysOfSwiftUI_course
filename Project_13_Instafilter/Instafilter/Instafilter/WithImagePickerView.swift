//
//  WithImagePickerView.swift
//  Instafilter
//
//  Created by Darya Viter on 23.06.2022.
//

import SwiftUI

struct WithImagePickerView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()

            Button("Select image") {
                showingImagePicker = true
            }

            Button("Save Image") {
                guard let inputImage = inputImage else { return }

                let imageSaver = ImageSaver()
                imageSaver.wrightToPhotoAlbum(image: inputImage)
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage() }
    }

    private func loadImage() {
        guard let inputImage = inputImage else { return }

        image = Image(uiImage: inputImage)
    }
}

struct WithImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        WithImagePickerView()
    }
}
