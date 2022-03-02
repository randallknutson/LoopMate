//
//  ContentView.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/2/22.
//

import SwiftUI

struct ContentView: View {
    let defaults = UserDefaults.standard
    
    var body: some View {
        NavigationView {
            LoopList(loops: [Loop(name: "Liesl"), Loop(name: "Brielle")])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
