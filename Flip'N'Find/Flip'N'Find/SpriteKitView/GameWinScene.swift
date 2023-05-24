//
//  GameWinScene.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 24/05/23.
//

import SpriteKit
import Foundation

class GameWinScene: SKScene {
    
    let gameWin = SKSpriteNode(imageNamed: "GameWin-Image")
    
    override func didMove(to view: SKView) {
        backgroundColor = .systemMint
        
        gameWin.position = CGPoint(x: size.width / 2, y: size.height / 2)
        gameWin.setScale(1.1)
        gameWin.zPosition = 5
        addChild(gameWin)
    }
}
