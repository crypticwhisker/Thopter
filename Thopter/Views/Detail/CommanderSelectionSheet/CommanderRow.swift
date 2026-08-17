//
//  CommanderRow.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/27/26.
//

import SwiftUI
import Kingfisher
import Forge

struct CommanderRow: View {
    
    let card: SFCard
        
    var body: some View {
        HStack {
            CommanderIcon(url: card.frontImageURL)
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.2
                }
            Text(card.frontSideName)
        }
    }
}

#Preview {
    #warning("TODO: Preview provider")
}
