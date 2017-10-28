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
        
        score = [0,0]
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        player1 = self.childNode(withName: "player1") as! SKSpriteNode
        player2 = self.childNode(withName: "player2") as! SKSpriteNode
        
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 30, dy: 30))
        
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
    
    var score = [Int]()
    
    func addScore(_ winType : Bool){
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        if(winType){
            score[0] = score[0]+1
            ball.physicsBody?.applyImpulse(CGVector(dx: 30, dy: 30))
        }
        else{
            score[1] = score[1]+1
            ball.physicsBody?.applyImpulse(CGVector(dx: -30, dy: -30))
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
        if ball.position.y <= player1.position.y - 70 {
            addScore(false)
        }
        else if ball.position.y >= player2.position.y + 70 {
            addScore(true)
        }
    }
}
