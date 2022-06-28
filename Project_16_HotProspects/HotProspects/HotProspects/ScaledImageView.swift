//
//  ScaledImageView.swift
//  HotProspects
//
//  Created by Darya Viter on 28.06.2022.
//

import SwiftUI

struct ScaledImageView: View {
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
    }
}

struct ScaledImageView_Previews: PreviewProvider {
    static var previews: some View {
        ScaledImageView()
    }
}
