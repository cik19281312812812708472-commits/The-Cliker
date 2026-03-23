//
//  BuildingButton.swift
//  The Cliker
//
//  .
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
        
        var buildingAttributtes: GeneralGameData.BuildingAttributesBlueprint {
            
            guard let attributes = gameState.allBuildingAttribites[whatBuilding] else {
               fatalError("what building isn't in the allbuilding attributes. Location: UI_BuildingButton, getBuildingAttributtes")
            }
            
            return attributes
        }
        
        
        
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
                case .office:
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
                case .nuclearSilo:
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
                case .steelMill:
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
                case .uraniumMine:
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
                case .uraniumMill:
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
                case .factory:
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
                case .mine:
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
                } //switch end
           
            }
            .contextMenu {
                
                HStack {
                    
                    Text("Asset Info")
                        .font(.system(size: 14, weight: .medium))
                    Divider()
                        .padding()
                    
                    Text("You have \(UI_Functions.stateNumber(whatNumber: Decimal(buildingAttributtes.amount))) of this asset")
                    Text("This asset should give you \(UI_Functions.stateNumber(whatNumber: (buildingAttributtes.Increase * buildingAttributtes.IncreaseMultiplier) )) clicks")
                        .foregroundColor(.black)
                    
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
        
        var upgradeAttributtes: GeneralGameData.Upgrade_Blueprint {
           
            
            guard let attributes = gameState.allUpgrades[whatUpgrade] else {
                print("Upgrade: ", whatUpgrade)
                print("keys: ", gameState.allUpgrades.keys)
                print("All upgrades: ", gameState.allUpgrades)
               fatalError("what upgrade isn't in the allbuilding attributes. Location: UI_BuildingButton, getBuildingAttributtes")
            }
            
            return attributes
        }
        
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
                    let Cost = upgradeAttributtes.Cost
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

                }//label end
                .contextMenu {
            
                    VStack {
                        Text("Upgrade Info")
                            .font(.system(size: 14, weight: .medium))
                        Divider()
                        
                        
                        Text("You have \(UI_Functions.stateNumber(whatNumber: upgradeAttributtes.level)) of this asset")
                            .foregroundColor(.black)
                        Text("This upgrade should multiply your clicks by \(UI_Functions.stateNumber(whatNumber: upgradeAttributtes.clickMultiplier ))")
                          //  .foregroundColor(.yellow)
                        
                        if whatUpgrade == .clicking {
                            Text("Your clicking will gain by 10% of your Clicks per second")
                        }
                        
                        if whatUpgrade == .employeers {
                            Text("This will automatically buy employees every second. So long as you have at least a trillion.")
                        }
                        
                    }
                }
                
                
                
            
            
            
        }
        
        init(whatUpgrade: AllUpgrades_Blueprint) {
            self.whatUpgrade = whatUpgrade
         
        }
        
        
    }
    
    
    
}
