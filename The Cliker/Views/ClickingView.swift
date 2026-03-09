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
        
        GeometryReader { geometry in
            
            ZStack {
                
                Text("Cliks:\(gameState.totalClicks)")
                    .position(x:geometry.size.width/2, y:geometry.size.height/1.5)
                
                Button {
                    gameState.totalClicks += 1
                } label: {
                    Image("Clik!")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                .position(x:geometry.size.width/2, y:geometry.size.height/2)
                
            }
            
        }
    }
    
    
    
}

