//
//  DeckModel.swift
//  Decked Out
//
//  Created by Nick Rinehart on 10/23/23.
//

import Foundation
import SwiftData

@Model

class DeckModel {
    var name: String
    var format: String
    var maxSize: Int
    var cards: [CardModel]
    
    init() {
        self.name = ""
        self.format = ""
        self.maxSize = 0
        self.cards = []
    }
    
    init(name: String, format: String, maxSize: Int) {
        self.name = name
        self.format = format
        self.maxSize = maxSize
        self.cards = []
    }
}
