//
//  Game Enums.swift
//  The Cliker
//
//  Created by Desire on 2026-03-31.
//

import Foundation
enum AllBuildingsBlueprint: CaseIterable, Codable {
    
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
    case factory
    case mine
    case epstein
    case airPlane
    case car
    case dc10
    case dc3
    case boeing737
    case boeing757
    
    //add stock market stufffefeffef
    
  
    
    
    var stats: GeneralGameData.BuildingAttributesBlueprint {
        
        switch self {
            
        case .clickers:
            
            return .init (
                version: buildingLatestVersion,
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
                version: buildingLatestVersion,
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
                version: buildingLatestVersion,
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
                version: buildingLatestVersion,
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
                version: buildingLatestVersion,
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
                version: buildingLatestVersion,
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
                version: buildingLatestVersion,
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
                version: buildingLatestVersion,
                Building: self,
                amount: 0,
                costMultiplier: 1.0,
                Cost: 10000,
                Increase: 30,
                IncreaseMultiplier: 100,
                rent: 15,
                buildingType: [.building]
            )
        case .nuclearSilo:
            return .init(
                version: buildingLatestVersion,
                Building: self,
                amount: 0,
                costMultiplier: 1.0,
                Cost: GeneralGameData().TranslateNum(100.121, suffix: " T"),
                Increase: GeneralGameData().TranslateNum(10, suffix: " B"),
                IncreaseMultiplier: 3.5,
                rent: 30,
                buildingType: [.building]//increases the less employees
            )
            
        case .steelMill:
            return .init(
                version: buildingLatestVersion,
                Building: self,
                amount: 0,
                costMultiplier: 1.0,
                Cost: GeneralGameData().TranslateNum(1.121, suffix: " B"),
                Increase: GeneralGameData().TranslateNum(10, suffix: " M"),
                IncreaseMultiplier: 3.5,
                rent: 6000,
                buildingType: [.building] //incre
            )
        case .uraniumMine:
            return .init(
                version: buildingLatestVersion,
                Building: self,
                amount: 0,
                costMultiplier: 1.0,
                Cost: GeneralGameData().TranslateNum(200.121, suffix: " B"),
                Increase: GeneralGameData().TranslateNum(100, suffix: " M"),
                IncreaseMultiplier: 3.5,
                rent: 1500,
                buildingType: [.building] //incre
            )
        case .uraniumMill:
            return .init(
                version: buildingLatestVersion,
                Building: self,
                amount: 0,
                costMultiplier: 1.0,
                Cost: GeneralGameData().TranslateNum(500.121, suffix: " B"),
                Increase: GeneralGameData().TranslateNum(200, suffix: " M"),
                IncreaseMultiplier: 3.5,
                rent: 1500,
                buildingType: [.building] //incre
            )
        case .factory:
            return .init(
                version: buildingLatestVersion,
                Building: self,
                amount: 0,
                costMultiplier: 1.2,
                Cost: GeneralGameData().TranslateNum(500.121, suffix: " Quadrillion"),
                Increase: GeneralGameData().TranslateNum(20, suffix: " T"),
                IncreaseMultiplier: 3.5,
                rent: 2500,
                buildingType: [.building] //incre
            )
        
        case .mine:
            return .init(
                version: buildingLatestVersion,
                Building: self,
                amount: 0,
                costMultiplier: 1.2,
                Cost: GeneralGameData().TranslateNum(767.121, suffix: " Quadrillion"),
                Increase: GeneralGameData().TranslateNum(120, suffix: " T"),
                IncreaseMultiplier: 3.5,
                rent: 200,
                buildingType: [.building] //incre
            )
        case .epstein:
            return .init(
                version: buildingLatestVersion,
                Building: self,
                amount: 0,
                costMultiplier: 1000000000000000,
                Cost: GeneralGameData().TranslateNum(767.121, suffix: " Duovigintillion"),
                Increase: GeneralGameData().TranslateNum(39132132, suffix: " Tresvigintillion"),
                IncreaseMultiplier: 1000,
                rent: 0,
                buildingType: [.employee] //incre
            )
        case .airPlane:
            return .init(
                version: buildingLatestVersion,
                Building: self,
                amount: 0,
                costMultiplier: 1.5,
                Cost: GeneralGameData().TranslateNum(767.121, suffix: " Nonillion"),
                Increase: GeneralGameData().TranslateNum(1, suffix: " Octillion"),
                IncreaseMultiplier: 1.2,
                rent: 0,
                buildingType: [.building]
            )
        case .car:
            return .init(
                version: buildingLatestVersion,
                Building: self,
                amount: 0,
                costMultiplier: 1.5,
                Cost: GeneralGameData().TranslateNum(64, suffix: " T"),
                Increase: 1000000000000,
                IncreaseMultiplier: 10,
                rent: 0,
                buildingType: [.building]
            )
        
        case .dc10:
            return .init(
                version: buildingLatestVersion,
                Building: self,
                amount: 0,
                costMultiplier: 1.5,
                Cost: GeneralGameData().TranslateNum(43, suffix: " Quindecillion"),
                Increase: GeneralGameData().TranslateNum(6.4171044, suffix: " Quindecillion"),
                IncreaseMultiplier: 10,
                rent: 3,
                buildingType: [.building]
            )
        case .dc3:
            return .init(
                version: buildingLatestVersion,
                Building: self,
                amount: 0,
                costMultiplier: 1.5,
                Cost: GeneralGameData().TranslateNum(43, suffix: " Duodecillion"),
                Increase: GeneralGameData().TranslateNum(0.54171044, suffix: " Duodecillion"),
                IncreaseMultiplier: 10,
                rent: 4,
                buildingType: [.building]
            )
        case .boeing737:
            return .init(
                version: buildingLatestVersion,
                Building: self,
                amount: 0,
                costMultiplier: 1.5,
                Cost: GeneralGameData().TranslateNum(43, suffix: " Tredecillion"),
                Increase: GeneralGameData().TranslateNum(0.67171044, suffix: " Tredecillion"),
                IncreaseMultiplier: 10,
                rent: 3,
                buildingType: [.building]
            )
        case .boeing757:
            return .init(
                version: buildingLatestVersion,
                Building: self,
                amount: 0,
                costMultiplier: 1.5,
                Cost: GeneralGameData().TranslateNum(43, suffix: " Sexdecillion"),
                Increase: GeneralGameData().TranslateNum(1.67171044, suffix: " Sexdecillion"),
                IncreaseMultiplier: 10,
                rent: 3,
                buildingType: [.building]
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
        case .factory:
            return "Buy a Factory"
        case .mine:
            return "Buy a Mine"
        case .epstein:
            return "Hire Epstein"
        case .airPlane:
            return "Buy an AirPlane"
        case .car:
            return "Buy a Car"
        case .dc10:
            return "Buy a DC-10 Aircraft"
        case .dc3:
            return "Buy a DC-3 Aircraft"
        case .boeing737:
            return "Buy a Boeing 737 Aircraft"
        case .boeing757:
            return "Buy a Boeing 757 Aircraft"
        }
        
        
    }
    
    
    
    
    var name: String {
        switch self {
        case .clickers:
            return "Clicker"
        case .freelancers:
            return "Freelancer"
        case .softwareDev:
            return "Softwar Developer"
        case .employees:
            return "Employee"
        case .oilRefinery:
            return "Oil Refinery"
        case .manager:
            return "Manager"
        case .minimumWageWorker:
            return "Minimum Wage Worker"
        case .office:
            return "Office"
        case .nuclearSilo:
            return "Nuclear Silo"
        case .steelMill:
            return "Steel Mill"
        case .uraniumMine:
            return "Uranium Mine"
        case .uraniumMill:
            return "Uranium Mill"
        case .factory:
            return "Factory"
        case .mine:
            return "Mine"
        case .epstein:
            return "Epstien"
        case .airPlane:
            return "Airplane"
        case .car:
            return "Car"
        case .dc10:
            return "DC-10"
        case .dc3:
            return "DC-3"
        case .boeing737:
            return "Boeing 737-100"
        case .boeing757:
            return "Boeing 757"
        }
    }
    
    
}


enum allBuildingTypes: Codable, CaseIterable {
    
    case employee
    case building
    case manager
    case gainers
    
}

enum AllUpgrades_Blueprint: CaseIterable, Codable {
    
    case Efficiency
    case rounding
    case clicking
    case employeers
    case investors
    
    
    var stats: GeneralGameData.Upgrade_Blueprint {
        
        switch self {
        case .Efficiency:
            return .init(
                version: latestUpgradeVersion,
                upgrade: self,
                level: 0,
                costMultiplier: 10,
                Cost: 10001,
                clickMultiplier: 0.0
            )
            
        case .rounding:
            return .init (
                version: latestUpgradeVersion,
                upgrade: self,
                level: 0,
                costMultiplier: 2.5,
                Cost: 100000,
                clickMultiplier: 1.5
            )
        case .clicking:
            return .init(
                version: latestUpgradeVersion,
                upgrade: self,
                level: 0,
                costMultiplier: 2.5,
                Cost: 1000_000,
                clickMultiplier: 5.0
            )
        case .employeers:
            return .init(
                version: latestUpgradeVersion,
                upgrade: self,
                level: 0,
                costMultiplier: 1.1,
                Cost: GeneralGameData().TranslateNum(167, suffix: " T"),
                clickMultiplier: 12.0,
                buildingRecruiting: .employees
            )
        case .investors:
            return .init(
                version: latestUpgradeVersion,
                upgrade: self,
                level: 0,
                costMultiplier: 1.5,
                Cost: GeneralGameData().TranslateNum(127.12373912, suffix: " Vigintillion"),
                clickMultiplier: 20,
                buildingRecruiting: .manager
            )
        }
        
    }
    
    var displayName: String {
        
        switch self {
        case .Efficiency:
            return "Upgrade Efficiency."
        case .rounding:
            return "Rounding"
        case .clicking:
            return "Clicking"
        case .employeers:
            return "Recruiter"
        case .investors:
            return "Investor"
        }
    }
    
}


// for the geo sim add a persona for each ideal

enum gameConditionBlueprint {
    
    case startedGame
    case playingGame
    case savingData
    case loadingData
    case deletingData
    case creatingWorld
    case gameOver
    case guide
    
}

enum importantHeadings {
    
    case nothing
    case worldNotLoaded
    case worldDeleted
    case worldCreated
    
    
}
