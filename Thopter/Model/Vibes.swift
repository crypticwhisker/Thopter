//
//  Vibes.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/22/26.
//

import Foundation

enum Vibes: String, CaseIterable, Codable {
    case disappointed, meh, fun
    
    var description: String {
        switch self {
        case .disappointed: return "Disappointed"
        case .meh: return "Meh"
        case .fun: return "Fun"
        }
    }
}
