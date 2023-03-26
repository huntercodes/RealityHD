//
//  SettingsModel.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//

import SwiftUI

enum SettingsModel {
    case peopleOcclusion, objectOcclusion, lidarDebug, multiUser
    
    var label: String {
        switch self {
            case .peopleOcclusion, .objectOcclusion:
                return "Occulsion"
            case .lidarDebug:
                return "LiDar"
            case .multiUser:
                return "MultiUser"
        }
    }
    
    var systemIconName: String {
        get {
            switch self {
                case .peopleOcclusion:
                    return "person.fill"
                case .objectOcclusion:
                    return "cube.transparent.fill"
                case .lidarDebug:
                    return "light.min"
                case .multiUser:
                    return "person.3.fill"
            }
        }
    }
}
