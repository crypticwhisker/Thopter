//
//  GameDetail.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/22/26.
//

import SwiftUI
import SwiftData

struct GameDetail: View {
    
    @Environment(\.editMode) private var editMode
    
    @Query var decks: [Deck]
    
    @Bindable var game: Game
    
    var body: some View {
        List {
            if editMode?.wrappedValue.isEditing == true {
                Section("Details") {
                    Picker("Deck", selection: $game.deckUsed) {
                        Text("Choose a deck...")
                            .tag(nil as Deck?)
                        ForEach(decks) { deck in
                            Text(deck.name)
                                .tag(deck)
                        }
                    }
                    Stepper("Players: \(game.playerCount)", value: $game.playerCount, in: 2...10)
                    Picker("Status", selection: $game.gameStatus) {
                        ForEach(GameStatus.allCases, id: \.self) { status in
                            Text(status.description)
                        }
                    }
                    DatePicker(
                            "Date",
                            selection: $game.datePlayed,
                            displayedComponents: [.date]
                        )
                }
                Section("Sentiment") {
                    Picker("Vibes", selection: $game.vibes) {
                        ForEach(Vibes.allCases, id: \.self) { vibe in
                            Text(vibe.description)
                        }
                    }
                    Picker("Salt", selection: $game.salt) {
                        ForEach(Salt.allCases, id: \.self) { level in
                            Text(level.description)
                        }
                    }
                }
                Section("Notes") {
                    TextField("Tap to add notes", text: $game.note, axis: .vertical)
                }
            } else {
                Section("Details") {
                    if let deck = game.deckUsed {
                        LabeledContent("Deck", value: deck.name)
                    }
                    LabeledContent("Players", value: game.playerCount.description)
                    LabeledContent("Status", value: game.gameStatus.description)
                    LabeledContent("Date", value: game.dateStringFull)
                }
                Section("Sentiment") {
                    LabeledContent("Vibes", value: game.vibes.description)
                    LabeledContent("Salt", value: game.salt.description)
                }
                Section("Notes") {
                    if !game.note.isEmpty {
                        Text(game.note)
                            .foregroundStyle(.secondary)
                    } else {
                        Text("Tap \"Edit\" to add notes")
                            .foregroundStyle(.tertiary)
                    }
                }
            }
        }
        .navigationTitle("Game")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            EditButton()
        }
    }
}

#Preview {
    #warning("TODO: Preview provider")
}
