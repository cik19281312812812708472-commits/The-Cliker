//
//  GameData.swift
//  The Cliker
//
//  Created by Desire on 2026-03-07.

//MARK: - My Heading

import Foundation
import Combine

enum AllBuildingsBlueprint: CaseIterable {
    
    case clickers
    case freelancers
    case softwareDev
    case employees
    case oilRefinery
    case manager
    case minimumWageWorker
    //add stock market stufffefeffef
    
  
    
    
    var stats: GeneralGameData.BuildingAttributesBlueprint {
        
        switch self {
            
        case .clickers:
            
            return .init (
                Building: self,
                amount: 0,
                costMultiplier: 1.05,
                Cost: 30,
                Increase: 1,
                IncreaseMultiplier: 1,
                rent: 0
            )
            
        case .freelancers:
            
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.2,
                Cost: 200,
                Increase: 5,
                IncreaseMultiplier: 1.0,
                rent: 0
            )
            
        case .softwareDev:
            
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.05,
                Cost: 1000,
                Increase: 115,
                IncreaseMultiplier: 1.0,
                rent: 15
            )
        
        case .employees:
            
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.001,
                Cost: 5000,
                Increase: 200,
                IncreaseMultiplier: 1.0,
                rent: 100
            )
            
        case .oilRefinery:
            
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.01,
                Cost: 1_156_767,
                Increase: 10000,
                IncreaseMultiplier: 1.0,
                rent: 1000
            )

        case .manager:
            
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.01,
                Cost: 156767,
                Increase: 0,
                IncreaseMultiplier: 1.0,
                rent: 10000 //MARK: make the manager be more rent the more employees 1 mannager has e.i: numOfEmployees/numOfManagers
            )
          
        case .minimumWageWorker:
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.0,
                Cost: 10000,
                Increase: 10,
                IncreaseMultiplier: 3.5,
                rent: 15
            )
        }//switch end
        
    }
    
    var displayName: String {
        
        switch self {
        case .clickers:
            return "Buy a Cliker."
        case .freelancers:
            return "Hire a Freelancer"
        case .softwareDev:
            return "Hire a Software Developer"
        case .employees:
            return "Hire an Employee"
        case .oilRefinery:
            return "Buy an Oil Refinery"
        case .manager:
            return "Hire a Manager"
        case .minimumWageWorker:
            return "Hire a minimum wage worker"
        }
        
        
    }
    
}

enum AllUpgrades_Blueprint: CaseIterable {
    
    case Efficiency
    
    var stats: GeneralGameData.Upgrade_Blueprint {
        
        switch self {
        case .Efficiency:
            return .init(
                upgrade: self,
                level: 0,
                costMultiplier: 2.5,
                Cost: 10000
            )
        }
        
    }
    
    var displayName: String {
        
        switch self {
        case .Efficiency:
            return "Upgrade Efficiency."
        }
    }
    
}

//should only have func's for saving and storing data and initializing
class GeneralGameData: ObservableObject {
   
    @Published var roundLevel: Int = 3
    @Published var deltaClicks: Decimal = 0
    @Published var currentClicks: Decimal = 0
    @Published var allBuildingAttribites: [AllBuildingsBlueprint:BuildingAttributesBlueprint] = [:]
    @Published var allUpgrades: [AllUpgrades_Blueprint:Upgrade_Blueprint] = [:]
    //MARK: All the costs
    @Published var clickerCost: Decimal = 15
    
    
    //MARK: all the increases 
    //@Published var clickerIncrease: Decimal = 1
        
    
    func setStartingData() {
        
        
        // it creates a building attribute for each building by looking at the enum
        for buildingCase in AllBuildingsBlueprint.allCases {
            
            //adds the building
            allBuildingAttribites[buildingCase] = buildingCase.stats
            
        }
        
        // it creates a building attribute for each building by looking at the enum
        for upgradeCase in AllUpgrades_Blueprint.allCases {
            
          
           
            var upgradeCost: Decimal = 0
            var upgradeCostMultiplier: Decimal = 0
            
            switch upgradeCase {
                
                case .Efficiency:
                upgradeCost = 10000
                upgradeCostMultiplier = 2.5
                
            }
            
            let newUpgrade = Upgrade_Blueprint(upgrade: upgradeCase, level: 0, costMultiplier: upgradeCostMultiplier, Cost: upgradeCost)
            allUpgrades[upgradeCase] = newUpgrade
        }
    }
    
   
    struct BuildingAttributesBlueprint {
        
        var Building: AllBuildingsBlueprint
        var amount: Int
        
        var costMultiplier: Decimal
        var Cost: Decimal
        
        var Increase: Decimal
        var IncreaseMultiplier: Decimal
        
        var rent: Decimal
        
        var stockMarketValue: Decimal = 0
        
        init(Building: AllBuildingsBlueprint, amount: Int, costMultiplier: Decimal, Cost: Decimal, Increase: Decimal, IncreaseMultiplier: Decimal, rent: Decimal) {
            self.Building = Building
            self.amount = amount
            self.costMultiplier = costMultiplier
            self.Cost = Cost
            self.Increase = Increase
            self.IncreaseMultiplier = IncreaseMultiplier
            self.rent = rent
        }
        
    }
    
    struct Upgrade_Blueprint {
        
        var upgrade: AllUpgrades_Blueprint
        
        
        
        
        var level: Decimal = 0
        
        /// this is sopposed to be very large
        var costMultiplier: Decimal
        var Cost: Decimal
        
        
        
        init(upgrade: AllUpgrades_Blueprint, level: Decimal, costMultiplier: Decimal, Cost: Decimal) {
            self.upgrade = upgrade
            
            self.level = level
            self.costMultiplier = costMultiplier
            self.Cost = Cost
        }
        
    }
    
    
    
    
    
    
    
}
