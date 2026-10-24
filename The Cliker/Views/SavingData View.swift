//
//  SavingData View.swift
//  The Cliker
//
//  
//

import SwiftUI


struct SavingData_View: View {
    
    @EnvironmentObject var gameState: GeneralGameData
    @State private var worldName: String = ""
    
    @State private var savingWorld: Bool = false
    
    let savingAnimationWaitTime: Double = 1.5
    var body: some View {
        
       
        
        GeometryReader { geo in
            ZStack {
                
                Text("What are you going to call your world?")
                    .font(.largeTitle)
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.2)
                
                Button {
                    
                    gameState.deleteData(worldName: gameState.currentWorld)
                    gameState.saveData(worldName: worldName)
                    gameState.currentWorld = worldName
                    
                    savingWorld = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + savingAnimationWaitTime) {
                        savingWorld = false
                    }
                    
                } label: {
                    
                    Text(savingWorld ? "Saved" : "Save World")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundStyle(Color(.black))
                        .padding(10)
                       
                }
                .contextMenu {
                    Text("This will save the current state of this world.")
                }
                .buttonStyle(SavingAnimation(activateAnimation: savingWorld, pressedColor: .green, unPressedColor: .yellow, duration: 0.1, minimumScale: 0.95))
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
