//
//  Create World.swift
//  The Cliker
//
//  
//


import SwiftUI


struct CreateWorld_View: View {
    
    
    @EnvironmentObject var gameState: GeneralGameData
    
    @State private var worldName: String = ""
    
    var body: some View {
        
       
        
        GeometryReader { geo in
            ZStack {
                
                Text("What are you going to call your new world?")
                    .font(.largeTitle)
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.2)
                
                Button {
                    
                    // make sure the other views know that a world is being loaded:
                    //saving the old world
                    gameState.deleteData(worldName: gameState.currentWorld)
                    gameState.saveData(worldName: gameState.currentWorld)
                    
                   
                    //creating the new world via saving
                    gameState.currentWorld = worldName
                    gameState.worldBeingLoaded = worldName
                   // gameState.setStartingData()
                    gameState.saveData(worldName: worldName)
                    gameState.loadData(worldName: worldName)
                    
                    //setting the current world to the new world
                    
                    
                    gameState.gameCondition = .playingGame
                } label: {
                    Text("Create World")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundStyle(Color(.black))
                        .padding(10)
                        .background(.yellow)
                        .cornerRadius(10)
                       
                }
                .contextMenu {
                    Text("This will create and load the new world, and will save the current one.")
                    Divider()
                    Text("If the world already exists the world will just be loaded.")
                }
                .buttonStyle(.plain)
                .position(x: geo.size.width * 0.5, y: geo.size.height * 0.6)
                
                
                
                Text("World Name:")
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.4)
                
                TextField("What is the world's name?", text: $worldName)
                    .frame(width: geo.size.width * 0.6, height: geo.size.height * 0.1)
                    .foregroundStyle(Color(.blue))
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.5)
                   
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
