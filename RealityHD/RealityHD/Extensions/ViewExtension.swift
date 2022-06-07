//
//  ViewExtension.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//

import SwiftUI

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
            case true:
                self.hidden()
            case false:
                self
        }
    }
}
