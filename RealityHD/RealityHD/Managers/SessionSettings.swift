//
//  SessionSettings.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//

import SwiftUI

final class SessionSettings: ObservableObject {
    @Published var isPeopleOcclusionEnabled: Bool = false
    @Published var isObjectOcclusionEnabled: Bool = false
    @Published var isLidarDebugEnabled: Bool = false
    @Published var isMultiUserEnabled: Bool = false
}
