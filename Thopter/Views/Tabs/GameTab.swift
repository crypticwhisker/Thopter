//
//  GameTab.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/22/26.
//

import SwiftUI
import SwiftData

struct GameTab: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Game.datePlayed, order: .reverse) private var games: [Game] = []
    
    @State private var path = NavigationPath()
    @State private var isShowingNewGameEntry = false
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(games) { game in
                    NavigationLink(value: game) {
                        GameRow(game: game)
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        let game = games[index]
                        modelContext.delete(game)
                    }
                }
            }
            .navigationTitle("Games")
            .navigationDestination(for: Game.self) { game in
                GameDetail(game: game)
            }
            .overlay {
                if games.isEmpty {
                    ContentUnavailableView(
                        "No games played",
                        systemImage: "nosign",
                        description: Text("Add a game to get started")
                    )
                }
            }
            .sheet(isPresented: $isShowingNewGameEntry) {
                GameEntry()
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add game", systemImage: "plus") {
                        isShowingNewGameEntry = true
                    }
                }
            }
        }
    }
}

#Preview {
    #warning("TODO: Preview provider")
}
