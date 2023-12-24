//
//  CardView.swift
//  Decked Out
//
//  Created by Nick Rinehart on 10/23/23.
//

import SwiftUI
import SwiftData

struct CardView: View {
    @State var card: CardModel
    @State var image: UIImage = UIImage()
    @State var showingDeleteAlert = false
    var body: some View {
        ScrollView {
            VStack {
                Text(card.name)
                
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                HStack {
                    Text("Mana Cost:")
                    Text(card.manaCost)
                }
                HStack {
                    Text("Colors:")
                    ForEach(card.colors, id: \.self) { color in
                        Text(color.rawValue)
                    }
                }
                HStack {
                    Text("Power:")
                    Text(card.power)
                    Spacer()
                    Text("Toughness:")
                    Text(card.toughness)
                }
                .padding()
                Text(card.orcaleText)
                    .padding()
                HStack {
                    Text("Price: $")
                    Text(card.price ?? "")
                }
                .padding()
            }
            .onAppear() {
                getImage(urlString: card.image)
            }
        }
    }
    
    func getImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let getDataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                image = UIImage(data: data)!
            }
        }
        getDataTask.resume()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: DeckModel.self, configurations: config)
                  
    return CardView(card: CardModel(name: "Test", manaCost: "4", colors: [ColorIdentity.r], power: "1", toughness: "2", orcaleText: "some string", image: "https://cards.scryfall.io/normal/front/c/f/cf1f630e-8b55-4f5a-a7f2-3161801de767.jpg?1698988082"))
        .modelContainer(container)
}
