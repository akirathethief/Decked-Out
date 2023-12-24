//
//  Decked_OutApp.swift
//  Decked Out
//
//  Created by Nick Rinehart on 10/23/23.
//

import SwiftUI
import SwiftData

@main
struct Decked_OutApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [DeckModel.self, CardModel.self])
        }
    }
}
