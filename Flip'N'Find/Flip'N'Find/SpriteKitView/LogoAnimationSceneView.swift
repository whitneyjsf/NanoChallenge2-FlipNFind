//
//  LogoAnimationSceneView.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 18/05/23.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        let spriteSize = CGSize(width: 250, height: 250)
        let spriteNode = SKSpriteNode(imageNamed: "Image-1")
        
        spriteNode.size = spriteSize // Set the size of the sprite
        spriteNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(spriteNode)
        
        let textureNames = ["Image-1.1", "Image-1.2", "Image-1.3", "Image-1.4",
                            "Image-1.5", "Image-1.6", "Image-1.7", "Image-1.8"]   // array animation image
        let textures = textureNames.map { SKTexture(imageNamed: $0) }
        let animationAction = SKAction.animate(with: textures, timePerFrame: 0.9)
        let repeatAction = SKAction.repeatForever(animationAction)
        spriteNode.run(repeatAction)
    }
}
