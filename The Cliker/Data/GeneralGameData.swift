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
    case Freelancers
    
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
        
        
        // it creates a building attribute for each building by looking at the enum
        for buildingCase in AllBuildingsBlueprint.allCases {
            
            var buildingCost: Decimal = 0
            var buildingIncrease: Decimal = 0
            var costMultiplier: Decimal = 0
            
            switch buildingCase {
                
                case .Clickers:
                    buildingCost = 15
                    buildingIncrease = 1
                costMultiplier = 1.1
                
            case .Freelancers:
                buildingCost = 100
                buildingIncrease = 5
                costMultiplier = 5
            }
            
            let newBuildingAttribute = BuildingAttributesBlueprint(Building: buildingCase, amount: 0, costMultiplier: costMultiplier, Cost: buildingCost, Increase: buildingIncrease)
            allBuildingAttribites[buildingCase] = newBuildingAttribute
            
        }
  
    }
    
   
    struct BuildingAttributesBlueprint {
        
        var Building: AllBuildingsBlueprint
        var amount: Int
        var costMultiplier: Decimal
        var Cost: Decimal
        var Increase: Decimal
        
        init(Building: AllBuildingsBlueprint, amount: Int, costMultiplier: Decimal, Cost: Decimal, Increase: Decimal) {
            self.Building = Building
            self.amount = amount
            self.costMultiplier = costMultiplier
            self.Cost = Cost
            self.Increase = Increase
        }
        
    }
    
    
    
    
    
    
}
