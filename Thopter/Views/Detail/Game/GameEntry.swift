//
//  GameEntry.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/22/26.
//

import SwiftUI
import SwiftData

struct GameEntry: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var playerCount = 4
    @State private var gameStatus: GameStatus = .loss
    @State private var vibes: Vibes = .fun
    @State private var salt: Salt = .low
    @State private var deckUsed: Deck?
    @State private var date: Date = .init()
    @State private var notes: String = ""
    
    var body: some View {
        NavigationStack {
            GameForm(
                playerCount: $playerCount,
                gameStatus: $gameStatus,
                vibes: $vibes,
                salt: $salt,
                deck: $deckUsed,
                date: $date,
                notes: $notes
            )
            .navigationTitle("Add a game")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close", systemImage: "xmark") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", systemImage: "checkmark") {
                        let newGame = Game(
                            playerCount: playerCount,
                            gameStatus: gameStatus,
                            vibes: vibes,
                            salt: salt,
                            deckUsed: deckUsed,
                            date: date,
                            note: notes
                        )
                        modelContext.insert(newGame)
                        dismiss()
                    }
                    .disabled(deckUsed == nil)
                }
            }
        }
    }
}

#Preview {
    #warning("TODO: Preview provider")
}
