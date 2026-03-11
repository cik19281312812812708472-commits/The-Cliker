//
//  Click Mechanics.swift
//  The Cliker
//
//  Created by Desire on 2026-03-07.
//

import Foundation
import Combine
import SwiftUI


class allGameMechanics: ObservableObject {
    
    
    var loanSharkMechanics: LoanSharkMechanics
    
    var gameState: GeneralGameData
    
    init(gameState: GeneralGameData, loanSharkMechanics: LoanSharkMechanics) {
        self.gameState = gameState
        self.loanSharkMechanics = loanSharkMechanics
    }
    
    
    func updateEverything() {
        
        jobPayments()
        updateInceaseMultiplier()
        loanSharkMechanics.allLoanSharkMechanics()
        updateTotalClicks()
        print("\(gameState.allBuildingAttribites)")
    }
    
    func updateInceaseMultiplier() {
        
        //employees have a boost per employee
        gameState.allBuildingAttribites[.employees]?.IncreaseMultiplier = Decimal(gameState.allBuildingAttribites[.employees]?.amount ?? 0)  * 0.5 + 1
        
        gameState.allBuildingAttribites[.softwareDev]?.IncreaseMultiplier = Decimal(gameState.allBuildingAttribites[.softwareDev]?.amount ?? 0)  * 0.1 + 1
        
        //manageres increase employee multiplyer by +200%
        gameState.allBuildingAttribites[.employees]?.IncreaseMultiplier += Decimal(gameState.allBuildingAttribites[.Manager]?.amount ?? 0) * 2 * Decimal(gameState.allBuildingAttribites[.employees]?.amount ?? 0) * Decimal(gameState.allBuildingAttribites[.Manager]?.amount ?? 0)
        
        //and they increase software dev miltiplier
        gameState.allBuildingAttribites[.softwareDev]?.IncreaseMultiplier += Decimal(gameState.allBuildingAttribites[.Manager]?.amount ?? 0) * 2 * Decimal(gameState.allBuildingAttribites[.softwareDev]?.amount ?? 0) * Decimal(gameState.allBuildingAttribites[.Manager]?.amount ?? 0)
        
    }
    
    
    func jobPayments() {
        
        var totalPayments: Decimal = 0

        for (building, buildingAttributes) in gameState.allBuildingAttribites {

            totalPayments += (buildingAttributes.rent * Decimal(buildingAttributes.amount))
 
        }
        
        
        //increase the total clicks by the total click increase
        gameState.currentClicks -= totalPayments
        gameState.deltaClicks -= totalPayments
        
    }
    
    
    ///Per Second
    func updateTotalClicks() {
        
        var totalClickIncrease: Decimal = 0

        for (building, buildingAttributes) in gameState.allBuildingAttribites {

            totalClickIncrease += (buildingAttributes.Increase * Decimal(buildingAttributes.amount) * buildingAttributes.IncreaseMultiplier)
 
        }
        
        
        totalClickIncrease *= gameState.allUpgrades[.Efficiency]?.level ?? 0
        
        
        //increase the total clicks by the total click increase
        gameState.currentClicks += totalClickIncrease
        gameState.deltaClicks = totalClickIncrease
       
    }
    
    func setCost(whatBuilding: AllBuildingsBlueprint) {
        
        
        var amountOfBuildings: Int = Int(gameState.allBuildingAttribites[whatBuilding]?.amount ?? 1)
        
        if amountOfBuildings > 0 {
            
            var costMultiplier: Decimal = gameState.allBuildingAttribites[whatBuilding]?.costMultiplier ?? 1.1
            
            var oldCost: Decimal = gameState.allBuildingAttribites[whatBuilding]?.Cost ?? 15
            
            var costValue = (oldCost * costMultiplier)
            
           
            
            var newCost = Decimal()
            
            NSDecimalRound(&newCost, &costValue, Int(gameState.roundLevel), .plain)
            
            
            
            //setting hte new cost
            gameState.allBuildingAttribites[whatBuilding]?.Cost = newCost
        }
        
    }//setting the costs end
    
    ///This just finds the building. It's helper func does the actual setting it is called
    ///```swift
    ///
    ///print("")
    ///```
    func updateCosts(whatBuilding: AllBuildingsBlueprint) {
        
        
        ///defining the cost stuff
        ///
        ///
        
        
        //looking through the all the buildings
        for (building, buildingAttributes) in gameState.allBuildingAttribites {
                setCost(whatBuilding: building)
        }

        
    }// func update costs end
    
    
    //MARK: nonupdating funcs
    
    ///no nupdatin
    func findNumOfBuildings() -> Int {
        
        let numOfBuildings = gameState.allBuildingAttribites.count
        
        return numOfBuildings
    }
    
    // a view is needed to be returned
    
    func subtractClicks(whatBuilding: AllBuildingsBlueprint) {
        
        self.gameState.allBuildingAttribites[whatBuilding]?.amount += 1
        
        if let cost = self.gameState.allBuildingAttribites[whatBuilding]?.Cost {
            self.gameState.currentClicks -= cost
        }
        self.setCost(whatBuilding: whatBuilding)
    }
    
    ///non updating
    func createBuildingButton(whatBuilding: AllBuildingsBlueprint) -> some View {
        
        Button {
                self.subtractClicks(whatBuilding: whatBuilding)
            
            
            self.gameState.deltaClicks -= self.gameState.allBuildingAttribites[whatBuilding]?.Cost ?? 0
            
        } label: {
            
            let Cost = (self.gameState.allBuildingAttribites[whatBuilding]?.Cost ?? 0)
            
            switch whatBuilding {
                
            case .Clickers:
                
                HStack {
                    
                    Image("Cursor")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                     
                    if gameState.currentClicks - Cost < gameState.deltaClicks * -2 {
                        
                        Text("$\(Cost) Buy a Cliker. ")
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                        
                    } else if gameState.currentClicks - Cost < 0 {
                Text("$\(Cost) Buy a Cliker. ")
                            .padding()
                            .background(.yellow)
                            .cornerRadius(10)
                        
                    } else {
                Text("$\(Cost) Buy a Cliker. ")
                        .padding()
                                
                    }
            }
                
                
            case .Freelancers:
                
                HStack {
                    Image("Freelancer")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    if gameState.currentClicks - Cost < gameState.deltaClicks * -2 {
                        
                        Text("$\(Cost) Buy a Freelancer. ")
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                        
                    } else if gameState.currentClicks - Cost < 0 {
                Text("$\(Cost) Buy a Freelancer. ")
                            .padding()
                            .background(.yellow)
                            .cornerRadius(10)
                        
                    } else {
                Text("$\(Cost) Buy a Freelancer. ")
                        .padding()
                                
                    }
                }
            case .softwareDev:
                HStack {
                    Image("Software Developer")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    if gameState.currentClicks - Cost < gameState.deltaClicks * -2 {
                        
                        Text("$\(Cost) Buy a Software Developer.. ")
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                        
                    } else if gameState.currentClicks - Cost < 0 {
                Text("$\(Cost) Buy a Software Developer. ")
                            .padding()
                            .background(.yellow)
                            .cornerRadius(10)
                        
                    } else {
                Text("$\(Cost) Buy a Software Developer. ")
                        .padding()
                                
                    }
                }
            case .employees:
                HStack {
                    Image("Employee")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    if gameState.currentClicks - Cost < gameState.deltaClicks * -2 {
                        
                        Text("$\(Cost) Buy an Employee. ")
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                        
                    } else if gameState.currentClicks - Cost < 0 {
                Text("$\(Cost) Buy an Employee. ")
                            .padding()
                            .background(.yellow)
                            .cornerRadius(10)
                    } else {
                Text("$\(Cost) Buy an Employee. ")
                        .padding()
                                
                    }
                }
            case .OilRefinery:
                HStack {
                    Image("Oil Refinery")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    if gameState.currentClicks - Cost < gameState.deltaClicks * -2 {
                        
                        Text("$\(Cost) Buy an Oil Refinery.")
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                        
                    } else if gameState.currentClicks - Cost < 0 {
                Text("$\(Cost) Buy an Oil Refinery.")
                        .padding()
                        .background(.yellow)
                        .cornerRadius(10)
                        
                    } else {
                Text("$\(Cost) Buy an Oil Refinery.")
                        .padding()
                                
                    }
                }
            case .Manager:
                HStack {
                    Image("Freelancer")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    if gameState.currentClicks - Cost < gameState.deltaClicks * -2 {
                        
                        Text("$\(Cost) Buy a Manager. ")
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                        
                    } else if gameState.currentClicks - Cost < 0 {
                Text("$\(Cost) Buy a Manager.")
                        .padding()
                        .background(.yellow)
                        .cornerRadius(10)
                        
                    } else {
                Text("$\(Cost) Buy a Manager.")
                        .padding()
                                
                    }
                }
            }

        }//label end
        .padding()
        
        
    }
    
    func createUpgradeButton(whatBuilding: AllBuildingsBlueprint) -> some View {
        
        Button {
                self.subtractClicks(whatBuilding: whatBuilding)
            
            
            self.gameState.deltaClicks -= self.gameState.allBuildingAttribites[whatBuilding]?.Cost ?? 0
            
        } label: {
            
            let Cost = (self.gameState.allBuildingAttribites[whatBuilding]?.Cost ?? 0)
            
            switch whatBuilding {
                
            case .Clickers:
                
                HStack {
                    
                    Image("Cursor")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                     
                    if gameState.currentClicks - Cost < gameState.deltaClicks * -2 {
                        
                        Text("$\(Cost) Buy a Cliker. ")
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                        
                    } else if gameState.currentClicks - Cost < 0 {
                Text("$\(Cost) Buy a Cliker. ")
                            .padding()
                            .background(.yellow)
                            .cornerRadius(10)
                        
                    } else {
                Text("$\(Cost) Buy a Cliker. ")
                        .padding()
                                
                    }
            }
                
                
            case .Freelancers:
                
                HStack {
                    Image("Freelancer")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    if gameState.currentClicks - Cost < gameState.deltaClicks * -2 {
                        
                        Text("$\(Cost) Buy a Freelancer. ")
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                        
                    } else if gameState.currentClicks - Cost < 0 {
                Text("$\(Cost) Buy a Freelancer. ")
                            .padding()
                            .background(.yellow)
                            .cornerRadius(10)
                        
                    } else {
                Text("$\(Cost) Buy a Freelancer. ")
                        .padding()
                                
                    }
                }
            case .softwareDev:
                HStack {
                    Image("Software Developer")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    if gameState.currentClicks - Cost < gameState.deltaClicks * -2 {
                        
                        Text("$\(Cost) Buy a Software Developer.. ")
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                        
                    } else if gameState.currentClicks - Cost < 0 {
                Text("$\(Cost) Buy a Software Developer. ")
                            .padding()
                            .background(.yellow)
                            .cornerRadius(10)
                        
                    } else {
                Text("$\(Cost) Buy a Software Developer. ")
                        .padding()
                                
                    }
                }
            case .employees:
                HStack {
                    Image("Employee")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    if gameState.currentClicks - Cost < gameState.deltaClicks * -2 {
                        
                        Text("$\(Cost) Buy an Employee. ")
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                        
                    } else if gameState.currentClicks - Cost < 0 {
                Text("$\(Cost) Buy an Employee. ")
                            .padding()
                            .background(.yellow)
                            .cornerRadius(10)
                    } else {
                Text("$\(Cost) Buy an Employee. ")
                        .padding()
                                
                    }
                }
            case .OilRefinery:
                HStack {
                    Image("Oil Refinery")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    if gameState.currentClicks - Cost < gameState.deltaClicks * -2 {
                        
                        Text("$\(Cost) Buy an Oil Refinery.")
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                        
                    } else if gameState.currentClicks - Cost < 0 {
                Text("$\(Cost) Buy an Oil Refinery.")
                        .padding()
                        .background(.yellow)
                        .cornerRadius(10)
                        
                    } else {
                Text("$\(Cost) Buy an Oil Refinery.")
                        .padding()
                                
                    }
                }
            case .Manager:
                HStack {
                    Image("Freelancer")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    if gameState.currentClicks - Cost < gameState.deltaClicks * -2 {
                        
                        Text("$\(Cost) Buy a Manager. ")
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                        
                    } else if gameState.currentClicks - Cost < 0 {
                Text("$\(Cost) Buy a Manager.")
                        .padding()
                        .background(.yellow)
                        .cornerRadius(10)
                        
                    } else {
                Text("$\(Cost) Buy a Manager.")
                        .padding()
                                
                    }
                }
            }

        }//label end
        .padding()
        
        
    }
}
