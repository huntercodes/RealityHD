//
//  ControlButtonView.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//

import SwiftUI

struct ControlButtonView: View {
    let name: String
    let action: () ->Void
    
    var body: some View {
        Button { withAnimation(.easeInOut) { action() } } label: {
            Image(systemName: name)
                .resizable()
                .scaledToFit()
                .foregroundColor(Color("mainColor"))
                .frame(width: 40, height: 40)
        }
    }
}
