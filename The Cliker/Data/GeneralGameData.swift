//
//  GameData.swift
//  The Cliker
//
//

//MARK: - My Heading

import Foundation
import Combine


///should only have func's for saving and storing data and initializing
class GeneralGameData: ObservableObject {
   
    @Published var roundLevel: Int = 3
    @Published var deltaClicks: Decimal = 0
    @Published var currentClicks: Decimal = 0
    @Published var allBuildingAttribites: [AllBuildingsBlueprint:BuildingAttributesBlueprint] = [:]
    @Published var allUpgrades: [AllUpgrades_Blueprint:Upgrade_Blueprint] = [:]
    
    
    @Published var clickRate: Decimal = 0
    
    @Published var ascensions: Int = 0
    
    @Published var canAccend: Bool = false
    
    
    
    //MARK: NON GAME DATA
    @Published var allSuffixes: [String] = [" M", " B", " T", " Quadrillion", " Quintillion", " Sextillion", " Septillion", " Octillion", " Nonillion", " Decillion", " Undecillion", " Duodecillion", " Tredecillion", " Quattuordecillion", " Quindecillion", " Sexdecillion", " Septendecillion", " Octodecillion", " Novemdecillion", " Vigintillion", " Unvigintillion", " Duovigintillion", " Tresvigintillion", " Quattuorvigintillion", " Quinvigintillion", " Sexvigintillion", " Septenvigintillion", " Octovigintillion", " Novemvigintillion", " Trigintillion", " Untrigintillion", " Duotrigintillion", "Googol * 100" ]

    
    @Published var gameCondition: gameConditionBlueprint = .startedGame
    @Published var worldBeingLoaded: String = ""
    
    @Published var importantInfo: importantHeadings = .nothing
    @Published var worldsSaved: [String] = []
    @Published var currentWorld: String = ""
    
    @Published var lastView: gameConditionBlueprint = .loadingData
    
    ///This should be used to avoid reloading hte world when you switch views
    @Published var loadingWorld = false
    @Published var autoSaving = false 
    
    //this is only updated by me
     
    
    //MARK: saving Data
    struct gameState_ForSavingData: Codable {
        
        
        
        var roundLevel: Int = 3
        var deltaClicks: Decimal = 0
        var currentClicks: Decimal = 0
        var allBuildingAttribites: [AllBuildingsBlueprint:BuildingAttributesBlueprint] = [:]
        var allUpgrades: [AllUpgrades_Blueprint:Upgrade_Blueprint] = [:]

        var allSuffixes: [String] = []
        var time = Date()
        var ascensions: Int? = 0
        
        
        
    }
    
    
    func canYouAccend() {
        
        if currentClicks > TranslateNum(1, suffix: " Vigintillion") {
            canAccend = true
        } else {
            canAccend = false
        }
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
    
    func resetData() {
        
        allBuildingAttribites = [:]
        allUpgrades = [:]
        currentClicks = 0
        deltaClicks = 0
        
        setStartingData()
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
        let tempAppData = AppData()
        
        allGameMechanics(gameState: self, loanSharkMechanics: loanShark, soundManager: SoundManager(appData: tempAppData)).updateEverything()
        
        var tempTime = timeElapsed
        while tempTime >= 1 {
            allGameMechanics(gameState: self, loanSharkMechanics: loanShark, soundManager: SoundManager(appData: tempAppData)).employ()
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
        
        if let tempWorldsSaved = UserDefaults.standard.object(forKey: "worldsSaved") as? [String] {
            worldsSaved = tempWorldsSaved
        } else {
            worldsSaved = []
        }
        print(worldsSaved)
    }
    
    func loadData(worldName: String) {
        
        if let data = UserDefaults.standard.data(forKey: "GameState \(worldName)") {
            
            do {
               
                let loadedState = try JSONDecoder().decode(gameState_ForSavingData.self, from: data)
                
                roundLevel = loadedState.roundLevel
                deltaClicks = loadedState.deltaClicks
                currentClicks = loadedState.currentClicks
                
                // creates the attribiute urself
                
                //
                var tempAllBuildingAttr: [AllBuildingsBlueprint:BuildingAttributesBlueprint] = [:]
                
                
                for buildingAttribute in loadedState.allBuildingAttribites {
                
                    
                    let building = buildingAttribute.value
                    var buildingToAdd: BuildingAttributesBlueprint
                    
                    
                    
                    //version handling
                    if buildingAttribute.value.version != nil {
                        
                        let buildingVersion = buildingAttribute.value.version
                        let buildingVersion_Major = buildingVersion?.Major
                        
                        
                        switch buildingVersion {
                            
                        case versionData_Type(Major: 1, Minor: 0, Patch: 0):
                            buildingToAdd = BuildingAttributesBlueprint(version: buildingLatestVersion, Building: buildingAttribute.key, amount: building.amount, costMultiplier: building.costMultiplier, Cost: building.Cost, Increase: building.Increase, IncreaseMultiplier: building.IncreaseMultiplier, rent: building.rent, buildingType: building.buildingType)
             
                        default:
                            fatalError("tried to load a faulty version: that is \(buildingVersion)")
                        }
  
                                                
                    } else { // it has no version
                        buildingToAdd = BuildingAttributesBlueprint(version: buildingLatestVersion, Building: buildingAttribute.key, amount: building.amount, costMultiplier: building.costMultiplier, Cost: building.Cost, Increase: building.Increase, IncreaseMultiplier: building.IncreaseMultiplier, rent: building.rent, buildingType: building.buildingType)
                    }
                
                    
                    //adding it
                    tempAllBuildingAttr[buildingAttribute.key] = buildingToAdd
                    
                }
                //after having the full thing
                
                allBuildingAttribites = tempAllBuildingAttr
                
                
                var tempAllUpgrades: [AllUpgrades_Blueprint:Upgrade_Blueprint] = [:]
                
                for upgradeAttribute in loadedState.allUpgrades {
                    
                    
                    var tempUpgradeAttribute = upgradeAttribute.value
                    var upgradeToAdd: Upgrade_Blueprint
                    var upgradeName = upgradeAttribute.key
                    let upgradeVersion = upgradeAttribute.value.version
                    
                    
                    
                    if upgradeVersion != nil {
                        
                        
                        switch upgradeVersion {
                            
                        case versionData_Type(Major: 1, Minor: 0, Patch: 0):
                            upgradeToAdd = Upgrade_Blueprint(version: latestUpgradeVersion, upgrade: upgradeName, level: tempUpgradeAttribute.level, costMultiplier: tempUpgradeAttribute.costMultiplier, Cost: tempUpgradeAttribute.Cost, clickMultiplier: tempUpgradeAttribute.clickMultiplier, buildingRecruiting: tempUpgradeAttribute.buildingRecruiting)
                            
                        default:
                            fatalError("An upgrade, with a version, that can't be handled, is trying to be loaded. It's version is: \(upgradeVersion), and the upgrade is \(upgradeAttribute)")
                        }
                        
                    } else {
                        upgradeToAdd = Upgrade_Blueprint(version: latestUpgradeVersion, upgrade: upgradeName, level: tempUpgradeAttribute.level, costMultiplier: tempUpgradeAttribute.costMultiplier, Cost: tempUpgradeAttribute.Cost, clickMultiplier: tempUpgradeAttribute.clickMultiplier, buildingRecruiting: tempUpgradeAttribute.buildingRecruiting)
                    }
                    
                    tempAllUpgrades[upgradeName] = upgradeToAdd
                    
                }
                
                allUpgrades = tempAllUpgrades
                
                
                
                allUpgrades = loadedState.allUpgrades
                allSuffixes = loadedState.allSuffixes
                
                //finding the time diff.
                let timeElapsed = Date().timeIntervalSince(loadedState.time)
                
                currentClicks += deltaClicks/10 * Decimal(timeElapsed)
                updateBuildingsandUpgrades(timeElapsed: timeElapsed)
                
                
            } catch {
                print("failed to load data:", error)
            }
            
        } else {
            //if it cant find the data it sets it up.
            importantInfo = .worldNotLoaded
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
        
        
        var version: versionData_Type?
        
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
        
        
        
        
        
        
        
        
        init(version: versionData_Type, Building: AllBuildingsBlueprint, amount: Int, costMultiplier: Decimal, Cost: Decimal, Increase: Decimal, IncreaseMultiplier: Decimal, rent: Decimal, buildingType: [allBuildingTypes]) {
            self.version = version
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
        
        var version: versionData_Type?
        
        
        var upgrade: AllUpgrades_Blueprint
        
        
        
        
        var level: Decimal = 0
        
        /// this is sopposed to be very large
        var costMultiplier: Decimal
        var Cost: Decimal
        
        var clickMultiplier: Decimal
        
        
        
        ///This is specifically for the recrutier upgrade.
        var buildingRecruiting: AllBuildingsBlueprint?
        
        
        init(version: versionData_Type, upgrade: AllUpgrades_Blueprint, level: Decimal, costMultiplier: Decimal, Cost: Decimal, clickMultiplier: Decimal, buildingRecruiting: AllBuildingsBlueprint? = nil) {
            
            self.version = version
            
            self.upgrade = upgrade
            
            self.level = level
            
            self.costMultiplier = costMultiplier
            self.Cost = Cost
            self.clickMultiplier = clickMultiplier
            
            self.buildingRecruiting = buildingRecruiting
            
            
            
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
