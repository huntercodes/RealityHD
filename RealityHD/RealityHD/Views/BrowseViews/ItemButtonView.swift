//
//  ItemButtonView.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//

import SwiftUI

struct ItemButtonView: View {
    let model: ARModel
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            model.thumbnail
                .resizable()
                .frame(height: 150)
                .aspectRatio(1/1, contentMode: .fit)
                .cornerRadius(10)
        }
    }
}
