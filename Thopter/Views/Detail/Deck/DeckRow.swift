//
//  DeckRow.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/28/26.
//

import SwiftUI
import Kingfisher

struct DeckRow: View {
    
    let deck: Deck
    
    var body: some View {
        LabeledContent {
            CommanderIcon(url: deck.commanderImage)
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.15
                }
        } label: {
            Text(deck.name)
            Text(deck.commanderName)
        }
    }
}

#Preview {
    #warning("TODO: Preview provider")
}
