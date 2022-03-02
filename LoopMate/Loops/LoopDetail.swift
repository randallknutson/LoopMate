//
//  LoopDetail.swift
//  LoopMRW
//
//  Created by Randall Knutson on 3/1/22.
//

import SwiftUI

struct LoopDetail: View {
    @EnvironmentObject var loop: Loop
    
    var body: some View {
        TabView {
            Text("Dashboard")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Dashboard")
                }
            Text("Enter Meal")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Meal")
                }
            Text("Deliver Bolus")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Bolus")
                }
        }
        .navigationTitle(loop.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                LoopHeader(loop: loop)
            }
        }
        .toolbar {
            NavigationLink(destination: LoopEdit().environmentObject(loop)) {
                Image(systemName: "gearshape.fill")
                    .imageScale(.large)
            }
        }

    }
}

struct LoopDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoopDetail()
                .environmentObject(Loop(name: "Name"))
        }
    }
}
