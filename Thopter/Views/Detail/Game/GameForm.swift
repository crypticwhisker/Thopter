//
//  GameForm.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/22/26.
//

import SwiftUI
import SwiftData

struct GameForm: View {
    
    @Query var decks: [Deck]
    
    @Binding var playerCount: Int
    @Binding var gameStatus: GameStatus
    @Binding var vibes: Vibes
    @Binding var salt: Salt
    @Binding var deck: Deck?
    @Binding var date: Date
    @Binding var notes: String
    
    var body: some View {
        Form {
            Section("Details") {
                Stepper("Players: \(playerCount)", value: $playerCount, in: 2...10)
                Picker("Status", selection: $gameStatus) {
                    ForEach(GameStatus.allCases, id: \.self) { status in
                        Text(status.description)
                    }
                }
                Picker("Deck", selection: $deck) {
                    Text("Choose a deck...")
                        .tag(nil as Deck?)
                    ForEach(decks) { deck in
                        Text(deck.name)
                            .tag(deck)
                    }
                }
                Picker("Vibes", selection: $vibes) {
                    ForEach(Vibes.allCases, id: \.self) { vibe in
                        Text(vibe.description)
                    }
                }
                Picker("Salt", selection: $salt) {
                    ForEach(Salt.allCases, id: \.self) { level in
                        Text(level.description)
                    }
                }
                DatePicker(
                        "Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
            }
            Section("Notes") {
                TextField("Notes", text: $notes, axis: .vertical)
            }
        }
    }
}

#Preview {
    #warning("TODO: Preview provider")
}
