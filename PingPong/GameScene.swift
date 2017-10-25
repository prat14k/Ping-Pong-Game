//
//  GameScene.swift
//  PingPong
//
//  Created by Prateek on 22/10/17.
//  Copyright © 2017 14K. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var player1 = SKSpriteNode()
    var player2 = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        player1 = self.childNode(withName: "player1") as! SKSpriteNode
        player2 = self.childNode(withName: "player2") as! SKSpriteNode
        
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let loc = touch.location(in: self)
            player1.run(SKAction.moveTo(x: loc.x, duration: 0.2))
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let loc = touch.location(in: self)
            player1.run(SKAction.moveTo(x: loc.x, duration: 0.2))
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        player2.run(SKAction.moveTo(x: self.ball.position.x, duration: 0.8))
        
    }
}
