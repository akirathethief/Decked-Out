//
//  ContentView.swift
//  Decked Out
//
//  Created by Nick Rinehart on 10/23/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var createDeck = false
    @State private var name = ""
    @State private var format = Format.standard
    @State private var deckVM = DeckViewModel()
    @Environment(\.modelContext) var modelContext
    @Query var decks: [DeckModel]
    
    var body: some View {
        NavigationStack {
            VStack {
                List(decks, id: \.self) {
                    deck in
                    NavigationLink(destination: DeckView(deck: deck)) {
                        HStack {
                            Text(deck.name)
                            Text("-")
                            Text(deck.format)
                                .swipeActions(allowsFullSwipe: false) {
                                    Button(role: .destructive) {
                                        deck.cards.forEach {
                                            modelContext.delete($0)
                                        }
                                        modelContext.delete(deck)
                                    } label: {
                                        Label("Delete", systemImage: "trash.fill")
                                    }
                                }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination: LocationView()) {
                        Image(systemName: "location.circle")
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button(action:
                    {
                        createDeck = true
                    },
                            label: {
                        Image(systemName: "plus.app")
                    })
                }
            }
            .padding()
            .navigationTitle("Decked Out")
            .popover(isPresented: $createDeck) {
                VStack {
                    Form {
                        Section {
                            TextField("Enter Deck Name", text: $name)
                            Picker("Format", selection: $format) {
                                Text("Standard").tag(Format.standard)
                                Text("Modern").tag(Format.modern)
                                Text("Commander").tag(Format.commander)
                                Text("Legacy").tag(Format.legacy)
                            }
                        }
                        Button("Create new deck") {
                            deckVM.addDeck(name: name, format: format.rawValue, context: modelContext)
                            createDeck = false
                        }
                    }
                }
            }
        }
    }
    
    /*func addDeck(name: String, format: String) {
        let maxSize: Int
        if (format == "Commander") {
            maxSize = 100
        }
        else {
            maxSize = 60
        }
        let newDeck = DeckModel(name: name, format: format, maxSize: maxSize)
        modelContext.insert(newDeck)
    }
    
    enum Format: String, Codable {
        case standard = "Standard"
        case modern = "Modern"
        case commander = "Commander"
    }*/
}

#Preview {
    ContentView()
        .modelContainer(for: DeckModel.self)
}
