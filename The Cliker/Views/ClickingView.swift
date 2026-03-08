//
//  StarterView.swift
//  The Cliker
//
//  Created by Desire on 2026-03-07.
//

import SwiftUI


struct ClickingView: View {
    
    @EnvironmentObject var gameState: GeneralGameData
    
    var body: some View {
        Button {
            gameState.totalClicks += 1
        } label: {
            Image("Clik!")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                
        }
        
        
    }
    
    
    
}

