//
//  LoopImage.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/4/22.
//

import SwiftUI

struct LoopImage: View {
    var image: UIImage?
    var width: CGFloat = 48
    var height: CGFloat = 48
    
    var body: some View {
        return ((image != nil) ? Image(uiImage: image!) : Image(systemName: "person.circle"))
            .resizable()
            .foregroundColor(Color(UIColor.separator))
            .frame(width: width, height: width)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(UIColor.separator), lineWidth: 1))
    }
}

struct LoopImage_Previews: PreviewProvider {
    static var previews: some View {
        LoopImage()
    }
}
