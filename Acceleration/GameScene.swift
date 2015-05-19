//
//  GameScene.swift
//  Acceleration
//
//  Created by 下馬場光祐 on 2015/05/12.
//  Copyright (c) 2015年 Kosuke Shimobaba. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        configure()
    }
    
    //UI
    var back = SKSpriteNode()
    var mainCar = SKSpriteNode(imageNamed: "car1")
    var carA = SKSpriteNode(imageNamed: "carA")
    var carB = SKSpriteNode(imageNamed: "carB")
    var road = SKSpriteNode(imageNamed: "back")
    
    //parameter
    let myBoundSize: CGSize = UIScreen.mainScreen().bounds.size
    var acceleration = 0.0
    
    func configure(){
        //back
        
        
        //images
        road.size = myBoundSize
        road.position = CGPoint(x: CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        road.physicsBody = SKPhysicsBody()
        road.physicsBody?.friction = 0.7
        self.addChild(road)
        
        mainCar.position = CGPoint(x: CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        self.addChild(mainCar)
        
        //physics
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody?.friction = 0.9
        
        road.physicsBody?.applyForce(CGVector(dx: 0, dy: 1))
        
    }
   
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent) {
//        moveByAcceleration(0.5)
        road.physicsBody?.applyForce(CGVector(dx: 0, dy: 5))
        
    }
    
    
    func moveByAcceleration(acceleration:CGFloat){
        let action1 = SKAction.moveBy(CGVector(dx: 0, dy: 10), duration: 0.3)
        carA.runAction(action1)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
