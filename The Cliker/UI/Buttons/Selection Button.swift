//
//  Selection Button.swift
//  The Cliker
//
//  Created by Desire on 2026-03-31.
//


import SwiftUI
import Foundation
import Combine


struct RecruiterSelection_Button: View {
    
    
    @EnvironmentObject var gameState: GeneralGameData
    @EnvironmentObject var UI_Functions: UI_Functions
    
    
    var whatBuilding: AllBuildingsBlueprint
    
    
    var buildingAttributtes: GeneralGameData.BuildingAttributesBlueprint {
        
        guard let attributes = gameState.allBuildingAttribites[whatBuilding] else {
            fatalError("variable whatBuilding isn't in the allbuilding attributes. whatBuilding = \(whatBuilding)")
        }
        
        return attributes
    }
    
    
    var body: some View {
        
        Button {
            
            
            gameState.allUpgrades[.employeers]?.buildingRecruiting = whatBuilding
            
            
            
        } label: {
            
            if let buildingRecruiting = gameState.allUpgrades[.employeers]?.buildingRecruiting {
                if (buildingRecruiting == whatBuilding) {
                    Text("\(whatBuilding.name) ")
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                   
                 
                        
                } else {
                    Text("\(whatBuilding.name) ")
                        .padding()
                        .cornerRadius(10)
                }
            } else {
                Text("\(whatBuilding.name) ")
                    .padding()
                    .cornerRadius(10)
            }
            
            
     
                
                
       
            
        }
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
}



