//
//  MiniGameView.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 23/05/23.
//

import SwiftUI
import SpriteKit

struct MiniGameView: View {
    
    @Binding var isShowing1: Bool
    
    var scene: SKScene {
        let scene = GameScene1()
        scene.size = UIScreen.main.bounds.size
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}

struct MiniGameView_Previews: PreviewProvider {
    static var previews: some View {
        MiniGameView(isShowing1: .constant(true))
    }
}
