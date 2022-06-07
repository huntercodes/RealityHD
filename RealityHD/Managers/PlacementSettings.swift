//
//  PlacementSettings.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//

import SwiftUI
import RealityKit
import Combine

final class PlacementSettings: ObservableObject {
    @Published var selectedModel: ARModel? {
        willSet(newValue) {
            print("Setting selectedModel to \(String(describing: newValue?.name))")
        }
    }
    
    @Published var confirmedModel: ARModel? {
        willSet {
            guard let model = newValue else {
                print("Clearing confirmedModel")
                
                return
            }
            
            print("Setting confirmedModel to \(model.name)")
            
            recentlyPlaced.append(model)
        }
    }
    
    @Published var recentlyPlaced: [ARModel] = []
    
    var sceneObserver: Cancellable?
}
