//
//  Over All Game Data.swift
//  The Cliker
//
//  Created by Desire on 2026-03-31.
//
import Foundation
import Combine

var latestVersion: versionData_Type = versionData_Type(Major: 1, Minor: 1, Patch: 0)

var buildingLatestVersion: versionData_Type = versionData_Type(Major: 1, Minor: 0, Patch: 0)

var latestUpgradeVersion: versionData_Type = versionData_Type(Major: 1, Minor: 0, Patch: 0)

class AppData: ObservableObject {
    
    
    
    @Published var appVolume: Float = 1.0
    
    
}


