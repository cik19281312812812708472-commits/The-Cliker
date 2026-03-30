//
//  LoadingView.swift
//  The Cliker
//
//  
//

import SwiftUI

enum worldLookingState_Blueprint {
    
    
    case keyBoard
    case worldList
    
}


struct LoadingData_View: View {
    
    @EnvironmentObject var gameState: GeneralGameData
    @State var worldLookingState: worldLookingState_Blueprint = .worldList
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
               
                Text("What world are you going to load?")
                    .font(.largeTitle)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.2)
                
                
                    Text("What world do you want to load?")
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.4)
                
                
                if worldLookingState == .keyBoard {
                    
                    Button {
                        gameState.lastView = gameState.gameCondition
                        gameState.gameCondition = .playingGame
                        gameState.loadingWorld = true
                    } label: {
                        
                        Text("Load World")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundStyle(Color(.black))
                            .padding(10)
                            .background(.yellow)
                            .cornerRadius(10)
                           
                            
                           
                          
                            
                    }
                    .buttonStyle(.plain)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.7)
                    
                    TextField("Name the world", text: $gameState.worldBeingLoaded)
                        .foregroundColor(.blue)
                        .frame(width: geometry.size.width * 0.6)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                } else {
                    
                    
                    ScrollView {
                        
                        Text("Worlds:")
                            .font(.title3)
                            .fontWeight(.black)
                        
                        RoundedRectangle(cornerRadius: geometry.size.width * 0.00001)
                            .frame(width: geometry.size.width * 0.12, height: geometry.size.height * 0.002)
                            .fixedSize()
                           
                        
                        ForEach(gameState.worldsSaved, id: \.self) { world in
                            
                            Button {
                                gameState.worldBeingLoaded = world
                                gameState.lastView = gameState.gameCondition
                                gameState.gameCondition = .playingGame
                                gameState.loadingWorld = true
                            } label: {
                                Text(world)
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .background(.yellow)
                                    .cornerRadius(7)
                            }
                            
                        }
                        
                    }
                    .frame(width: geometry.size.height * 0.25, height: geometry.size.height * 0.3)
                    .background(Color.cyan.opacity(0.2))
                    .cornerRadius(10)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.7 )
                    
                }
                    
                if worldLookingState == .keyBoard {
                    Button {
                        
                        worldLookingState = .worldList
                    } label: {
                        Text("List worlds")
                            .padding(10)
                            .cornerRadius(7)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.9)
                    
                } else {
                    Button {
                        worldLookingState = .keyBoard
                    } label: {
                        Text("Type a world")
                            .padding(10)
                            .cornerRadius(7)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.9)
                }
                
                Button("Back") {
                    gameState.gameCondition = gameState.lastView
                    gameState.lastView = gameState.gameCondition
                    
                }
                .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.9)
               
                
                
                
                
                Button {
                    gameState.lastView = gameState.gameCondition
                    gameState.gameCondition = .creatingWorld
                } label: {
                    Text("Create a World")
                       
                        .padding(2)
                        //.background(.gray)
                        .cornerRadius(5)
                        .textSelection(.enabled)
                }
                .position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.9)
                
                
                
            } //ZStack end
        }//geometry reader end
    }
    
}
