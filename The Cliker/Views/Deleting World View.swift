//
//  Deleting World View.swift
//  The Cliker
//
//  
//

import SwiftUI

struct DeleteWorld_View: View {
    
    @EnvironmentObject var gameState: GeneralGameData
    
    
    var body: some View {
        
       
        
        GeometryReader { geo in
            ZStack {
                
                Text("What World are you going to delete?")
                    .font(.largeTitle)
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.2)
                
                
                
                Text("Click to delete:")
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.4)
               
                
                ScrollView {
                    
                    Text("Worlds:")
                        .font(.headline)
                    
                    ForEach(gameState.worldsSaved, id: \.self) { world in
                        
                        Button {
                            
                            
                            
                            gameState.deleteData(worldName: world)
                            
                            gameState.lastView = gameState.gameCondition
                            gameState.gameCondition = .playingGame
                            gameState.importantInfo = .worldDeleted
                            
                        } label: {
                            Text(world)
                                .foregroundColor(.black)
                                .padding(10)
                                .background(.yellow)
                                .cornerRadius(7)
                        }
                        
                    }
                    
                }
                .frame(height: geo.size.height * 0.3)
                .background(Color.cyan.opacity(0.2))
                .cornerRadius(10)
                .position(x: geo.size.width * 0.5, y: geo.size.height * 0.7 )
                
                   
                Button("Back") {
                    gameState.gameCondition = gameState.lastView
                    gameState.lastView = gameState.gameCondition
                    
                }
                .position(x: geo.size.width * 0.1, y: geo.size.height * 0.9)
                
                
            }
        } .onAppear {
            
            
        }
        
        
        
        
    }
}
