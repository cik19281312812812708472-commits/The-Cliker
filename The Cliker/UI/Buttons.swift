//
//  BuildingButton.swift
//  The Cliker
//
//  Created by Desire on 2026-03-13.
//


import SwiftUI
import Foundation
import Combine

class Buttons_Class: ObservableObject {
    
    
    
    
    
    var gameState: GeneralGameData
    
    init(gameState: GeneralGameData) {
        self.gameState = gameState
    }
    
    
   
    
    struct UI_BuildingButton: View {
        
        @EnvironmentObject var gameState: GeneralGameData
        @EnvironmentObject var allGameMechanics: allGameMechanics
        @EnvironmentObject var UI_Functions: UI_Functions
        
        var whatBuilding: AllBuildingsBlueprint
        
        func getButtonColour(cost: Decimal) -> Color? {
            
            
            if gameState.currentClicks - cost < gameState.deltaClicks * -2 {
                return .red
            }
            
            if gameState.currentClicks - cost < 0 {
            return .yellow
            }
            
        return nil
        }
        
        var body: some View {
            
            Button {
                allGameMechanics.subtractClicks(whatBuilding: whatBuilding, UpgradeOrBuilding: false, whatUpgrade: .Efficiency)
                
                
                allGameMechanics.gameState.deltaClicks -= self.gameState.allBuildingAttribites[whatBuilding]?.Cost ?? 0
                
            } label: {
                
                let Cost = (gameState.allBuildingAttribites[whatBuilding]?.Cost ?? 0)
                
                switch whatBuilding {
                    
                case .clickers:
                    
                    HStack {
                        
                        Image("Cursor")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            
                        Text("$\(UI_Functions.stateNumber(whatNumber: Cost)) \(whatBuilding.displayName) ")
                                .padding()
                                .background(getButtonColour(cost: Cost))
                                .cornerRadius(10)
                            
                       
                    }
                    
                    
                case .freelancers:
                    
                    HStack {
                        Image("Freelancer")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("$\(UI_Functions.stateNumber(whatNumber: Cost)) \(whatBuilding.displayName) ")
                            .padding()
                            .background(getButtonColour(cost: Cost))
                            .cornerRadius(10)
                    }
                case .softwareDev:
                    HStack {
                        Image("Software Developer")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("$\(UI_Functions.stateNumber(whatNumber: Cost)) \(whatBuilding.displayName) ")
                            .padding()
                            .background(getButtonColour(cost: Cost))
                            .cornerRadius(10)
                    }
                case .employees:
                    HStack {
                        Image("Employee")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("$\(UI_Functions.stateNumber(whatNumber: Cost)) \(whatBuilding.displayName) ")
                            .padding()
                            .background(getButtonColour(cost: Cost))
                            .cornerRadius(10)
                    }
                case .oilRefinery:
                    HStack {
                        Image("Oil Refinery")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("$\(UI_Functions.stateNumber(whatNumber: Cost)) \(whatBuilding.displayName) ")
                            .padding()
                            .background(getButtonColour(cost: Cost))
                            .cornerRadius(10)
                    }
                case .manager:
                    HStack {
                        Image("Freelancer")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("$\(UI_Functions.stateNumber(whatNumber: Cost)) \(whatBuilding.displayName) ")
                            .padding()
                            .background(getButtonColour(cost: Cost))
                            .cornerRadius(10)
                    }
                case .minimumWageWorker:
                    HStack {
                        Image("Freelancer")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("$\(UI_Functions.stateNumber(whatNumber: Cost)) \(whatBuilding.displayName) ")
                            .padding()
                            .background(getButtonColour(cost: Cost))
                            .cornerRadius(10)
                    }
                }
                
                
            }
            
        }
        
        
        
        
        
        init(whatBuilding: AllBuildingsBlueprint) {
            self.whatBuilding = whatBuilding
        }
        
    }
    
    struct UI_UpgradeButton: View {
        
        @EnvironmentObject var gameState: GeneralGameData
        @EnvironmentObject var allGameMechanics: allGameMechanics
        @EnvironmentObject var UI_Functions: UI_Functions
        
        var whatUpgrade: AllUpgrades_Blueprint
        
        func getButtonColour(cost: Decimal) -> Color? {
            
            
            if gameState.currentClicks - cost < gameState.deltaClicks * -2 {
                return .red
            }
            
            if gameState.currentClicks - cost < 0 {
            return .yellow
            }
            
        return nil
        }
        
        var body: some View {
                
                
                Button {
                        
                    
                    allGameMechanics.subtractClicks(whatBuilding: .clickers, UpgradeOrBuilding: true, whatUpgrade: whatUpgrade)
                    
                    
                    allGameMechanics.gameState.deltaClicks -= self.gameState.allUpgrades[whatUpgrade]?.Cost ?? 0
                    
                } label: {
                    
                    let Cost = (self.gameState.allUpgrades[whatUpgrade]?.Cost ?? 0)
                    
                    switch whatUpgrade {
                        
                    case .Efficiency:
                        
                        HStack {
                            
                            Image("Cursor")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                
                            Text("$\(UI_Functions.stateNumber(whatNumber: Cost)) \(whatUpgrade.displayName) ")
                                            .padding()
                                            .background(getButtonColour(cost: Cost))
                                            .cornerRadius(10)
                          
                    }
                        
                    }//switch end

                }//label end
                .padding()
                
                
            
            
            
        }
    }
    
    
    
}
