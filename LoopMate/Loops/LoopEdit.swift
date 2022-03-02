//
//  LoopEdit.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/2/22.
//

import SwiftUI

struct LoopEdit: View {
    @EnvironmentObject var loop: Loop
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $loop.name)
            }
        }
    }
}

struct LoopEdit_Previews: PreviewProvider {
    static var previews: some View {
        LoopEdit().environmentObject(Loop())
    }
}
