//
//  LoopEdit.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/2/22.
//

import SwiftUI
import MultipeerKit

struct LoopEdit: View {
    @EnvironmentObject var loop: Loop
    @EnvironmentObject var dataSource: MultipeerDataSource
    @State private var showingImagePicker = false
    @State private var image: UIImage?
    
    func invitePeer(peer: Peer) {
        print(peer.name)
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Button { showingImagePicker = true } label: {
                        LoopImage(image: image, width: 64, height: 64)
                    }
                    TextField("Name", text: $loop.name)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Local Loops").font(.system(.headline)).padding()

                List {
                    ForEach(dataSource.availablePeers) { peer in
                        HStack {
                            Circle()
                                .frame(width: 12, height: 12)
                                .foregroundColor(peer.isConnected ? .green : .gray)
                            
                            Text(peer.name)

                            Spacer()

//                            if self.viewModel.selectedPeers.contains(peer) {
//                                Image(systemName: "checkmark")
//                            }
                        }.onTapGesture {
                            invitePeer(peer: peer)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        .onAppear {
            dataSource.transceiver.resume()
        }
        .onDisappear {
            dataSource.transceiver.stop()
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $image)
        }
    }
}

struct LoopEdit_Previews: PreviewProvider {
    static var previews: some View {
        LoopEdit().environmentObject(Loop())
    }
}
