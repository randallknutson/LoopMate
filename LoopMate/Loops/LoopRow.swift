//
//  LoopRow.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/1/22.
//

import SwiftUI

struct LoopRow: View {
    let loop: Loop
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading) {
                Text(loop.name)
                HStack(alignment: .center, spacing: 5) {
                    Text(Date(), style: .relative)
                    Text("ago")
                }
            }
            
            Spacer()
            
            Text("100")
        }
        .padding()
    }
}

struct LoopRow_Previews: PreviewProvider {
    static var previews: some View {
        LoopRow(loop: Loop())
    }
}
