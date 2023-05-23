//
//  BackgroundAnimationScene.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 23/05/23.
//

import SpriteKit

class BackgroundScene: SKScene{
    
    var spriteNode : SKSpriteNode!
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .systemMint
        let spriteSize = CGSize(width: 250, height: 250)
        spriteNode = SKSpriteNode(imageNamed: "Blob-1")
        
        
        spriteNode.size = spriteSize // Set the size of the sprite
        spriteNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        spriteNode.texture = SKTexture(imageNamed: "Image-1")
        addChild(spriteNode)
        
        let moveLeft = SKAction.moveBy(x: -100,y:0, duration: 2.0)
        let moveRight = SKAction.moveBy(x: 100,y:0, duration: 2.0)
        let moveSequence = SKAction.sequence([moveLeft, moveRight])
        let repeatAction = SKAction.repeatForever(moveSequence)
        spriteNode.run(repeatAction)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        let touchedNode = self.atPoint(location)
        
        if touchedNode == spriteNode{
            spriteNode.texture = SKTexture(imageNamed: "Image-1.3")
            print("clicked")
        }
    }
}
