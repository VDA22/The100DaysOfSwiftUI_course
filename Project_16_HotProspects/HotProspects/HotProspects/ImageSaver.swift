//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Darya Viter on 23.06.2022.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?

    func wrightToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted(_:didFinishSaingWithError:context:)), nil)
    }

    @objc private func saveCompleted(_ image: UIImage, didFinishSaingWithError error: Error?, context: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
