//
//  CommanderSelectionSheet.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/27/26.
//

import SwiftUI
import Forge

struct CommanderSelectionSheet: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var selectedCommmander: SFCard?

    @State private var searchText = ""
    @State private var cards: [SFCard] = []
    @State var manager: SearchManager = SearchManager()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Search") {
                    TextField("Search for your commander", text: $searchText, axis: .horizontal)
                        .autocorrectionDisabled(true)
                        .task(id: searchText) {
                            if !searchText.isEmpty {
                                do {
                                    try await Task.sleep(for: .seconds(0.5)) // matches rate limit of scryfall
                                    cards = try await manager.search(query: searchText)
                                } catch {
                                    // Errors
                                }
                            }
                        }
                        .onChange(of: searchText) { oldValue, newValue in
                            if newValue.isEmpty {
                                selectedCommmander = nil
                                cards.removeAll()
                            }
                        }
                }
                Picker("Results", selection: $selectedCommmander) {
                    ForEach(cards) { card in
                        CommanderRow(card: card)
                            .tag(card) // need explicit tag due to selectedCommmander starting as nil
                    }
                }
                .pickerStyle(.inline)
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close", systemImage: "xmark") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Select", systemImage: "checkmark") {
                        dismiss()
                    }
                    .disabled(selectedCommmander == nil)
                }
            }
        }
    }
}

#Preview {
    #warning("TODO: Preview provider")
}
