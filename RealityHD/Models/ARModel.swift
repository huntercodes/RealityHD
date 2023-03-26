//
//  ARModel.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//

import SwiftUI
import RealityKit
import Combine

enum ModelCategory: CaseIterable {
    case kitchen, livingRoom, marvel, garden
    
    var label: String {
        get {
            switch self {
            case .kitchen:
                return "Kitchen"
            case .livingRoom:
                return "Living Room"
            case .marvel:
                return "Marvel"
            case .garden:
                return "Garden"
            }
        }
    }
}

class ARModel {
    
    var name: String
    var category: ModelCategory
    var thumbnail: Image
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    
    private var cancellable: AnyCancellable?
    
    init(name: String, category: ModelCategory, scaleCompensation: Float = 1.0) {
        self.name = name
        self.category = category
        self.thumbnail = Image(name)
        self.scaleCompensation = scaleCompensation
    }
    
    func loadModelEntity() {
        let fileName = self.name + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: fileName)
            .sink(receiveCompletion: { loadCompletion in
                switch loadCompletion {
                case .failure(let error):
                    print("Unable to load entity for \(fileName). Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
                
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                self.modelEntity?.scale *= self.scaleCompensation
            })
    }
    
}

struct Models {
    var arModels: [ARModel] = []
    
    init() {
        // Garden
        let wateringCan = ARModel(name: "wateringcan", category: .garden, scaleCompensation: 37 / 100)
        self.arModels += [wateringCan]
        
        // Living Room
        let gramophone = ARModel(name: "gramophone", category: .livingRoom, scaleCompensation: 39 / 100)
        let tv = ARModel(name: "tv_retro", category: .livingRoom, scaleCompensation: 39 / 100)
        let fender = ARModel(name: "fender_stratocaster", category: .livingRoom, scaleCompensation: 87 / 100)
        let whiteboard = ARModel(name: "scientific_whiteboard", category: .livingRoom, scaleCompensation: 41 / 100)
        self.arModels += [gramophone, tv, fender, whiteboard]
        
        // Kitchen
        let chair = ARModel(name: "chair_swan", category: .kitchen, scaleCompensation: 61 / 100)
        let cup = ARModel(name: "cup_saucer_set", category: .kitchen, scaleCompensation: 47 / 100)
        let teapot = ARModel(name: "teapot", category: .kitchen, scaleCompensation: 41 / 100)
        self.arModels += [chair, cup, teapot]
        
        // Marvel
        let iron = ARModel(name: "mark_85", category: .marvel, scaleCompensation: 0.75 / 100)
        let thanos = ARModel(name: "toy_thanos", category: .marvel, scaleCompensation: 53 / 100)
        let spider = ARModel(name: "spiderman", category: .marvel, scaleCompensation: 53 / 100)
        let silver = ARModel(name: "silver_surfer", category: .marvel, scaleCompensation: 47 / 100)
        self.arModels += [iron, thanos, spider, silver]
    }
    
    func get(category: ModelCategory) -> [ARModel] {
        return arModels.filter( { $0.category == category } )
    }
}
