//
//  CoreImageView.swift
//  Instafilter
//
//  Created by Darya Viter on 22.06.2022.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct CoreImageView: View {
    @State private var image: Image?

        var body: some View {
            VStack {
                image?
                    .resizable()
                    .scaledToFit()
            }
            .onAppear(perform: loadImage)
        }

        func loadImage() {
            guard let inputImage = UIImage(named: "Example") else { return }

            let beginImage = CIImage(image: inputImage)

            let contex = CIContext()
            let sepiaFilter = CIFilter.sepiaTone()
            sepiaFilter.inputImage = beginImage
            sepiaFilter.intensity = 1

            let pixelFilter = CIFilter.pixellate()
            pixelFilter.inputImage = beginImage
            pixelFilter.scale = 100

            let crystallizeFilter = CIFilter.crystallize()
            crystallizeFilter.inputImage = beginImage
            crystallizeFilter.radius = 100

            let twirlDistortionFilter = CIFilter.twirlDistortion()
            twirlDistortionFilter.inputImage = beginImage
            twirlDistortionFilter.radius = 300
            twirlDistortionFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)

            // using a value from outside
            let amount = 1.0
            let inputKeys = pixelFilter.inputKeys
            if inputKeys.contains(kCIInputIntensityKey) {
                pixelFilter.setValue(amount, forKey: kCIInputIntensityKey)
            }
            if inputKeys.contains(kCIInputRadiusKey) {
                pixelFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
            }
            if inputKeys.contains(kCIInputScaleKey) {
                pixelFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
            }

            guard let outputImage = twirlDistortionFilter.outputImage else { return }
            if let cgimg = contex.createCGImage(outputImage, from: outputImage.extent) {
                let uiImage = UIImage(cgImage: cgimg)
                image = Image(uiImage: uiImage)
            }
        }
}

struct CoreImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoreImageView()
    }
}
