//
//  ContentView.swift
//  The Cliker
//
//  
//

import SwiftUI




struct ContentView: View {
    
    @EnvironmentObject var gameState: GeneralGameData
    
    var body: some View {
        
        switch gameState.gameCondition {

        case .startedGame:
            
            VStack{
                Button {
                    
                    gameState.lastView = .startedGame
                    gameState.loadWorldsSaved()
                    if gameState.worldsSaved.count != 0 {
                        gameState.loadingWorld = true 
                        gameState.gameCondition = .loadingData
                    } else {
                        gameState.loadingWorld = true
                        gameState.worldBeingLoaded = "World 1"
                        gameState.gameCondition = .playingGame
                    }
                    
                } label: {
                    
                    Text("Clik to Play")
                    
                }
                
            }
            
        case .playingGame:
            ClickingView()
      
        
        case .savingData:
            SavingData_View()
        case .loadingData:
            LoadingData_View()
        case .gameOver:
            ClickingView()
        case .creatingWorld:
            CreateWorld_View()
        }
        
        
    }
}

#Preview {
    ContentView()
}
