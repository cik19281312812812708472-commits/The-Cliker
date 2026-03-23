//
//  Loan Shark Data.swift
//  The Cliker
//
//  
//


import Foundation
import Combine

class LoanSharkData: ObservableObject {
    
    @Published var numOfLoanSharks: Int = 0
    @Published var typeOfLoanSharks: [AllBuildingsBlueprint] = []
    
    
}
