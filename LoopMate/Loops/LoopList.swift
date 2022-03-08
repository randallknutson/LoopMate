//
//  LoopList.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/1/22.
//

import SwiftUI

struct LoopList: View {
    @EnvironmentObject var store: ApplicationStore
    @State private var isAddingLoop = false
    
    var body: some View {
        VStack {
            List {
                ForEach(store.state.loops) { loop in
                    VStack {
                        NavigationLink(destination: LoopDetail(loop: loop)) {
                            EmptyView()
                        }
                        .opacity(0.0)
                        .buttonStyle(PlainButtonStyle())
                        LoopRow(loop: loop)
                            .listRowInsets(EdgeInsets())
                    }
                    .swipeActions(allowsFullSwipe: false) {
                        removeButton(loop: loop)
                    }
                }
            }
            .padding(.leading, -20.0)
            .listStyle(PlainListStyle())
            .refreshable {
                print("Refresh")
            }
            
            if isAddingLoop {
                NavigationLink(destination: LoopEdit(loop: store.state.loops.last!), isActive:
                                $isAddingLoop) { EmptyView() }
            }
        }
        .navigationTitle("Loops")
        .toolbar {
            Button(action: {
                store.dispatch(action: .appendLoop(Loop()))
                isAddingLoop = true
            }) {
                Image(systemName: "plus").imageScale(.large)
            }
        }
    }
    
    func removeButton(loop: Loop) -> some View {
        Button(role: .destructive) {
            store.dispatch(action: .removeLoop(loop))
        } label: {
            Label("Delete", systemImage: "trash.fill")
        }
    }
}

struct LoopList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoopList()
                .environmentObject(ApplicationStore())
        }
    }
}
