//
//  LoopList.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/1/22.
//

import SwiftUI

struct LoopList: View {
    @State var loops: [Loop]
    
    var body: some View {
        VStack {
            List {
                ForEach($loops.indices, id: \.self) { index in
                    let loop = loops[index]
                    ZStack {
                        NavigationLink(destination: LoopDetail().environmentObject(loop)) {
                            EmptyView()
                        }
                        .opacity(0.0)
                        .buttonStyle(PlainButtonStyle())
                        LoopRow(loop: loop)
                            .listRowInsets(EdgeInsets())
                    }
                    .swipeActions(allowsFullSwipe: false) {
                        Button(role: .destructive) {
                            loops.remove(at: index)
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .refreshable {
                do {
                    print("Refresh")
                }
                catch {
                    print("Error!")
                }
            }
        }
        .navigationTitle("Loops")
        .toolbar {
            Button(action: {
                loops.append(Loop())
            }) {
                Image(systemName: "plus").imageScale(.large)
            }
        }
    }
}

struct LoopList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoopList(loops: [Loop(name: "Liesl"), Loop(name: "Brielle")])
        }
    }
}
