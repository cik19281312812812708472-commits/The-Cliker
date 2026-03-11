//
//  StarterView.swift
//  The Cliker
//
//  Created by Desire on 2026-03-07.
//

import SwiftUI


struct ClickingView: View {
    
    @EnvironmentObject var gameState: GeneralGameData
    @EnvironmentObject var gameMechanics: allGameMechanics
    
    @State private var tick: Timer?
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                if gameState.deltaClicks > 0 {
                    Text("+\(gameState.deltaClicks)")
                        .foregroundColor(.white)
                        .padding(2)
                        .background(.green)
                        .cornerRadius(5)
                        .position(x:geometry.size.width/2, y:geometry.size.height/1.5)
                } else if gameState.deltaClicks < 0{
                    Text("\(gameState.deltaClicks)")
                        .foregroundColor(.white)
                        .padding(2)
                        .background(.red)
                        .cornerRadius(5)
                        .position(x:geometry.size.width/2, y:geometry.size.height/1.5)
                } else {
                    Text("\(gameState.deltaClicks)")
                        .foregroundColor(.white)
                        .padding(2)
                        .background(.gray)
                        .cornerRadius(5)
                        .position(x:geometry.size.width/2, y:geometry.size.height/1.5)
                }
                
                    
                Text("Cliks:\(gameState.currentClicks)")
                    .position(x:geometry.size.width/2, y:geometry.size.height/2.5)
                
                VStack {
        
                    HStack {
                       
                    
                        Button {
                            gameState.currentClicks += 1
                        } label: {
                            Image("Clik!")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                        .position(x:geometry.size.width/2, y:geometry.size.height/2)
                    
                        
                    
                        //all the builds in a scroll view
                   
                            ScrollView {
                            
                                VStack {
                                
                                    Text("Assets:")
                                    //let numOfBuildings = gameMechanics.findNumOfBuildings
                                
                                    ForEach(Array(gameState.allBuildingAttribites), id: \.key) { building in
                                    
                                        gameMechanics.createBuildingButton(whatBuilding: building.key)
                                    
                                    }
                                
                                }
                                .padding()
                            
                            }
                            .frame(width: geometry.size.height * 0.5, height: geometry.size.height * 0.99)// wrapps the scroll view
                            .background(.blue.opacity(0.2))// wraps the frame
                            .cornerRadius(100)//wraps the background
                            .offset(x: geometry.size.width * -0.1, y: 0)
                            
                        
                    }//HStack end
                    
                    
                    
                }
            }
            
        } .onAppear() {
            
            tick = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in 
                gameMechanics.updateEverything()
            }
            gameState.setStartingData()
        }
        
        
    }
    
    
    
}

