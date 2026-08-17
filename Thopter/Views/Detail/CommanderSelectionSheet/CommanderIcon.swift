//
//  CommanderIcon.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/27/26.
//

import SwiftUI
import Kingfisher
import Forge

struct CommanderIcon: View {
    
    let url: URL?
        
    var body: some View {
        KFImage(url)
            .placeholder {
                CardBack()
            }
            .resizable()
            .scaledToFit()
            .perfectEdges()
    }
}

#Preview {
    #warning("TODO: Preview provider")
}
