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
    var scorePl1 = SKLabelNode()
    var scorePl2 = SKLabelNode()
    
    override func didMove(to view: SKView) {
        
        score = [0,0]
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        player1 = self.childNode(withName: "player1") as! SKSpriteNode
        player2 = self.childNode(withName: "player2") as! SKSpriteNode
        
        scorePl1 = self.childNode(withName: "player1Score") as! SKLabelNode
        scorePl2 = self.childNode(withName: "player2Score") as! SKLabelNode
        
        
        player1.position.y = (-self.frame.height/2.0) + 50
        player2.position.y = (self.frame.height/2.0) - 50
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let loc = touch.location(in: self)
            
            if currentGameType == .player2 {
                if loc.y > 0 {
                    player2.run(SKAction.moveTo(x: loc.x, duration: 0.2))
                }
                if loc.y < 0 {
                    player1.run(SKAction.moveTo(x: loc.x, duration: 0.2))
                }
            }
            else{
                player1.run(SKAction.moveTo(x: loc.x, duration: 0.2))
            }
        }
        
    }
    
    var score = [Int]()
    
    func addScore(_ winType : Bool){
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        if(winType){
            score[0] = score[0]+1
            scorePl1.text = "\(score[0])"
            ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        }
        else{
            score[1] = score[1]+1
            scorePl2.text = "\(score[1])"
            ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let loc = touch.location(in: self)
            
            if currentGameType == .player2 {
                if loc.y > 0 {
                    player2.run(SKAction.moveTo(x: loc.x, duration: 0.2))
                }
                if loc.y < 0 {
                    player1.run(SKAction.moveTo(x: loc.x, duration: 0.2))
                }
            }
            else{
                player1.run(SKAction.moveTo(x: loc.x, duration: 0.2))
            }
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        switch currentGameType {
        case .easy:
            player2.run(SKAction.moveTo(x: self.ball.position.x, duration: 1.0))
            break
        case .medium:
            player2.run(SKAction.moveTo(x: self.ball.position.x, duration: 0.7))
            break
        case .hard:
            player2.run(SKAction.moveTo(x: self.ball.position.x, duration: 0.5))
            break
        case .player2:
            break
        default:
            break
        }
        
        
        if ball.position.y <= player1.position.y - 30 {
            addScore(false)
        }
        else if ball.position.y >= player2.position.y + 30 {
            addScore(true)
        }
    }
}
