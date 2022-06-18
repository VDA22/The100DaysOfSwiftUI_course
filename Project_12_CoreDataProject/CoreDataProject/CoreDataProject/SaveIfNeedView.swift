//
//  SaveIfNeedView.swift
//  CoreDataProject
//
//  Created by Darya Viter on 18.06.2022.
//

import SwiftUI

struct SaveIfNeedView: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save") {
            guard moc.hasChanges else { return }
            try? moc.save()
        }
    }
}

struct SaveIfNeedView_Previews: PreviewProvider {
    static var previews: some View {
        SaveIfNeedView()
    }
}
