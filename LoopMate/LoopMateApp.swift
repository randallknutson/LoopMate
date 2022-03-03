//
//  LoopMateApp.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/2/22.
//

import SwiftUI
import MultipeerKit

struct ExamplePayload: Hashable, Codable {
    let message: String
}

@main
struct LoopMateApp: App {
    let transceiver: MultipeerTransceiver
    let dataSource: MultipeerDataSource
    
    init() {
        var config = MultipeerConfiguration.default
        config.serviceType = "Loop"
        config.security.encryptionPreference = .required
//        config.security.invitationHandler
        self.transceiver = MultipeerTransceiver(configuration: config)

//        t.receive(ExamplePayload.self) { [weak self] payload, peer in
//            print("Got payload: \(payload)")

//            self?.notify(with: payload, peer: peer)
//        }
        self.dataSource = MultipeerDataSource(transceiver: transceiver)
    }

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(dataSource)
        }
    }
}
