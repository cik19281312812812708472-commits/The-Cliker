//
//  Sound Manager.swift
//  The Cliker
//
//  Created by Desire on 2026-03-24.
//

import Foundation
import Combine
import SwiftUI
import AVFoundation





///THINGS TO ADD:
///  versioning
/// selective recruter thing
///

class SoundManager: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
    var appData: AppData
    
    init(appData: AppData) {
        self.appData = appData
    }
    
    var audioManager: [AVAudioPlayer] = []
    
    
    func clickingSound() {
        
        if let url = Bundle.main.url(forResource: "ClickingSound", withExtension: "mp3") {
            
            if let soundPlayer = try? AVAudioPlayer(contentsOf: url) {
                
                soundPlayer.delegate = self
                audioManager.append(soundPlayer)
                soundPlayer.play()
                
            }
            
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
            
        print("Sound Finished")
        if let index = audioManager.firstIndex(of: player) {
            audioManager.remove(at: index)
        }
        
    }
    
    func updateVolume() {
        
        for player in audioManager {
            player.volume = appData.appVolume
        }
        
    }
    
    
    
    
}
