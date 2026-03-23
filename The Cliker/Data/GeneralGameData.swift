//
//  GameData.swift
//  The Cliker
//
//

//MARK: - My Heading

import Foundation
import Combine

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
                IncreaseMultiplier: 100,
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
                rent: 30,
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
                rent: 6000,
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
                rent: 1500,
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
                rent: 1500,
                buildingType: [.building] //incre
            )
        case .factory:
            return .init(
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
                Building: self,
                amount: 0,
                costMultiplier: 1.2,
                Cost: GeneralGameData().TranslateNum(767.121, suffix: " Quadrillion"),
                Increase: GeneralGameData().TranslateNum(120, suffix: " T"),
                IncreaseMultiplier: 3.5,
                rent: 200,
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
        case .factory:
            return "Buy a Factory"
        case .mine:
            return "Buy a Mine"
        }
        
        
    }
    
}


enum allBuildingTypes: Codable {
    
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
    
    var stats: GeneralGameData.Upgrade_Blueprint {
        
        switch self {
        case .Efficiency:
            return .init(
                upgrade: self,
                level: 0,
                costMultiplier: 10,
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
        case .clicking:
            return .init(
                upgrade: self,
                level: 0,
                costMultiplier: 2.5,
                Cost: 1000_000,
                clickMultiplier: 5.0
            )
        case .employeers:
            return .init(
                upgrade: self,
                level: 0,
                costMultiplier: 1.1,
                Cost: GeneralGameData().TranslateNum(167, suffix: " T"),
                clickMultiplier: 12.0
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
        }
    }
    
}

//should only have func's for saving and storing data and initializing

// for the geo sim add a persona for each ideal

enum gameConditionBlueprint {
    
    case startedGame
    case playingGame
    case savingData
    case loadingData
    case creatingWorld
    case gameOver
    
}


class GeneralGameData: ObservableObject {
   
    @Published var roundLevel: Int = 3
    @Published var deltaClicks: Decimal = 0
    @Published var currentClicks: Decimal = 0
    @Published var allBuildingAttribites: [AllBuildingsBlueprint:BuildingAttributesBlueprint] = [:]
    @Published var allUpgrades: [AllUpgrades_Blueprint:Upgrade_Blueprint] = [:]

    
    @Published var allSuffixes: [String] = [" M", " B", " T", " Quadrillion", " Quintillion", " Sextillion", " Septillion", " Octillion", " Nonillion", " Decillion", " Undecillion", " Duodecillion", " Tredecillion", " Quattuordecillion", " Quindecillion", " Sexdecillion", " Septendecillion", " Octodecillion", " Novemdecillion", " Vigintillion", " Unvigintillion", " Duovigintillion", " Tresvigintillion", " Quattuorvigintillion", " Quinvigintillion", " Sexvigintillion", " Septenvigintillion", " Octovigintillion", " Novemvigintillion", " Trigintillion", " Untrigintillion", " Duotrigintillion", "Googol * 100" ]

    @Published var gameCondition: gameConditionBlueprint = .startedGame
    @Published var worldBeingLoaded: String = ""
    
    @Published var worldNotFound: Bool = false
    @Published var worldsSaved: [String] = []
    @Published var currentWorld: String = ""
    
    @Published var lastView: gameConditionBlueprint = .loadingData
    
    ///This should be used to avoid reloading hte world when you switch views
    @Published var loadingWorld = false
    @Published var autoSaving = false 
    
    
    //MARK: saving Data
    struct gameState_ForSavingData: Codable {
        
        var roundLevel: Int = 3
        var deltaClicks: Decimal = 0
        var currentClicks: Decimal = 0
        var allBuildingAttribites: [AllBuildingsBlueprint:BuildingAttributesBlueprint] = [:]
        var allUpgrades: [AllUpgrades_Blueprint:Upgrade_Blueprint] = [:]

        var allSuffixes: [String] = []
        var time = Date()
       
        
    }
    
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
    
    
    
    func updateBuildingsandUpgrades(timeElapsed: TimeInterval) {
        
        
        
        for buildingCase in AllBuildingsBlueprint.allCases {
            
            //adds the building
            
            if allBuildingAttribites[buildingCase] == nil {
                allBuildingAttribites[buildingCase] = buildingCase.stats
            }
            
        }
        
        // it creates a building attribute for each building by looking at the enum MARK: change to work for an array
        for upgradeCase in AllUpgrades_Blueprint.allCases {
            
            if allUpgrades[upgradeCase] == nil {
                allUpgrades[upgradeCase] = upgradeCase.stats
            }
        }
       
        let loanSharkState = LoanSharkData()
        let loanShark = LoanSharkMechanics(gameState: self, loanSharkState: loanSharkState)
        allGameMechanics(gameState: self, loanSharkMechanics: loanShark).updateEverything()
        
        var tempTime = timeElapsed
        while tempTime >= 1 {
            allGameMechanics(gameState: self, loanSharkMechanics: loanShark).employ()
            tempTime -= 1
        }
                
        
        
    }
   
    func saveData(worldName: String) {
       print("Saving Data")
        let tempGameState = gameState_ForSavingData(roundLevel: roundLevel, deltaClicks: deltaClicks, currentClicks: currentClicks, allBuildingAttribites: allBuildingAttribites, allUpgrades: allUpgrades, allSuffixes: allSuffixes, time: Date())
        
        do {
            let data = try JSONEncoder().encode(tempGameState)
            UserDefaults.standard.set(data, forKey: "GameState \(worldName)")
        } catch {
            print("Failed To Save", error)
        }
    
        if worldsSaved.contains(worldName) == false {
            worldsSaved.append(worldName)
        }
        
        UserDefaults.standard.set(worldsSaved, forKey: "worldsSaved")
    }
    
    func loadWorldsSaved() {
        worldsSaved = UserDefaults.standard.object(forKey: "worldsSaved") as! [String]
        print(worldsSaved)
    }
    
    func loadData(worldName: String) {
        
        if let data = UserDefaults.standard.data(forKey: "GameState \(worldName)") {
            
            do {
               
                let loadedState = try JSONDecoder().decode(gameState_ForSavingData.self, from: data)
                
                roundLevel = loadedState.roundLevel
                deltaClicks = loadedState.deltaClicks
                currentClicks = loadedState.currentClicks
                allBuildingAttribites = loadedState.allBuildingAttribites
                allUpgrades = loadedState.allUpgrades
                allSuffixes = loadedState.allSuffixes
                
                //finding the time diff.
                let timeElapsed = Date().timeIntervalSince(loadedState.time)
                
                currentClicks += deltaClicks * Decimal(timeElapsed)
                updateBuildingsandUpgrades(timeElapsed: timeElapsed)
                
                
            } catch {
                print("failed to load data:", error)
            }
            
        } else {
            //if it cant find the data it sets it up.
            worldNotFound = true 
            setStartingData()
        }
        
        if worldsSaved.contains(worldName) == false {
            worldsSaved.append(worldName)
        }
        UserDefaults.standard.set(worldsSaved, forKey: "worldsSaved")
        currentWorld = worldName
        
    }
    
    func deleteData(worldName: String) {
        
        UserDefaults.standard.removeObject(forKey: "GameState \(worldName)")
        
        
        worldsSaved.removeAll { $0 == worldName }

        UserDefaults.standard.set(worldsSaved, forKey: "worldsSaved")
    }
    
    struct BuildingAttributesBlueprint: Codable {
        
        var Building: AllBuildingsBlueprint
        var amount: Int
        
        var costMultiplier: Decimal
        var Cost: Decimal
        
        var Increase: Decimal
        var IncreaseMultiplier: Decimal
        ///for buildings this is the amount of employees needed
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
    
    struct Upgrade_Blueprint: Codable {
        
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
