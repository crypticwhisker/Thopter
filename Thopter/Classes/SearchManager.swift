//
//  SearchManager.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/27/26.
//

import Foundation
import Forge

struct SearchManager {
    
    private let client: ForgeClient = .shared
    
    func search(query: String) async throws -> [SFCard] {
        let fullQuery = query + " legal:commander is:commander" // Limit to only legal commanders
        let results = try await client.getCardsSearch(for: fullQuery)
        return results.data
    }
}
