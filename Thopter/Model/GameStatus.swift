//
//  GameStatus.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/28/26.
//

import Foundation

enum GameStatus: String, CaseIterable, Codable {
    case win, loss, draw
    
    var description: String {
        switch self {
        case .win: return "Win"
        case .loss: return "Loss"
        case .draw: return "Draw"
        }
    }
}
