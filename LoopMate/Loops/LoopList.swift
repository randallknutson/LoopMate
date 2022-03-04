//
//  LoopList.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/1/22.
//

import SwiftUI

struct LoopList: View {
    @ObservedObject var loops: LoopsDataSource
    @State private var isAddingLoop = false
    
    var body: some View {
        VStack {
            List {
                ForEach($loops.loops.indices, id: \.self) { index in
                    let loop = loops.loops[index]
                    VStack {
                        NavigationLink(destination: LoopDetail().environmentObject(loop)) {
                            EmptyView()
                        }
                        .opacity(0.0)
                        .buttonStyle(PlainButtonStyle())
                        LoopRow(loop: loop)
                            .listRowInsets(EdgeInsets())
                    }
                    .swipeActions(allowsFullSwipe: false) {
                        removeButton(index)
                    }
                }
            }
            .padding(.leading, -20.0)
            .listStyle(PlainListStyle())
            .refreshable {
                print("Refresh")
            }
            
            if isAddingLoop {
                NavigationLink(destination: LoopEdit().environmentObject(loops.loops.last!), isActive:
                                $isAddingLoop) { EmptyView() }
            }
        }
        .navigationTitle("Loops")
        .toolbar {
            Button(action: {
                loops.loops.append(Loop())
                isAddingLoop = true
            }) {
                Image(systemName: "plus").imageScale(.large)
            }
        }
    }
    
    func removeButton(_ index: Int) -> some View {
        Button(role: .destructive) {
            loops.loops.remove(at: index)
        } label: {
            Label("Delete", systemImage: "trash.fill")
        }
    }
}

struct LoopList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoopList(loops: LoopsDataSource())
        }
    }
}
