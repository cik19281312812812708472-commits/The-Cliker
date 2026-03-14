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
    case office
    case nuclearSilo
    case steelMill
    case uraniumMine
    case uraniumMill
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
                rent: 0,
                buildingType: [.gainers]
            )
            
        case .freelancers:
            
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.2,
                Cost: 200,
                Increase: 5,
                IncreaseMultiplier: 1.0,
                rent: 0,
                buildingType: [.employee]
            )
            
        case .softwareDev:
            
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.05,
                Cost: 500,
                Increase: 15,
                IncreaseMultiplier: 1.0,
                rent: 15,
                buildingType: [.employee]
            )
        
        case .employees:
            
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.001,
                Cost: 2000,
                Increase: 20,
                IncreaseMultiplier: 1.0,
                rent: 100,
                buildingType: [.employee]
            )
            
        case .oilRefinery:
            
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.01,
                Cost: 1_156_76700,
                Increase: 10000,
                IncreaseMultiplier: 1.0,
                rent: 1000,
                buildingType: [.building]
            )

        case .manager:
            
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.01,
                Cost: 156767,
                Increase: 0,
                IncreaseMultiplier: 1.0,
                rent: 10000,
                buildingType: [.manager] //MARK: make the manager be more rent the more employees 1 mannager has e.i: numOfEmployees/numOfManagers
            )
          
        case .minimumWageWorker:
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.0,
                Cost: 10000,
                Increase: 30,
                IncreaseMultiplier: 3.5,
                rent: 15,
                buildingType: [.employee]
            )
        case .office:
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.0,
                Cost: 10000,
                Increase: 30,
                IncreaseMultiplier: 3.5,
                rent: 15,
                buildingType: [.building]
            )
        case .nuclearSilo:
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.0,
                Cost: GeneralGameData().TranslateNum(100.121, suffix: " T"),
                Increase: GeneralGameData().TranslateNum(10, suffix: " B"),
                IncreaseMultiplier: 3.5,
                rent: 15,
                buildingType: [.building]//increases the less employees
            )
            
        case .steelMill:
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.0,
                Cost: GeneralGameData().TranslateNum(1.121, suffix: " B"),
                Increase: GeneralGameData().TranslateNum(10, suffix: " M"),
                IncreaseMultiplier: 3.5,
                rent: 15,
                buildingType: [.building] //incre
            )
        case .uraniumMine:
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.0,
                Cost: GeneralGameData().TranslateNum(200.121, suffix: " B"),
                Increase: GeneralGameData().TranslateNum(100, suffix: " M"),
                IncreaseMultiplier: 3.5,
                rent: 15,
                buildingType: [.building] //incre
            )
        case .uraniumMill:
            return .init(
                Building: self,
                amount: 0,
                costMultiplier: 1.0,
                Cost: GeneralGameData().TranslateNum(500.121, suffix: " B"),
                Increase: GeneralGameData().TranslateNum(200, suffix: " M"),
                IncreaseMultiplier: 3.5,
                rent: 15,
                buildingType: [.building] //incre
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
        case .office:
            return "Buy an office"
        case .nuclearSilo:
            return "Buy a Nuclear Silo"
        case .steelMill:
            return "Buy a Steel Mill"
        case .uraniumMine:
            return "Buy a Uranium Mine"
        case .uraniumMill:
            return "Buy a Uranium Mill"
        }
        
        
    }
    
}


enum allBuildingTypes {
    
    case employee
    case building
    case manager
    case gainers
    
}

enum AllUpgrades_Blueprint: CaseIterable {
    
    case Efficiency
    case rounding
    
    var stats: GeneralGameData.Upgrade_Blueprint {
        
        switch self {
        case .Efficiency:
            return .init(
                upgrade: self,
                level: 0,
                costMultiplier: 2.5,
                Cost: 10000,
                clickMultiplier: 0.0
            )
            
        case .rounding:
            return .init (
                upgrade: self,
                level: 0,
                costMultiplier: 2.5,
                Cost: 100000,
                clickMultiplier: 1.5
            )
        }
        
    }
    
    var displayName: String {
        
        switch self {
        case .Efficiency:
            return "Upgrade Efficiency."
        case .rounding:
            return "Rounding"
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
    
    
    @Published var allSuffixes: [String] = [" M", " B", " T", " Quadrillion", " Quintillion", " Sextillion", " Septillion", " Octillion", " Nonillion", " Decillion", " Undecillion", " Duodecillion", " Tredecillion", " Quattuordecillion", " Quindecillion", " Sexdecillion", " Septendecillion", " Octodecillion", " Novemdecillion", " Vigintillion", " Unvigintillion", " Duovigintillion", " Tresvigintillion", " Quattuorvigintillion", " Quinvigintillion", " Sexvigintillion", " Septenvigintillion", " Octovigintillion", " Novemvigintillion", " Trigintillion", " Untrigintillion", " Duotrigintillion", "Googol * 100" ]
    
    //MARK: all the increases 
    //@Published var clickerIncrease: Decimal = 1
        
    
    func setStartingData() {
        
        
        // it creates a building attribute for each building by looking at the enum
        for buildingCase in AllBuildingsBlueprint.allCases {
            
            //adds the building
            allBuildingAttribites[buildingCase] = buildingCase.stats
            
        }
        
        // it creates a building attribute for each building by looking at the enum MARK: change to work for an array
        for upgradeCase in AllUpgrades_Blueprint.allCases {
            
            allUpgrades[upgradeCase] = upgradeCase.stats
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
        
        var buildingType: [allBuildingTypes]
        
        init(Building: AllBuildingsBlueprint, amount: Int, costMultiplier: Decimal, Cost: Decimal, Increase: Decimal, IncreaseMultiplier: Decimal, rent: Decimal, buildingType: [allBuildingTypes]) {
            self.Building = Building
            self.amount = amount
            self.costMultiplier = costMultiplier
            self.Cost = Cost
            self.Increase = Increase
            self.IncreaseMultiplier = IncreaseMultiplier
            self.rent = rent
            self.buildingType = buildingType
        }
        
    }
    
    struct Upgrade_Blueprint {
        
        var upgrade: AllUpgrades_Blueprint
        
        
        
        
        var level: Decimal = 0
        
        /// this is sopposed to be very large
        var costMultiplier: Decimal
        var Cost: Decimal
        
        var clickMultiplier: Decimal
        
        
        init(upgrade: AllUpgrades_Blueprint, level: Decimal, costMultiplier: Decimal, Cost: Decimal, clickMultiplier: Decimal) {
            self.upgrade = upgrade
            
            self.level = level
            self.costMultiplier = costMultiplier
            self.Cost = Cost
            
            self.clickMultiplier = clickMultiplier
        }
        
    }
    
    
    func TranslateNum(_ whatNumber: Decimal, suffix: String) -> Decimal {
        
       
        
        
        var testSuffix: String = ""
        var index: Int = -1
        
        while testSuffix != suffix {
            index += 1
         
            testSuffix = allSuffixes[index]
        }
        
        
        guard let correctIndex = Int("\(index)") else { return 0 }
        
        // it is +1 to get the actual item #, *3 for it's place[million, billion] and +3 as there is no thousands
        let exponent = ((correctIndex + 1) * 3) + 3
        let result: Decimal = whatNumber * pow(10, exponent)
       // print("result: \(result)")
        return result
    }
    
    
    
    
}
