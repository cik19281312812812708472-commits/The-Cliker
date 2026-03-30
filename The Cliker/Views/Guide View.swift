//
//  Guide View.swift
//  The Cliker
//
//  Created by Desire on 2026-03-26.
//

import SwiftUI


struct Guide_View: View {
    
    
    @EnvironmentObject var gameState: GeneralGameData
    
    
    var body: some View {
        
        
        
        
        GeometryReader { geo in
            ZStack {
                
                ScrollView {
                    
                    VStack {
                        Text("Guide")
                    }
                    .frame(width: geo.size.width)
                    
                    
                    
                }
                .frame(width: geo.size.width, height: geo.size.height)
               
                
                
                
                Button("Back") {
                    gameState.gameCondition = gameState.lastView
                    gameState.lastView = gameState.gameCondition
                    
                }
                .position(x: geo.size.width * 0.1, y: geo.size.height * 0.9)
                
                
            }
        }
       
        
        
    }
}
