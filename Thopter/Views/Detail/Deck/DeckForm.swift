//
//  DeckForm.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/23/26.
//

import SwiftUI
import Forge

struct DeckForm: View {
    
    @Binding var deckName: String
    @Binding var isShowingCommanderSelection: Bool
    @Binding var selectedCommander: SFCard?
        
    var body: some View {
        Form {
            Section("Name") {
                TextField("Enter a name for this deck", text: $deckName, axis: .horizontal)
            }
            Section("Commander") {
                if selectedCommander != nil {
                    if let commander = selectedCommander {
                        Button {
                            isShowingCommanderSelection = true
                        } label: {
                            CommanderRow(card: commander)
                        }
                    }
                } else {
                    Button("Select a commander") {
                        isShowingCommanderSelection = true
                    }
                }
                
            }
        }
    }
}

#Preview {
    #warning("TODO: Preview provider")
}
