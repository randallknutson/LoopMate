//
//  File.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/1/22.
//

import SwiftUI

class Loop: Codable, Identifiable, ObservableObject {
//    var id: UUID = UUID()
    @Published var name: String
    @Published var lastRefresh: Date?
    
    init() {
        self.name = "My Loop"
    }
      
    init(name: String) {
        self.name = name
    }
      
    enum CodingKeys: CodingKey {
        case name, lastRefresh
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

//        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(lastRefresh, forKey: .lastRefresh)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

//        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        lastRefresh = try? container.decode(Date.self, forKey: .lastRefresh)
    }
}
