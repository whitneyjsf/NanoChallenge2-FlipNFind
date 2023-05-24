//
//  GameScene.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 23/05/23.
//

import Foundation
import SpriteKit

class GameScene1: SKScene, SKPhysicsContactDelegate{
    
    let paddel = SKSpriteNode(imageNamed: "Paddle-1")
    let ball = SKSpriteNode(imageNamed: "Ball")
    
    enum bitmasks: UInt32 {
        case frame = 0b1 //1
        case paddel = 0b10 //2
        case brick = 0b100 //4
        case ball = 0b1000 //5

    }
    
    override func didMove(to view: SKView) {
        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        physicsWorld.gravity = .zero
        //        self.backgroundColor = .clear
        physicsWorld.contactDelegate = self
        
        //Background
        let background = SKSpriteNode(imageNamed: "2")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition = -1  // Set the zPosition to make it appear behind other nodes
        addChild(background)
        
        //Player and ball
        paddel.position = CGPoint(x: size.width / 2, y: 25)
        paddel.zPosition = 10
        paddel.physicsBody = SKPhysicsBody(rectangleOf: paddel.size)
        paddel.physicsBody?.friction = 0
        paddel.physicsBody?.allowsRotation = false
        paddel.physicsBody?.restitution = 1
        paddel.physicsBody?.isDynamic = false
        paddel.physicsBody?.categoryBitMask = bitmasks.paddel.rawValue
        paddel.physicsBody?.contactTestBitMask = bitmasks.ball.rawValue
        paddel.physicsBody?.collisionBitMask = bitmasks.ball.rawValue
        addChild(paddel)
        
        ball.position.x = paddel.position.x
        ball.position.y = paddel.position.y + ball.size.height
        ball.zPosition = 10
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.height / 2)
        ball.physicsBody?.friction = 0
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.angularDamping = 0
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.contactTestBitMask = bitmasks.paddel.rawValue | bitmasks.frame.rawValue | bitmasks.brick.rawValue | bitmasks.frame.rawValue
        ball.physicsBody?.categoryBitMask = bitmasks.paddel.rawValue | bitmasks.frame.rawValue | bitmasks.brick.rawValue | bitmasks.frame.rawValue
        addChild(ball)
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: -50))
        
        // Frame
        let frame = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        frame.friction = 0
        frame.categoryBitMask = bitmasks.frame.rawValue
        frame.contactTestBitMask = bitmasks.ball.rawValue
        frame.collisionBitMask = bitmasks.ball.rawValue
        self.physicsBody = frame
        
        makeBricks(reihe: 6, bitmask: 0b100, y: 500, name: "Element-1")
        makeBricks(reihe: 6, bitmask: 0b100, y: 550, name: "Element-2")
        makeBricks(reihe: 6, bitmask: 0b100, y: 600, name: "Element-3")
        physicsWorld.contactDelegate = self
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            paddel.position.x = location.x
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if paddel.position.x < 50 {
            paddel.position.x = 50
        }
        
        if paddel.position.x > self.size.width - paddel.size.width / 2 {
            paddel.position.x = self.size.width - paddel.size.width / 2
        }
    }
    
    func makeBricks(reihe: Int, bitmask: UInt32, y: Int, name: String) {
        for i in 1...reihe {
            let brick = SKSpriteNode(imageNamed: name)
            brick.position = CGPoint(x: 30 + i * Int(brick.size.width), y: y)
            brick.zPosition = 10
            brick.name = "Brick" + String(i)
            brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
            brick.physicsBody?.friction = 0
            brick.physicsBody?.allowsRotation = false
            brick.physicsBody?.restitution = 1
            brick.physicsBody?.isDynamic = false
            brick.physicsBody?.categoryBitMask = bitmasks.brick.rawValue
            brick.physicsBody?.contactTestBitMask = bitmasks.ball.rawValue
            brick.physicsBody?.collisionBitMask = bitmasks.ball.rawValue
            addChild(brick)
        }
    }
    
//    func didBegin(_ contact: SKPhysicsContact) {
//            let contactA: SKPhysicsBody
//            let contactB: SKPhysicsBody
//
//            if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
//                contactA = contact.bodyA
//                contactB = contact.bodyB
//            } else {
//                contactA = contact.bodyB
//                contactB = contact.bodyA
//            }
//
//            if contactA.categoryBitMask == bitmasks.ball.rawValue {
//                if contactB.categoryBitMask == bitmasks.brick.rawValue {
//                    contactB.node?.removeFromParent()
//                    print("Brick contact")
//                } else if contactB.categoryBitMask == bitmasks.frame.rawValue {
//                    contactA.node?.removeFromParent()
//                    print("Bottom frame contact")
//                }
//            }
//        }

//    func didBegin(_ contact: SKPhysicsContact) {
//        let contactA: SKPhysicsBody
//        let contactB: SKPhysicsBody
//
//        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
//            contactA = contact.bodyA
//            contactB = contact.bodyB
//        } else {
//            contactA = contact.bodyB
//            contactB = contact.bodyA
//        }
//
//        if contact.bodyA.categoryBitMask == bitmasks.brick.rawValue && contact.bodyB.categoryBitMask == bitmasks.ball.rawValue {
//            contact.bodyA.node?.removeFromParent()
//            print("A")
//        }
//
//        if contact.bodyA.categoryBitMask == bitmasks.frame.rawValue && contact.bodyB.categoryBitMask == bitmasks.ball.rawValue {
//            // Ball touches the bottom frame
//            contact.bodyB.node?.removeFromParent()
//            print("B")
//        }
//    }
}
