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
    
    @StateObject var LoanSharkMechanics_Blueprint: LoanSharkMechanics
    @StateObject var LoanSharkData_Blueprint: LoanSharkData
    
    init() {
        let state = GeneralGameData()
        let loanSharkState = LoanSharkData()
        let loanSharkMechanics = LoanSharkMechanics(gameState: state, loanSharkState: loanSharkState)
        
        
        _gameState_Blueprint = StateObject(wrappedValue: state)
        
        
        
        _allGameMechanics_Blueprint = StateObject(
            wrappedValue: allGameMechanics(gameState: state, loanSharkMechanics: loanSharkMechanics)
        )
        
        _LoanSharkData_Blueprint = StateObject(wrappedValue: loanSharkState)
        _LoanSharkMechanics_Blueprint = StateObject(
            wrappedValue: LoanSharkMechanics(gameState: state, loanSharkState: loanSharkState)
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
