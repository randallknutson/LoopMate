//
//  EchoMiddleware.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/5/22.
//

import Foundation

struct EchoMiddleware<Action>: Middleware {
    func callAsFunction(action: Action) async -> Action? {
        return action
    }
}

