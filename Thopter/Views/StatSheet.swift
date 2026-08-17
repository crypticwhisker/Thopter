//
//  StatSheet.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/29/26.
//

import SwiftUI
import SwiftData

struct StatSheet: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Query var decks: [Deck]
    @Query var games: [Game]
    
    var totalWinCount: Int {
        decks.reduce(0) { $0 + $1.winCount}
    }
    
    var totalGamesPlayed: Int {
        decks.reduce(0) { $0 + $1.gameCount }
    }
    
    var overallWinRate: String {
        guard totalGamesPlayed > 0 else { return "No games played" }
        let wrDouble = Double(totalWinCount) / Double(totalGamesPlayed)
        return wrDouble.formatted(.percent.precision(.fractionLength(0)).rounded(rule: .down))
    }
    
    var highestWinRateDeck: Deck? {
        guard totalWinCount != 0 else { return nil }
        return decks.max { a, b in
            if a.winRate == b.winRate {
                return a.gameCount < b.gameCount
            }
            return a.winRate < b.winRate
        }
    }
    
    var overallSaltRating: Salt? {
        let salts = games.map { $0.salt } // Get all salt scores
        let counts = salts.reduce(into: [:]) { counts, salt in // Reduce to dictionary
                counts[salt, default: 0] += 1
            }
        return counts.max { $0.value < $1.value }?.key // Get key of highest count
    }
    
    var overallVibeRating: Vibes? {
        let vibes = games.map { $0.vibes }
        let counts = vibes.reduce(into: [:]) { counts, vibe in
                counts[vibe, default: 0] += 1
            }
        return counts.max { $0.value < $1.value }?.key
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if totalGamesPlayed == 0 {
                    ContentUnavailableView(
                        "No games played",
                        systemImage: "nosign",
                        description: Text("Add a game to get started")
                    )
                } else {
                    List {
                        Section("Player") {
                            LabeledContent("Total games", value: "\(totalGamesPlayed)")
                            LabeledContent("Overall winrate", value: "\(overallWinRate)")
                            LabeledContent("Highest winrate", value: highestWinRateDeck?.name ?? "No wins yet")
                        }
                        Section("Sentiment") {
                            LabeledContent("Overall salt", value: overallSaltRating?.description ?? "No games played")
                            LabeledContent("Overall vibes", value: overallVibeRating?.description ?? "No games played")
                        }
                    }
                }
            }
            .navigationTitle("Stats")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close", systemImage: "xmark") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    StatSheet()
}
