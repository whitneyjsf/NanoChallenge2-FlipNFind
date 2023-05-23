//
//  SoundManager.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 21/05/23.
//

import Foundation
import AVFoundation

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "button-click-sound", withExtension: ".mp3") else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("error playing sound \(error.localizedDescription)")
        }
    }
}

class BackgroundSoundManager {
    static let instance1 = BackgroundSoundManager()
    
    var player: AVAudioPlayer?
    
    func playBackgroundSound() {
        guard let url = Bundle.main.url(forResource: "background-sound", withExtension: ".mp3") else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("error playing sound \(error.localizedDescription)")
        }
    }
}
