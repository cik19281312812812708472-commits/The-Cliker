//
//  The_ClikerApp.swift
//  The Cliker
//
// 
//

import SwiftUI

@main
struct The_ClikerApp: App {
    
    @StateObject var gameState_Blueprint: GeneralGameData
    @StateObject var allGameMechanics_Blueprint: allGameMechanics
    
    @StateObject var LoanSharkMechanics_Blueprint: LoanSharkMechanics
    @StateObject var LoanSharkData_Blueprint: LoanSharkData
    
    @StateObject var Buttons_Blueprint: Buttons_Class
    
    @StateObject var UI_Functions_Blueprint: UI_Functions
    
    @StateObject var soundManager: SoundManager
    
    @StateObject var appData: AppData
    
    init() {
        let appdata = AppData()
        let state = GeneralGameData()
        let loanSharkState = LoanSharkData()
        let loanSharkMechanics = LoanSharkMechanics(gameState: state, loanSharkState: loanSharkState)
        let soundManager = SoundManager(appData: appdata)
        
      
        _UI_Functions_Blueprint = StateObject(wrappedValue: UI_Functions(gameState: state))
        
        
        _gameState_Blueprint = StateObject(wrappedValue: state)
        
        
        
        _allGameMechanics_Blueprint = StateObject(
            wrappedValue: allGameMechanics(gameState: state, loanSharkMechanics: loanSharkMechanics, soundManager: soundManager)
        )
        
        _LoanSharkData_Blueprint = StateObject(wrappedValue: loanSharkState)
        _LoanSharkMechanics_Blueprint = StateObject(
            wrappedValue: LoanSharkMechanics(gameState: state, loanSharkState: loanSharkState)
        )
        
        _Buttons_Blueprint = StateObject(wrappedValue: Buttons_Class(gameState: state))
        
        _soundManager = StateObject(wrappedValue: soundManager)
        
        
        _appData = StateObject(wrappedValue: appdata)
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameState_Blueprint)
                .environmentObject(allGameMechanics_Blueprint)
                .environmentObject(UI_Functions_Blueprint)
                .environmentObject(appData)
                .environmentObject(soundManager)
            
        }
    }
}
