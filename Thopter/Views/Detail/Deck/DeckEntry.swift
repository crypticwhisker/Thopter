//
//  DeckEntry.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/22/26.
//

import SwiftUI
import SwiftData
import Forge

struct DeckEntry: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var deckName = ""
    @State private var selectedCommander: SFCard? = nil
    @State private var isShowingCommanderSelection = false
    
    var body: some View {
        NavigationStack {
            DeckForm(
                deckName: $deckName,
                isShowingCommanderSelection: $isShowingCommanderSelection,
                selectedCommander: $selectedCommander
            )
                .navigationTitle("Add a deck")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Close", systemImage: "xmark") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save", systemImage: "checkmark") {
                            if let commander = selectedCommander {
                                let newDeck = Deck(
                                    name: deckName,
                                    commanderName: commander.name,
                                    commanderImage: commander.frontImageURL,
                                    commanderArtImage: commander.frontArtCropURL
                                )
                                modelContext.insert(newDeck)
                            }
                            dismiss()
                        }
                        .disabled(deckName.isEmpty || selectedCommander == nil)
                    }
                }
                .sheet(isPresented: $isShowingCommanderSelection) {
                    CommanderSelectionSheet(selectedCommmander: $selectedCommander)
                }
        }
    }
}

#Preview {
    #warning("TODO: Preview provider")
}
