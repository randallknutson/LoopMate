//
//  LogMiddleware.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/5/22.
//

import Foundation

struct LogMiddleware<Action>: Middleware {
    func callAsFunction(action: Action) async -> Action? {
        print("Redux", String(reflecting: action))
        return action
    }
}
