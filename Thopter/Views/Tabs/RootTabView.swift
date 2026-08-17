//
//  RootTabView.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/22/26.
//

import SwiftUI
import SwiftData

struct RootTabView: View {
    var body: some View {
        TabView {
            Tab("Games", systemImage: "person.3") {
                GameTab()
            }
            Tab("Decks", systemImage: "square.stack.3d.down.right") {
                DeckTab()
            }
        }
    }
}

#Preview {
    #warning("TODO: Preview provider")
}
