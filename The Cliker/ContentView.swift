//
//  ContentView.swift
//  The Cliker
//
//  Created by Desire on 2026-03-07.
//

import SwiftUI




struct ContentView: View {
    
    @EnvironmentObject var gameState: GeneralGameData
    
    var body: some View {
        
        switch gameState.gameCondition {

        case .startedGame:
            
            VStack{
                Button {
                    
                    gameState.gameCondition = .loadingData
                    
                } label: {
                    
                    Text("Clik to Play")
                    
                }
                
            }
            
        case .playingGame:
            ClickingView()
      
        
        case .savingData:
            ClickingView()
        case .loadingData:
            LoadingData_View()
        case .gameOver:
            ClickingView()
        }
        
        
    }
}

#Preview {
    ContentView()
}
