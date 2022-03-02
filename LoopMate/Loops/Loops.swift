//
//  Loops.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/2/22.
//

import SwiftUI
import Combine

class Loops: ObservableObject {
    @Published var loops : [Loop]
    var cancellables = [AnyCancellable]()

    init(loops: [Loop]){
        self.loops = loops

        self.loops.forEach({
            let c = $0.objectWillChange.sink(receiveValue: { self.objectWillChange.send() })

            // Important: You have to keep the returned value allocated,
            // otherwise the sink subscription gets cancelled
            self.cancellables.append(c)
        })
    }
}

