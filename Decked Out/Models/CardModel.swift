//
//  CardModel.swift
//  Decked Out
//
//  Created by Nick Rinehart on 10/23/23.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class CardModel {
    var name: String
    var manaCost: String
    var colors: [ColorIdentity]
    var power: String
    var toughness: String
    var orcaleText: String
    var image: String
    var legal: Legal?
    var price: String?
    
    init() {
        name = ""
        manaCost = ""
        colors = []
        power = ""
        toughness = ""
        orcaleText = ""
        image = ""
        legal = Legal()
        price = "Not Found"
    }
    
    init(name: String, manaCost: String, colors: [ColorIdentity], power: String, toughness: String, orcaleText: String, image: String) {
        self.name = name
        self.manaCost = manaCost
        self.colors = colors
        self.power = power
        self.toughness = toughness
        self.orcaleText = orcaleText
        self.image = image
        self.legal = Legal()
        price = "Not Found"
    }
}

struct Legal: Hashable, Codable {
    var standard: Bool = false
    var modern: Bool = false
    var commander: Bool = false
    var legacy: Bool = false
}
