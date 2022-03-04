//
//  LoopHeader.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/1/22.
//

import SwiftUI

struct LoopHeader: View {
    @ObservedObject var loop: Loop
    
    var body: some View {
        HStack {
            LoopImage(width: 32, height: 32)
            Text(loop.name)
                .font(.headline)
        }
        .padding()
    }
}

struct LoopHeader_Previews: PreviewProvider {
    static var previews: some View {
        LoopHeader(loop: Loop(name: "Name"))
    }
}
