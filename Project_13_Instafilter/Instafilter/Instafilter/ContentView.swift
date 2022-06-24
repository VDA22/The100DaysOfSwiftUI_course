//
//  ContentView.swift
//  Instafilter
//
//  Created by Darya Viter on 22.06.2022.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 1.0
    @State private var isRadiusON = false

    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?

    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    private let context = CIContext()

    @State private var showingFilterSheet = false

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)

                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)

                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }

                HStack {
                    Text("Intensity")
                        .foregroundColor(
                            !isRadiusON ? .primary : .secondary
                        )
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity) { _ in applyProcessing() }
                        .disabled(isRadiusON)
                }
                .padding(.vertical)

                HStack {
                    Text("Radius")
                        .foregroundColor(
                            isRadiusON ? .primary : .secondary
                        )
                    Slider(value: $filterRadius, in: 1 ... 20)
                        .onChange(of: filterRadius) { _ in applyProcessing() }
                        .disabled(!isRadiusON)
                }
                .padding(.vertical)

                HStack {
                    Button("Change filter") {
                        showingFilterSheet = true
                    }

                    Spacer()

                    Button("Save", action: save)
                        .disabled(image == nil)

                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .navigationViewStyle(.stack)
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                Group {
                    Button("Crystallize") { setFilter(.crystallize()) }
                    Button("Edges") { setFilter(.edges()) }
                    Button("Gaussian Blur") { setFilter(.gaussianBlur()) }
                    Button("Pixellate") { setFilter(.pixellate()) }
                    Button("Sepia Tone") { setFilter(.sepiaTone()) }
                    Button("UnsharpMask") { setFilter(.unsharpMask()) }
                    Button("Vignette") { setFilter(.vignette()) }
                    Button("Twirl Distortion") { setFilter(.twirlDistortion()) }
                    Button("Bloom") { setFilter(.bloom()) }
                    Button("Box Blur") { setFilter(.boxBlur()) }
                }
                Button("Cancel", role: .cancel) { }
            }
        }
    }

    private func loadImage() {
        guard let inputImage = inputImage else { return }

        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }

    private func save() {
        guard let processedImage = processedImage else { return }

        let imageSaver = ImageSaver()

        imageSaver.successHandler = {
            print("Success!")
        }
        imageSaver.errorHandler = {
            print("Oops! \($0.localizedDescription)")
        }
        imageSaver.wrightToPhotoAlbum(image: processedImage)
    }

    private func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        isRadiusON = inputKeys.contains(kCIInputRadiusKey)

        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterRadius * 20, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }

        guard let outputImage = currentFilter.outputImage else { return }
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }

    private func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
