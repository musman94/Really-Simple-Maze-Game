//
//  GameScene.swift
//  Maze
//
//  Created by Muhammad Usman on 23/08/2016.
//  Copyright (c) 2016 Muhammad Usman. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene,SKPhysicsContactDelegate
{
    
    let manager = CMMotionManager()
    var player = SKSpriteNode()
    var end = SKSpriteNode()
    
    override func didMove(to view: SKView)
    {
        
        self.physicsWorld.contactDelegate = self
        player = self.childNode(withName: "player") as! SKSpriteNode
        end = self.childNode(withName: "endNode") as! SKSpriteNode
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: OperationQueue.main)
        {
            (data,error) in
            self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)!) * 10,dy: CGFloat((data?.acceleration.y)!) * 10)
        }
        
    }
    
    func didBegin(_ contact: SKPhysicsContact)
    {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        if bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2 || bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1
        {
            print("You won")
        }
        
    }
   
    override func update(_ currentTime: TimeInterval)
    {
        /* Called before each frame is rendered */
    }




}
