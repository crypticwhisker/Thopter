//
//  Game.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/22/26.
//

import Foundation
import SwiftData

@Model
class Game: Identifiable {
    
    // User input
    var playerCount: Int
    var gameStatus: GameStatus
    var vibes: Vibes
    var salt: Salt
    var note: String
    @Relationship(inverse: \Deck.games) var deckUsed: Deck?
    
    // Internal only
    var datePlayed: Date
    var id: UUID
    
    // Computed properties
    var dateStringShort: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM d"
        return dateFormatter.string(from: datePlayed)
    }
    
    var dateStringFull: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM d, yyyy"
        return dateFormatter.string(from: datePlayed)
    }
    
    init(
        playerCount: Int,
        gameStatus: GameStatus,
        vibes: Vibes,
        salt: Salt,
        deckUsed: Deck?,
        date: Date,
        note: String = ""
    ) {
        self.playerCount = playerCount
        self.gameStatus = gameStatus
        self.vibes = vibes
        self.salt = salt
        self.deckUsed = deckUsed
        self.note = note
        self.datePlayed = date
        self.id = .init()
    }
        
}
