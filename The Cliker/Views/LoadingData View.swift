//
//  LoadingView.swift
//  The Cliker
//
//  Created by Desire on 2026-03-15.
//

import SwiftUI

struct LoadingData_View: View {
    
    @EnvironmentObject var gameState: GeneralGameData
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
               
                    
                    Text("What world do you want to load?")
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.4)
                
                    TextField("Name the world", text: $gameState.worldBeingLoaded)
                        .foregroundColor(.blue)
                        .frame(width: geometry.size.width * 0.6)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        
                    Button {
                        
                        gameState.gameCondition = .playingGame
                        
                    } label: {
                        
                        Text("Load World")
                            .foregroundColor(.black)
                            .padding(10)
                            .background(.yellow)
                            .cornerRadius(7)
                          
                            
                    }
                    .buttonStyle(.plain)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.7)
                    
               
            } //ZStack end
        }//geometry reader end
    }
    
}
