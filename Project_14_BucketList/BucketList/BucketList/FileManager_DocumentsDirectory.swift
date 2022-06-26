//
//  FileManager_DocumentsDirectory.swift
//  BucketList
//
//  Created by Darya Viter on 26.06.2022.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { fatalError() }
        return path
    }
}
