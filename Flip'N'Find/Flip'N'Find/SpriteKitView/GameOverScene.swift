//
//  GameOverScene.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 24/05/23.
//

import SpriteKit
import Foundation

class GameOverScene: SKScene {
    
    let gameOver = SKSpriteNode(imageNamed: "GameOver-Image")
    
    override func didMove(to view: SKView) {
        backgroundColor = .systemMint
        
        gameOver.position = CGPoint(x: size.width / 2, y: size.height / 2)
        gameOver.setScale(1.1)
        gameOver.zPosition = 5
        addChild(gameOver)
    }
}

