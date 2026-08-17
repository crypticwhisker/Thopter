//
//  GameRow.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/24/26.
//

import SwiftUI

struct GameRow: View {
    
    let game: Game
    
    var body: some View {
        LabeledContent {
            if game.gameStatus == .win {
                Label(game.gameStatus.description, systemImage: "trophy")
                    .labelStyle(.iconOnly)
            }
        } label: {
            Text(game.deckUsed?.name ?? "No deck assigned")
            Text(game.dateStringShort)
        }
    }
}

#Preview {
    #warning("TODO: Preview provider")
}
