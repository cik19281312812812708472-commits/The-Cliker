//
//  SavingData View.swift
//  The Cliker
//
//  Created by Desire on 2026-03-15.
//

import SwiftUI


struct SavingData_View: View {
    
    @EnvironmentObject var gameState: GeneralGameData
    @State private var worldName: String = ""
    
    
    var body: some View {
        
       
        
        GeometryReader { geo in
            ZStack {
                
                Text("What are you going to call your world?")
                    .font(.largeTitle)
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.2)
                
                Button {
                    
                    gameState.deleteData(worldName: gameState.currentWorld)
                    gameState.saveData(worldName: worldName)
                } label: {
                    Text("Save World")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundStyle(Color(.black))
                        .padding(10)
                        .background(.yellow)
                        .cornerRadius(10)
                       
                }
                .contextMenu {
                    Text("This will save the current state of this world.")
                }
                .buttonStyle(.plain)
                .position(x: geo.size.width * 0.5, y: geo.size.height * 0.6)
                
                Button {
                    gameState.deleteData(worldName: gameState.currentWorld)
                } label: {
                    Text("Delete World")
                }
                .contextMenu {
                    Text("This will delete the world, but you can still play it for now...")
                }
                .position(x: geo.size.width * 0.5, y: geo.size.height * 0.7)
                
                Text("World Name:")
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.4)
                
                TextField("worldName", text: $worldName)
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
            worldName = gameState.currentWorld
        }
        
        
        
        
    }
    
}


#Preview {
    SavingData_View()
}
