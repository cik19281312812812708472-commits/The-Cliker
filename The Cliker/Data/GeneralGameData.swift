//
//  GameData.swift
//  The Cliker
//
//  Created by Desire on 2026-03-07.
//MARK: - My Heading

import Foundation
import Combine

enum AllBuildingsBlueprint: CaseIterable {
    
    case Clickers
    
    
}

//should only have func's for saving and storing data and initializing
class GeneralGameData: ObservableObject {
   
    @Published var totalClicks: Decimal = 0
    @Published var allBuildingAttribites: [AllBuildingsBlueprint:BuildingAttributesBlueprint] = [:]
    //MARK: All the costs
    @Published var clickerCost: Decimal = 15
    
    
    //MARK: all the increases 
    @Published var clickerIncrease: Decimal = 1
        
    
    func setStartingData() {
        
        
        // it creates a building attribute for each building
        for buildingCase in AllBuildingsBlueprint.allCases {
            
            var buildingCost: Decimal = 0
            var buildingIncrease: Decimal = 0
            
            switch buildingCase {
                
                case .Clickers:
                    buildingCost = 15
                    buildingIncrease = 1
            }
            
            let newBuildingAttribute = BuildingAttributesBlueprint(Building: buildingCase, Cost: buildingCost, Increase: buildingIncrease)
            allBuildingAttribites[buildingCase] = newBuildingAttribute
            
        }
  
    }
    
   
    struct BuildingAttributesBlueprint {
        
        var Building: AllBuildingsBlueprint
        var Cost: Decimal
        var Increase: Decimal
        
        init(Building: AllBuildingsBlueprint, Cost: Decimal, Increase: Decimal) {
            self.Building = Building
            self.Cost = Cost
            self.Increase = Increase
        }
        
    }
    
    
    
    
    
    
}
