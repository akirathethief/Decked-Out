//
//  DeckView.swift
//  Decked Out
//
//  Created by Nick Rinehart on 10/23/23.
//

import SwiftUI
import SwiftData

struct DeckView: View {
    @State var deck: DeckModel
    @State var cardAlert = false
    @State var cardPopover = false
    @State var searchName = ""
    @StateObject var cardVM = CardViewModel()
    @State var alertText = ""
    @State var alertMessage = ""
    @State var legalityAlert = false
    @State var sizeAlert = false

    @Environment(\.modelContext) var modelContext
    var body: some View {
        NavigationStack {
            VStack {
                List(deck.cards, id: \.self) {
                    card in
                    NavigationLink(destination: CardView(card: card)) {
                        Text(card.name)
                            .swipeActions(allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    if let index = deck.cards.firstIndex(of: card) {
                                        deck.cards.remove(at: index)
                                    }
                                    modelContext.delete(card)
                                    
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                            }
                    }
                }
                Button("Add card") {
                    if (deck.cards.count >= deck.maxSize) {
                        alertText = "Deck Full"
                        alertMessage = "This deck exceedes the maxium size allowed by this format."
                    }
                    else {
                        alertText = "Add Card"
                        alertMessage = "Please enter a card you would like to add."
                    }
                    cardAlert = true
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle(deck.name)
            .alert(alertText, isPresented: $cardAlert, actions: {
                if (alertText == "Add Card") {
                    TextField("Card Name", text: $searchName)
                    
                    Button("Search", action: {
                        cardVM.getCardJsonData(search: searchName)
                        searchName = ""
                        cardAlert = false
                        cardVM.group.notify(queue: .main) {
                            if (cardVM.found) {
                                cardPopover = true
                            }
                        }
                    })
                }
                Button("Cancel", role: .cancel, action: {
                    cardAlert = false
                })
            }, message: {
                Text(alertMessage)
            })
            .popover(isPresented: $cardPopover, content: {
                CardView(card: cardVM.card)
                Button("Add card") {
                    if(deck.cards.count >= deck.maxSize) {
                        
                    }
                    else if(cardVM.checkLegality(card: cardVM.card, format: deck.format)) {
                        deck.cards.append(cardVM.card)
                        cardPopover = false
                    }
                    else {
                        legalityAlert = true
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Not Legal", isPresented: $legalityAlert, actions: {
                    Button("Close", role: .cancel, action: {
                        legalityAlert = false
                        cardPopover = false
                    })
                }, message: {
                    Text("This card is not legal in this format.")
                })
            })
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: DeckModel.self, configurations: config)
    
    return DeckView(deck: DeckModel(name: "Test", format: "Commander", maxSize: 1))
        .modelContainer(container)
}
