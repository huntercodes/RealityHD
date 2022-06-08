//
//  ARViewRepresentable.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//

import Foundation
import RealityKit
import SwiftUI

struct ARViewRepresentable: UIViewRepresentable {
    @EnvironmentObject var placementSettings: PlacementSettings
    @EnvironmentObject var sessionSettings: SessionSettings
    
    func makeUIView(context: Context) -> some UIView {
        let arView = CustomARView(frame: .zero, sessionSettings: sessionSettings)
        
        placementSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, { event in
            updateScene(for: arView)
        })
        
        return arView
    }
    
    private func updateScene(for arView: CustomARView) {
        arView.focusEntity?.isEnabled = placementSettings.selectedModel != nil
        
        if let confirmedModel = placementSettings.confirmedModel, let modelEntity = confirmedModel.modelEntity {
            place(modelEntity, in: arView)
            placementSettings.confirmedModel = nil
        }
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    private func place(_ modelEntity: ModelEntity, in arView: ARView) {
        let clonedEntity = modelEntity.clone(recursive: true)
        clonedEntity.generateCollisionShapes(recursive: true)
        
        arView.installGestures([.translation, .rotation], for: clonedEntity)
        
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(clonedEntity)
        
        arView.scene.addAnchor(anchorEntity)
    }
}
