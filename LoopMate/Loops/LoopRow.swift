//
//  LoopRow.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/1/22.
//

import SwiftUI

struct LoopRow: View {
    let loop: Loop
    
    let relativeDateFormatter = RelativeDateTimeFormatter()
    
    var body: some View {
        relativeDateFormatter.dateTimeStyle = .named
        
        return HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading) {
                Text(loop.name)
                Text(Date().addingTimeInterval(-120), formatter: relativeDateFormatter)
            }
            
            Spacer()
            
            VStack(alignment: .trailing){
                Text("BG : 100").font(.caption)
                Text("IOB: 100").font(.caption)
                Text("COB: 100").font(.caption)
            }
        }
        .padding()
    }
}

struct LoopRow_Previews: PreviewProvider {
    static var previews: some View {
        LoopRow(loop: Loop())
    }
}
