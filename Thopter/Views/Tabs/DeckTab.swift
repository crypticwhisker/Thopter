//
//  DeckTab.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/22/26.
//

import SwiftUI
import SwiftData

struct DeckTab: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \Deck.name, order: .forward) private var decks: [Deck] = []
    
    @State private var path = NavigationPath()
    @State private var isShowingNewDeckEntry = false
    @State private var isShowingStatsSheet = false
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(decks) { deck in
                    NavigationLink(value: deck) {
                        DeckRow(deck: deck)
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        let deck = decks[index]
                        modelContext.delete(deck)
                    }
                }
            }
            .navigationTitle("Decks")
            .navigationDestination(for: Deck.self) { deck in
                DeckDetail(deck: deck)
            }
            .overlay {
                if decks.isEmpty {
                    ContentUnavailableView(
                        "No decks created",
                        systemImage: "nosign",
                        description: Text("Add a deck to get started")
                    )
                }
            }
            .sheet(isPresented: $isShowingNewDeckEntry) {
                DeckEntry()
            }
            .sheet(isPresented: $isShowingStatsSheet) {
                StatSheet()
                    .presentationDetents([.medium])
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Stats", systemImage: "graph.2d") {
                        isShowingStatsSheet = true
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Add deck", systemImage: "plus") {
                        isShowingNewDeckEntry = true
                    }
                }
            }
        }
    }
}

#Preview {
    #warning("TODO: Preview provider")
}
