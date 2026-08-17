//
//  DeckDetail.swift
//  Thopter
//
//  Created by Jacobs, Joe on 4/22/26.
//

import SwiftUI
import SwiftData

struct DeckDetail: View {
    
    @Environment(\.editMode) private var editMode
    
    @Bindable var deck: Deck

    @State private var isShowingRenameAlert = false
    @State private var newName = ""
        
    var sortedGames: [Game] {
        return deck.games.sorted { $0.datePlayed > $1.datePlayed }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                
                ZStack {
                    AsyncImage(url: deck.commanderArtImage)  { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFit()
                    .stretchy()
                    .padding(.bottom, 10)
                    
                    Text("\(deck.commanderName)")
                        .font(.largeTitle.smallCaps())
                }
                
                if deck.gameCount == 0 {
                    ContentUnavailableView(
                        "No games played",
                        systemImage: "nosign",
                        description: Text("Games for this deck will show here once logged")
                    )
                } else {
                    GroupBox("Stats") {
                        LabeledContent("Games", value: deck.gameCount.description)
                        Divider()
                        LabeledContent("Wins", value: deck.winCount.description)
                        Divider()
                        LabeledContent("Win Rate", value: deck.winRateAsString)
                    }
                    .groupBoxStyle(.outsideLabel)
                    GroupBox("Games") {
                        ForEach(sortedGames) { game in
                            NavigationLink(value: game) {
                                LabeledContent {
                                    if game.gameStatus == .win {
                                        Label(game.gameStatus.description, systemImage: "trophy")
                                            .labelStyle(.iconOnly)
                                    }
                                } label: {
                                    Text(game.dateStringShort)
                                }
                            }
                            if game.id != sortedGames.last?.id {
                                Divider()
                                .padding(.vertical, 5)
                            }
                        }
                    }
                    .groupBoxStyle(.outsideLabel)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationTitle(deck.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Game.self) { game in
            GameDetail(game: game)
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Rename", systemImage: "pencil") {
                    isShowingRenameAlert = true
                    newName = deck.name
                }
            }
        }
        .alert("Rename Deck", isPresented: $isShowingRenameAlert) {
            TextField("New Name", text: $newName)
            Button("Cancel", role: .cancel) { }
            Button("Rename", role: .confirm) {
                deck.name = newName
                newName = ""
            }
        } message: {
            Text("Enter a new name for this deck")
        }
    }
}

#Preview {
    #warning("TODO: Preview provider")
}
