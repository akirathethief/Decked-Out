//
//  CardViewModel.swift
//  Decked Out
//
//  Created by Nick Rinehart on 10/23/23.
//

import Foundation
import SwiftUI

struct Datum: Codable {
    let object: DatumObject
    let id, oracleID: String
    let multiverseIDS: [Int]
    let mtgoID, tcgplayerID, cardmarketID: Int?
    let name: String
    let lang: Lang
    let releasedAt: String
    let uri, scryfallURI: String
    let layout: Layout
    let highresImage: Bool
    let imageStatus: ImageStatus
    let imageUris: ImageUris?
    let manaCost: String?
    let cmc: Int
    let typeLine: String
    let oracleText, power, toughness: String?
    let colors, colorIndicator: [ColorIdentity]?
    let colorIdentity: [ColorIdentity]
    let keywords: [String]
    let allParts: [AllPart]?
    let legalities: Legalities
    let games: [Game]
    let reserved, foil, nonfoil: Bool
    let finishes: [Finish]
    let oversized, promo, reprint, variation: Bool
    let setID, datumSet, setName: String
    let setType: SetType
    let setURI, setSearchURI, scryfallSetURI, rulingsURI: String
    let printsSearchURI: String
    let collectorNumber: String
    let digital: Bool
    let rarity: Rarity
    let cardBackID: String?
    let artist: String
    let artistIDS: [String]
    let illustrationID: String?
    let borderColor: BorderColor
    let frame: String
    let frameEffects: [FrameEffect]?
    let securityStamp: SecurityStamp?
    let fullArt, textless, booster, storySpotlight: Bool
    let edhrecRank: Int?
    let preview: Preview?
    let prices: [String: String?]
    let relatedUris: RelatedUris
    let purchaseUris: PurchaseUris?
    let arenaID: Int?
    let cardFaces: [CardFace]?
    let pennyRank: Int?
    let flavorText: String?
    let mtgoFoilID: Int?
    let promoTypes: [String]?
    let producedMana: [ColorIdentity]?
    let watermark: String?

    enum CodingKeys: String, CodingKey {
        case object, id
        case oracleID = "oracle_id"
        case multiverseIDS = "multiverse_ids"
        case mtgoID = "mtgo_id"
        case tcgplayerID = "tcgplayer_id"
        case cardmarketID = "cardmarket_id"
        case name, lang
        case releasedAt = "released_at"
        case uri
        case scryfallURI = "scryfall_uri"
        case layout
        case highresImage = "highres_image"
        case imageStatus = "image_status"
        case imageUris = "image_uris"
        case manaCost = "mana_cost"
        case cmc
        case typeLine = "type_line"
        case oracleText = "oracle_text"
        case power, toughness, colors
        case colorIndicator = "color_indicator"
        case colorIdentity = "color_identity"
        case keywords
        case allParts = "all_parts"
        case legalities, games, reserved, foil, nonfoil, finishes, oversized, promo, reprint, variation
        case setID = "set_id"
        case datumSet = "set"
        case setName = "set_name"
        case setType = "set_type"
        case setURI = "set_uri"
        case setSearchURI = "set_search_uri"
        case scryfallSetURI = "scryfall_set_uri"
        case rulingsURI = "rulings_uri"
        case printsSearchURI = "prints_search_uri"
        case collectorNumber = "collector_number"
        case digital, rarity
        case cardBackID = "card_back_id"
        case artist
        case artistIDS = "artist_ids"
        case illustrationID = "illustration_id"
        case borderColor = "border_color"
        case frame
        case frameEffects = "frame_effects"
        case securityStamp = "security_stamp"
        case fullArt = "full_art"
        case textless, booster
        case storySpotlight = "story_spotlight"
        case edhrecRank = "edhrec_rank"
        case preview, prices
        case relatedUris = "related_uris"
        case purchaseUris = "purchase_uris"
        case arenaID = "arena_id"
        case cardFaces = "card_faces"
        case pennyRank = "penny_rank"
        case flavorText = "flavor_text"
        case mtgoFoilID = "mtgo_foil_id"
        case promoTypes = "promo_types"
        case producedMana = "produced_mana"
        case watermark
    }
}


struct AllPart: Codable {
    let object: AllPartObject
    let id: String
    let component: Component
    let name, typeLine: String
    let uri: String

    enum CodingKeys: String, CodingKey {
        case object, id, component, name
        case typeLine = "type_line"
        case uri
    }
}

enum Component: String, Codable {
    case comboPiece = "combo_piece"
    case token = "token"
}

enum AllPartObject: String, Codable {
    case relatedCard = "related_card"
}

enum BorderColor: String, Codable {
    case black = "black"
    case borderless = "borderless"
    case silver = "silver"
    case white = "white"
}


struct CardFace: Codable {
    let object: CardFaceObject
    let name, manaCost, typeLine, oracleText: String
    let colors: [ColorIdentity]?
    let power, toughness, flavorText: String?
    let artist, artistID: String
    let illustrationID: String?
    let imageUris: ImageUris?
    let flavorName: String?
    let colorIndicator: [ColorIdentity]?
    let defense: String?

    enum CodingKeys: String, CodingKey {
        case object, name
        case manaCost = "mana_cost"
        case typeLine = "type_line"
        case oracleText = "oracle_text"
        case colors, power, toughness
        case flavorText = "flavor_text"
        case artist
        case artistID = "artist_id"
        case illustrationID = "illustration_id"
        case imageUris = "image_uris"
        case flavorName = "flavor_name"
        case colorIndicator = "color_indicator"
        case defense
    }
}

enum ColorIdentity: String, Codable, Hashable {
    case b = "B"
    case g = "G"
    case r = "R"
    case u = "U"
    case w = "W"
    case c = "C"
}


struct ImageUris: Codable {
    let small, normal, large: String
    let png: String
    let artCrop, borderCrop: String

    enum CodingKeys: String, CodingKey {
        case small, normal, large, png
        case artCrop = "art_crop"
        case borderCrop = "border_crop"
    }
}

enum CardFaceObject: String, Codable {
    case cardFace = "card_face"
}

enum Finish: String, Codable {
    case foil = "foil"
    case nonfoil = "nonfoil"
}

enum FrameEffect: String, Codable {
    case convertdfc = "convertdfc"
    case fandfc = "fandfc"
    case inverted = "inverted"
    case legendary = "legendary"
    case nyxtouched = "nyxtouched"
    case sunmoondfc = "sunmoondfc"
}

enum Game: String, Codable {
    case arena = "arena"
    case mtgo = "mtgo"
    case paper = "paper"
}

enum ImageStatus: String, Codable {
    case highresScan = "highres_scan"
    case lowres = "lowres"
}

enum Lang: String, Codable {
    case en = "en"
}

enum Layout: String, Codable {
    case adventure = "adventure"
    case augment = "augment"
    case modalDfc = "modal_dfc"
    case normal = "normal"
    case transform = "transform"
}


struct Legalities: Codable {
    let standard, future, historic, gladiator: Alchemy
    let pioneer, explorer, modern, legacy: Alchemy
    let pauper, vintage, penny, commander: Alchemy
    let oathbreaker, brawl, historicbrawl, alchemy: Alchemy
    let paupercommander, duel, oldschool, premodern: Alchemy
    let predh: Alchemy
}

enum Alchemy: String, Codable {
    case legal = "legal"
    case notLegal = "not_legal"
    case restricted = "restricted"
    case banned = "banned"
}

enum DatumObject: String, Codable {
    case card = "card"
}


struct Preview: Codable {
    let source: String
    let sourceURI: String
    let previewedAt: String

    enum CodingKeys: String, CodingKey {
        case source
        case sourceURI = "source_uri"
        case previewedAt = "previewed_at"
    }
}


struct PurchaseUris: Codable {
    let tcgplayer, cardmarket, cardhoarder: String
}

enum Rarity: String, Codable {
    case common = "common"
    case mythic = "mythic"
    case rare = "rare"
    case uncommon = "uncommon"
    case bonus = "bonus"
}


struct RelatedUris: Codable {
    let gatherer: String?
    let tcgplayerInfiniteArticles, tcgplayerInfiniteDecks, edhrec: String

    enum CodingKeys: String, CodingKey {
        case gatherer
        case tcgplayerInfiniteArticles = "tcgplayer_infinite_articles"
        case tcgplayerInfiniteDecks = "tcgplayer_infinite_decks"
        case edhrec
    }
}

enum SecurityStamp: String, Codable {
    case acorn = "acorn"
    case arena = "arena"
    case oval = "oval"
    case triangle = "triangle"
}

enum SetType: String, Codable {
    case alchemy = "alchemy"
    case box = "box"
    case commander = "commander"
    case core = "core"
    case draftInnovation = "draft_innovation"
    case duelDeck = "duel_deck"
    case expansion = "expansion"
    case funny = "funny"
    case masterpiece = "masterpiece"
    case masters = "masters"
    case starter = "starter"
}


class CardViewModel: ObservableObject {
    
    @Published var card: CardModel = CardModel()
    @Published var group = DispatchGroup()
    @Published var found: Bool = false
    
    func getCardJsonData(search: String) {
        group.enter()
        card = CardModel()
        let urlAsString = "https://api.scryfall.com/cards/named?fuzzy=" + search
        
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
        
        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            var _: NSError?
            
            do {
                let decodedData = try JSONDecoder().decode(Datum.self, from: data!)
                DispatchQueue.main.async {
                    self.card.name = decodedData.name
                    self.card.manaCost = decodedData.manaCost ?? ""
                    self.card.colors = decodedData.colors ?? []
                    self.card.power = decodedData.power ?? ""
                    self.card.toughness = decodedData.toughness ?? ""
                    self.card.orcaleText = decodedData.oracleText ?? ""
                    self.card.image = decodedData.imageUris!.normal
                    if(decodedData.legalities.standard.rawValue == "legal" || decodedData.legalities.standard.rawValue == "restricted") {
                        self.card.legal?.standard = true
                    }
                    if(decodedData.legalities.modern.rawValue == "legal" || decodedData.legalities.modern.rawValue == "restricted") {
                        self.card.legal?.modern = true
                    }
                    if(decodedData.legalities.commander.rawValue == "legal" || decodedData.legalities.commander.rawValue == "restricted") {
                        self.card.legal?.commander = true
                    }
                    if(decodedData.legalities.legacy.rawValue == "legal" || decodedData.legalities.legacy.rawValue == "restricted") {
                        self.card.legal?.legacy = true
                    }
                    self.card.price = decodedData.prices["usd"] ?? "Not Found"
                    if (self.card.price == "Not Found") {
                        self.card.price = decodedData.prices["usd_foil"] ?? "Not Found"
                    }
                    self.found = true
                    self.group.leave()
                }
                
            } catch {
                print("error: \(error)")
                self.found = false
                self.group.leave()
            }
        })
        jsonQuery.resume()
    }
    
    func checkLegality(card: CardModel, format: String) -> Bool {
        if(format == "Standard") {
            return card.legal!.standard
        }
        else if(format == "Modern") {
            return card.legal!.modern
        }
        else if(format == "Commander") {
            return card.legal!.commander
        }
        else if(format == "Legacy") {
            return card.legal!.legacy
        }
        else {
            return false
        }
    }
}
