//
//  GameOverScene.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 24/05/23.
//

import SpriteKit
import Foundation
import SwiftUI

class GameOverScene: SKScene {
    
    let gameOver = SKSpriteNode(imageNamed: "GameOver-Image")
    let buttonBack = SKSpriteNode(imageNamed: "BackButton")
    let buttonRestart = SKSpriteNode(imageNamed: "RestartButton")

//    var gameOverHeight: CGFloat = 0.0

    override func didMove(to view: SKView) {
        backgroundColor = .systemMint
        
//        gameOverHeight = gameOver.frame.size.height

        //image for game over text
        gameOver.position = CGPoint(x: size.width / 2, y: size.height / 2)
        gameOver.setScale(1.0)
        gameOver.zPosition = 5
        addChild(gameOver)
        
//        //button back
//        buttonBack.position = CGPoint(x: size.width / 2 - 100, y: size.height / 2 - gameOverHeight - 50)
//        buttonBack.setScale(1.0)
//        buttonBack.zPosition = 5
//        addChild(buttonBack)
//
//        //button restart
//        buttonRestart.position = CGPoint(x: size.width / 2 + 100, y: size.height / 2 - gameOverHeight - 50)
//        buttonRestart.setScale(1.5)
//        buttonRestart.zPosition = 5
//        addChild(buttonRestart)
    }
}

