//
//  ThopterApp.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/22/26.
//

import SwiftUI
import SwiftData

@main
struct ThopterApp: App {
    var body: some Scene {
        WindowGroup {
            RootTabView()
        }
        .modelContainer(for: [Game.self, Deck.self])
    }
}
