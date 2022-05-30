//
//  ShowSheetView.swift
//  iExpense
//
//  Created by Darya Viter on 30.05.2022.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Second Sheet")
            
            Button("Dismiss") {
                dismiss()
            }
        }
        .padding()
    }
}

struct ShowSheetView: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show Sheet") {
            print(showingSheet)
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView()
        }

    }
}

struct ShowSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ShowSheetView()
    }
}
