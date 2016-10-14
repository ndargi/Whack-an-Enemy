//Author1: Nicholas Dargi ndargi@bu.edu
//Author2: Alex Bleda ableda@bu.edu
//Author3: Sameer Qureshi sameerq@bu.edu
//  GameScene.swift
//  Whack an enemy
//
//  Created by Alex Bleda on 23/04/16.
//  Copyright (c) 2016 Alex Bleda. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        myLabel.text = "Whack an Enemy!"
        myLabel.fontColor = UIColor.whiteColor()
        myLabel.fontSize = 90
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y: 550)
        
        self.addChild(myLabel)
        
         let background = SKSpriteNode(imageNamed: "forest2")
         background.position = CGPoint(x: 512, y: 384)
         background.blendMode = .Replace
         background.zPosition = -1
         addChild(background)
        
        
        let playButton = SKLabelNode(fontNamed: "Baskerville-BoldItalic")
        playButton.text = "Classic Mode"
        playButton.fontColor = UIColor.blueColor()
        playButton.fontSize = 50
        playButton.name = "playButton"
        playButton.position = CGPoint(x: 300, y: 300)
        
        addChild(playButton)
        
        let chaosButton = SKLabelNode(fontNamed: "Baskerville-BoldItalic")
        chaosButton.text = "Chaos Mode"
        chaosButton.fontColor = UIColor.redColor()
        chaosButton.fontSize = 50
        chaosButton.name = "chaosButton"
        chaosButton.position = CGPoint(x: 690, y: 300)
        
        addChild(chaosButton)
        
        let pictureButton = SKLabelNode(fontNamed: "Baskerville-BoldItalic")
        pictureButton.text = "Choose your Enemy"
        pictureButton.fontColor = UIColor.blackColor()
        pictureButton.fontSize = 50
        pictureButton.name = "pictureButton"
        pictureButton.position = CGPoint(x: CGRectGetMidX(self.frame), y: 420)
        
        addChild(pictureButton)
        
        let scoreButton = SKLabelNode(fontNamed: "Baskerville-BoldItalic")
        scoreButton.text = "High Scores!"
        scoreButton.fontColor = UIColor.whiteColor()
        scoreButton.fontSize = 50
        scoreButton.name = "scoreButton"
        scoreButton.position = CGPoint(x: CGRectGetMidX(self.frame), y: 180)
        addChild(scoreButton)
        /*
        let hammer = SKSpriteNode(imageNamed: "Hammer")
        hammer.position = CGPoint(x: 120, y: 350)
        hammer.zPosition = 1
        addChild(hammer)
        */
        
        let sloth = SKSpriteNode(imageNamed: "sloth")
        sloth.position = CGPoint(x: 90, y: 600)
        sloth.zPosition = 1
        addChild(sloth)
        
        let owl = SKSpriteNode(imageNamed: "owl")
        owl.position = CGPoint(x: 940, y: 600)
        owl.zPosition = 1
        addChild(owl)

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let nodes = nodesAtPoint(location)
            
            for node in nodes {
                if node.name == "playButton" {
                    let nextScene = playScene(size: self.size)
                    nextScene.scaleMode = scaleMode
                    let reveal = SKTransition.fadeWithDuration(1)
                    self.view?.presentScene(nextScene, transition: reveal)
                }
                else if node.name == "chaosButton" {
                    let nextScene = chaosScene(size: self.size)
                    nextScene.scaleMode = scaleMode
                    let reveal = SKTransition.fadeWithDuration(1)
                    self.view?.presentScene(nextScene, transition: reveal)
                }
                else if node.name == "pictureButton" {
                    let nextScene = pictureScene(size: self.size)
                    nextScene.scaleMode = scaleMode
                    let reveal = SKTransition.fadeWithDuration(1)
                    self.view?.presentScene(nextScene, transition: reveal)
                }
                else if node.name == "scoreButton"{
                let nextScene = scoreScene(size: self.size)
                nextScene.scaleMode = scaleMode
                let reveal = SKTransition.fadeWithDuration(1)
                self.view?.presentScene(nextScene, transition: reveal)
                }
                
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }

}
