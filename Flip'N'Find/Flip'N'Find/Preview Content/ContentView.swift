//
//  ContentView.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 18/05/23.
//

import SwiftUI
import SpriteKit
import AVFoundation

struct ContentView: View {
    
    let backgroundSoundManager = BackgroundSoundManager()
    
    var body: some View {
        OnboardingView()
            .onAppear {
                backgroundSoundManager.playBackgroundSound()
            }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
