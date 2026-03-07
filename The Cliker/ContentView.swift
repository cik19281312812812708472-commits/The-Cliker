//
//  ContentView.swift
//  The Cliker
//
//  Created by Desire on 2026-03-07.
//

import SwiftUI

enum gameConditionBlueprint {
    
    case startedGame
    case playingGame
    
}


struct ContentView: View {
    
    @State private var gameCondition: gameConditionBlueprint = .startedGame
    
    var body: some View {
        
        switch gameCondition {

        case .startedGame:
            ClickingView()
        case .playingGame:
            Button("clik to play") {
                
                gameCondition = .playingGame
                
            }
            
        }
        
        
    }
}

#Preview {
    ContentView()
}
