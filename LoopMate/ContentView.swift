//
//  ContentView.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/2/22.
//

import SwiftUI
import MultipeerKit

struct ContentView: View {
    @StateObject var loops = Loops(loops: [Loop(name: "Liesl"), Loop(name: "Brielle")])
    
    var body: some View {
        NavigationView {
            LoopList(loops: loops)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
