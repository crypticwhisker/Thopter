//
//  Deck.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/22/26.
//

import Foundation
import SwiftData
import SwiftUI
import Forge

@Model
class Deck: Identifiable {
     
    // User input
    var name: String
    var commanderName: String
    var commanderImage: URL?
    var commanderArtImage: URL?
    @Relationship(deleteRule: .cascade) var games: [Game]
    
    // Internal only
    var id: UUID

    // Computed properties
    var gameCount: Int {
        return games.count
    }
    
    var winCount: Int {
        return games.filter { $0.gameStatus == .win }.count
    }
    
    var winRate: Double {
        return Double(winCount) / Double(gameCount)
    }
    
    var winRateAsString: String {
        guard gameCount > 0 else { return "No games played" }
        return winRate.formatted(.percent.precision(.fractionLength(0)).rounded(rule: .down))
    }
    
    init(
        name: String,
        commanderName: String,
        commanderImage: URL?,
        commanderArtImage: URL?,
    ) {
        self.name = name
        self.commanderName = commanderName
        self.commanderImage = commanderImage
        self.commanderArtImage = commanderArtImage
        self.id = .init()
        self.games = []
    }
    
}
