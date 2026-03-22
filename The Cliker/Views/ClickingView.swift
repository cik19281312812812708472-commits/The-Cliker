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
    @EnvironmentObject var BuildingButtonClass: Buttons_Class
    @EnvironmentObject var UI_Functions: UI_Functions
    
    @State private var tick: Timer?
    
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                
                
                
                if gameState.deltaClicks > 0 {
                    Text("+\(UI_Functions.stateNumber(whatNumber: gameState.deltaClicks))")
                        .foregroundColor(.white)
                        .padding(2)
                        .background(.green)
                        .cornerRadius(5)
                        .textSelection(.enabled)
                        .position(x:geometry.size.width/2, y:geometry.size.height/1.5)
                } else if gameState.deltaClicks < 0{
                    Text("\(UI_Functions.stateNumber(whatNumber: gameState.deltaClicks))")
                        .foregroundColor(.white)
                        .padding(2)
                        .background(.red)
                        .cornerRadius(5)
                        .textSelection(.enabled)
                        .position(x:geometry.size.width/2, y:geometry.size.height/1.5)
                } else {
                    Text("\(UI_Functions.stateNumber(whatNumber: gameState.deltaClicks))")
                        .foregroundColor(.white)
                        .padding(2)
                        .background(.gray)
                        .cornerRadius(5)
                        .textSelection(.enabled)
                        .position(x:geometry.size.width/2, y:geometry.size.height/1.5)
                }
                
                    
                Text("Cliks: \(UI_Functions.stateNumber(whatNumber: gameState.currentClicks))")
                    .position(x:geometry.size.width/2, y:geometry.size.height/2.5)
                
                
                Button {
                    gameState.currentClicks += 1
                } label: {
                    Image("Clik!")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
               .position(x:geometry.size.width/2, y:geometry.size.height/2)
                
                if gameState.worldNotFound == true {
                    Text("The world loaded wasn't found")
                        .foregroundColor(.black)
                        .padding(2)
                        .background(.yellow)
                        .cornerRadius(5)
                        .textSelection(.enabled)
                        .position(x:geometry.size.width/2, y:geometry.size.height * 0.1)
                }
                
                ScrollView {
                    Text("Saves")
                    
                    Divider()
                    Button {
                        gameState.lastView = gameState.gameCondition
                        gameState.gameCondition = .savingData
                        
                    } label: {
                        Text("Save Game")
                            .foregroundColor(.black)
                            .padding(2)
                            //.background(.gray)
                            .cornerRadius(5)
                            .textSelection(.enabled)
                    }
                    
                    Button {
                        gameState.lastView = gameState.gameCondition
                        gameState.gameCondition = .loadingData
                        
                    } label: {
                        Text("Load Game")
                            .foregroundColor(.black)
                            .padding(2)
                            //.background(.gray)
                            .cornerRadius(5)
                            .textSelection(.enabled)
                    }
                    
                }
                .frame(width: geometry.size.width * 0.1, height:  geometry.size.height * 0.1)
                .position(x:geometry.size.width/2, y:geometry.size.height * 0.9)
                
                VStack {
        
                    HStack {
                       
                        
                        ScrollView {
                        
                            VStack {
                            
                                Text("Upgrades:")
                                //let numOfBuildings = gameMechanics.findNumOfBuildings
                            
                                ForEach(Array(gameState.allUpgrades), id: \.key) { upgrades in
                                
                                    Buttons_Class.UI_UpgradeButton(whatUpgrade: upgrades.key)
                                        .textSelection(.enabled)
                                }
                            
                            }
                            .padding()
                        
                        }
                        .frame(width: geometry.size.height * 0.3, height: geometry.size.height * 0.99)// wrapps the scroll view
                        .background(.blue.opacity(0.2))// wraps the frame
                        .cornerRadius(100)//wraps the background
                        .offset(x: geometry.size.width * -0.1, y: 0)
                    
                        
                    
                        
                    
                        //all the builds in a scroll view
                   
                            ScrollView {
                            
                                VStack {
                                
                                    Text("Assets:")
                                    //let numOfBuildings = gameMechanics.findNumOfBuildings
                                
                                    ForEach(Array(gameState.allBuildingAttribites), id: \.key) { building in
                                    
                                        Buttons_Class.UI_BuildingButton(whatBuilding: building.key)
                                    
                                    }
                                
                                }
                                .padding()
                            
                            }
                            .frame(width: geometry.size.height * 0.5, height: geometry.size.height * 0.99)// wrapps the scroll view
                            .background(.blue.opacity(0.2))// wraps the frame
                            .cornerRadius(100)//wraps the background
                            .offset(x: geometry.size.width * 0.25, y: 0)
                            
                        
                    }//HStack end
                    
                    
                    
                }
            }
            
        } .onAppear() {
            
            tick = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in 
                gameMechanics.updateEverything()
            }
            if gameState.loadingWorld == true {
                gameState.loadData(worldName: gameState.worldBeingLoaded)
                gameState.loadingWorld = false
            }
        }
        
        
    }
    
    
   
}

