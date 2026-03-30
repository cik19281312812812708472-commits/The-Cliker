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
    
    var audioManager: [AVAudioPlayer] = []
    
    
    func clickingSound() {
        
        if let url = Bundle.main.url(forResource: "ClickingSound", withExtension: "mp3") {
            
            if let soundPlayer = try? AVAudioPlayer(contentsOf: url) {
                
                soundPlayer.delegate = self
                audioManager.append(soundPlayer)
                soundPlayer.play()
                
                
                
                
                //HOW MUCH DOES EACH GIVeE?
                
                
                
                
                
                
            }
            
            
        }
        
        
    }
    
    
    
    
    
    
    
}
