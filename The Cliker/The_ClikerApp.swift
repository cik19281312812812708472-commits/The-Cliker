//
//  The_ClikerApp.swift
//  The Cliker
//
//  Created by Desire on 2026-03-07.
//

import SwiftUI

@main
struct The_ClikerApp: App {
    
    @StateObject var gameState = GeneralGameData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameState)
            
        }
    }
}
