//
//  DeckViewModel.swift
//  Decked Out
//
//  Created by Nick Rinehart on 11/22/23.
//

import Foundation
import SwiftData

enum Format: String, Codable {
    case standard = "Standard"
    case modern = "Modern"
    case commander = "Commander"
    case legacy = "Legacy"
}

struct DeckViewModel {
    
    func addDeck(name: String, format: String, context: ModelContext) {
        let maxSize: Int
        if (format == "Commander") {
            maxSize = 100
        }
        else {
            maxSize = 60
        }
        let newDeck = DeckModel(name: name, format: format, maxSize: maxSize)
        context.insert(newDeck)
    }
}
