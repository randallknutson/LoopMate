//
//  reducer.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/8/22.
//

import Foundation

func reducer(currentState: ApplicationState, action: ApplicationAction) -> ApplicationState {
    var newState = currentState
    switch action {
    case .updateLoop(let loop):
        guard let index = newState.loops.firstIndex(where: { $0.id == loop.id }) else { return currentState }
        newState.loops[index] = loop
    case .appendLoop(let loop):
        newState.loops.append(loop)
    case .removeLoop(let loop):
        guard let index = newState.loops.firstIndex(where: { $0.id == loop.id }) else { return currentState }
        newState.loops.remove(at: index)
    }

    return newState
}
