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
    case kitchen, livingRoom, toys, garden
    
    var label: String {
        get {
            switch self {
            case .kitchen:
                return "Kitchen"
            case .livingRoom:
                return "Living Room"
            case .toys:
                return "Toys"
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
        
        // Toys
        let plane = ARModel(name: "toy_biplane", category: .toys, scaleCompensation: 43 / 100)
        let car = ARModel(name: "toy_car", category: .toys, scaleCompensation: 43 / 100)
        let robot = ARModel(name: "toy_robot_vintage", category: .toys, scaleCompensation: 43 / 100)
        let drummer = ARModel(name: "toy_drummer", category: .toys, scaleCompensation: 47 / 100)
        self.arModels += [plane, car, robot, drummer]
    }
    
    func get(category: ModelCategory) -> [ARModel] {
        return arModels.filter( { $0.category == category } )
    }
}
