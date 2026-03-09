//
//  GameData.swift
//  The Cliker
//
//  Created by Desire on 2026-03-07.
//MARK: - My Heading

import Foundation
import Combine

enum AllBuildingsBlueprint_blueprint: CaseIterable {
    
    case numOfClickers
    
    
}

//should only have func's for saving and storing data and initializing
class GeneralGameData: ObservableObject {
   
    @Published var totalClicks: Decimal = 0
    @Published var allBuildingAttribites: [AllBuildingsBlueprint_blueprint:BuildingAttributesBlueprint] = [:]
    //MARK: All the costs
    @Published var clickerCost: Decimal = 15
    
    
    //MARK: all the increases 
    @Published var clickerIncrease: Decimal = 1
        
    
    func setStartingData() {
        
        for buildingCase in AllBuildingsBlueprint_blueprint.allCases {
            
            var buildingCost: Decimal = 0
            var buildingIncrease: Decimal = 0
            
            switch buildingCase {
                
                case .numOfClickers:
                    buildingCost = 15
                    buildingIncrease = 1
            }
            
            let newBuildingAttribute = BuildingAttributesBlueprint(Building: buildingCase, Cost: buildingCost, Increase: buildingIncrease)
            allBuildingAttribites[buildingCase] = newBuildingAttribute
            
        }
  
    }
    
   
    struct BuildingAttributesBlueprint {
        
        var Building: AllBuildingsBlueprint_blueprint
        var Cost: Decimal
        var Increase: Decimal
        
        init(Building: AllBuildingsBlueprint_blueprint, Cost: Decimal, Increase: Decimal) {
            self.Building = Building
            self.Cost = Cost
            self.Increase = Increase
        }
        
    }
    
    
    
    
    
    
}
