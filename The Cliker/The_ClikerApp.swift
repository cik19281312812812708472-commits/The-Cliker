//
//  The_ClikerApp.swift
//  The Cliker
//
//  Created by Desire on 2026-03-07.
//

import SwiftUI

@main
struct The_ClikerApp: App {
    
    @StateObject public var gameState_Blueprint = GeneralGameData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameState)
            
        }
    }
}
