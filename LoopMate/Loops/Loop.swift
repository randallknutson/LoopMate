//
//  File.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/1/22.
//

import SwiftUI

struct Loop: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String = "My Loop"
    var lastRefresh: Date?
}
