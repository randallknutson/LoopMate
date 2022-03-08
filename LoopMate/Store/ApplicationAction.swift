//
//  ApplicationAction.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/8/22.
//

import Foundation

enum ApplicationAction {
    case updateLoop(Loop)
    case appendLoop(Loop)
    case removeLoop(Loop)
}
