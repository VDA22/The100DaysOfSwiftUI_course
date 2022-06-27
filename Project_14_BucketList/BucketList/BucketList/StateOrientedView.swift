//
//  StateOrientedView.swift
//  BucketList
//
//  Created by Darya Viter on 26.06.2022.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct StateOrientedView: View {

    var loadingState = LoadingState.loading

    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}

struct StateOrientedView_Previews: PreviewProvider {
    static var previews: some View {
        StateOrientedView()
    }
}
