//
//  Salt.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/22/26.
//

import Foundation

enum Salt: String, CaseIterable, Codable {
    case low, medium, high
    
    var description: String {
        switch self {
        case .low: return "Low"
        case .medium: return "Medium"
        case .high: return "High"
        }
    }
}
