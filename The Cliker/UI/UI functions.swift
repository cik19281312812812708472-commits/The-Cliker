//
//  UI functions.swift
//  The Cliker
//
//  
//

import Combine
import Foundation
import SwiftUI

class UI_Functions: ObservableObject {
    
    var gameState: GeneralGameData
    
    init(gameState: GeneralGameData) {
        self.gameState = gameState
    }
    
    func stateNumber(whatNumber: Decimal) -> String {
        
        let places: Int = 3
        var newNumber: Decimal = whatNumber
        var originalNumber: Decimal = whatNumber
        let suffixes: [String] = gameState.allSuffixes
        
        var suffix: String = ""
        
        //turn this into an expandible loop now
        
        var topRange: Decimal = 999_999_999 //convert to string and then add the 999 then convert back
        var buttomRange: Decimal = 1000000
        
        for i in 0..<suffixes.count {
            
            
            
            if originalNumber > 999_999 {
               // print("original Number = \(originalNumber), buttomRange = \(buttomRange), top range = \(topRange)")
                if  originalNumber > buttomRange && originalNumber < topRange {
                    
                    originalNumber /= buttomRange
                    
                    NSDecimalRound(&newNumber, &originalNumber, places, .plain)
                    
                    suffix = suffixes[i]
                }
            }
            
           // print("suffix: '\(suffix)', i = \(i), suffixes[1] = \(suffixes[i])")
            //increasing suffix length
         
            topRange = topRange * 1000 + 999
            buttomRange *= 1000
            
            
        }
        
        
        let result = String(describing: newNumber) + suffix
       // print("result: \(result)")
        return result
    }
    
    
    
}
