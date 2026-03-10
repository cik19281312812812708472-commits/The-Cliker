//
//  The_ClikerApp.swift
//  The Cliker
//
//  Created by Desire on 2026-03-07.
//

import SwiftUI

@main
struct The_ClikerApp: App {
    
    @StateObject var gameState_Blueprint: GeneralGameData
    @StateObject var allGameMechanics_Blueprint: allGameMechanics

    init() {
        let state = GeneralGameData()
        _gameState_Blueprint = StateObject(wrappedValue: state)
        _allGameMechanics_Blueprint = StateObject(
            wrappedValue: allGameMechanics(gameState: state)
        )
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameState_Blueprint)
                .environmentObject(allGameMechanics_Blueprint)
            
        }
    }
}
