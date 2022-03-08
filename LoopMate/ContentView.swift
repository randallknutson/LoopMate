//
//  ContentView.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/2/22.
//

import SwiftUI
import MultipeerKit

struct ContentView: View {
    @StateObject private var store = ApplicationStore(reducer: reducer, middleware: {
        LogMiddleware()
    })

//    @StateObject var loopsDataSource = LoopsDataSource()
    
    var body: some View {
        NavigationView {
            LoopList()
        }
        .environmentObject(store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
