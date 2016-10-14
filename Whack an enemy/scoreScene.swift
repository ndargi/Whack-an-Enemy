//Author1: Nicholas Dargi ndargi@bu.edu
//Author2: Alex Bleda ableda@bu.edu
//Author3: Sameer Qureshi sameerq@bu.edu
//  scoreScene.swift
//  Whack an enemy
//
//  Created by Alex Bleda on 4/25/16.
//  Copyright © 2016 Alex Bleda. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class scoreScene: SKScene {
   
    var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    func highscoreCheck() {
        if NSUserDefaults.standardUserDefaults().objectForKey("scores") == nil {
            
            let scores:[Int] =  [0,0,0,0,0]
            NSUserDefaults.standardUserDefaults().setObject(scores, forKey: "scores")
        }
        
                var scores = NSUserDefaults.standardUserDefaults().objectForKey("scores") as! Array <Int>
                let newscore = NSUserDefaults.standardUserDefaults().integerForKey("score")
        
                if (newscore > scores[0]) {
                    scores[4] = scores[3]
                    scores[3] = scores[2]
                    scores[2] = scores[1]
                    scores[1] = scores[0]
                    scores[0] = newscore
                    
                }
                else if (newscore > scores[1]){
                    scores[4] = scores[3]
                    scores[3] = scores[2]
                    scores[2] = scores[1]
                    scores[1] = newscore
                }
                else if (newscore > scores[2]){
                    scores[4] = scores[3]
                    scores[3] = scores[2]
                    scores[2] = newscore
                }
                else if (newscore > scores[3]){
                    scores[4] = scores[3]
                    scores[3] = newscore
                }
                else if (newscore > scores[4]){
                    scores[4] = newscore
                }
                NSUserDefaults.standardUserDefaults().setInteger(0, forKey: "score")

        
        NSUserDefaults.standardUserDefaults().setObject(scores, forKey: "scores")
    }
    
    func chaosHighScoreCheck() {
        if NSUserDefaults.standardUserDefaults().objectForKey("scores2") == nil {
            
            let scores2:[Int] =  [0,0,0,0,0]
            NSUserDefaults.standardUserDefaults().setObject(scores2, forKey: "scores2")
        }
        
        var scores2 = NSUserDefaults.standardUserDefaults().objectForKey("scores2") as! Array <Int>
        let newscore2 = NSUserDefaults.standardUserDefaults().integerForKey("chaosScore")
        
        if (newscore2 > scores2[0]) {
            scores2[4] = scores2[3]
            scores2[3] = scores2[2]
            scores2[2] = scores2[1]
            scores2[1] = scores2[0]
            scores2[0] = newscore2
            
        }
        else if (newscore2 > scores2[1]){
            scores2[4] = scores2[3]
            scores2[3] = scores2[2]
            scores2[2] = scores2[1]
            scores2[1] = newscore2
        }
        else if (newscore2 > scores2[2]){
            scores2[4] = scores2[3]
            scores2[3] = scores2[2]
            scores2[2] = newscore2
        }
        else if (newscore2 > scores2[3]){
            scores2[4] = scores2[3]
            scores2[3] = newscore2
        }
        else if (newscore2 > scores2[4]){
            scores2[4] = newscore2
        }
        NSUserDefaults.standardUserDefaults().setInteger(0, forKey: "chaosScore")
        
        NSUserDefaults.standardUserDefaults().setObject(scores2, forKey: "scores2")
    }

    override func didMoveToView(view: SKView) {
        
        let myLabel = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        myLabel.text = "High Scores!"
        myLabel.fontColor = UIColor.blackColor()
        myLabel.fontSize = 55
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y: 610)
        self.addChild(myLabel)
        
        let background = SKSpriteNode(imageNamed: "forest4")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .Replace
        background.zPosition = -1
        addChild(background)
        
        highscoreCheck()
        
        if let scores = NSUserDefaults.standardUserDefaults().objectForKey("scores"){
            
            let scores = NSUserDefaults.standardUserDefaults().objectForKey("scores") as! Array <Int>
        
            let highscoreOne = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            highscoreOne.text = "1. \(scores[0])"
            highscoreOne.fontColor = UIColor.blackColor()
            highscoreOne.fontSize = 45
            highscoreOne.position = CGPoint(x:300,y: 440)
            addChild(highscoreOne)
        
            let highscoreTwo = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            highscoreTwo.text = "2. \(scores[1])"
            highscoreTwo.fontColor = UIColor.blackColor()
            highscoreTwo.fontSize = 45
            highscoreTwo.position = CGPoint(x:300,y: 390)
            addChild(highscoreTwo)
        
            let highscoreThree = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            highscoreThree.text = "3. \(scores[2])"
            highscoreThree.fontColor = UIColor.blackColor()
            highscoreThree.fontSize = 45
            highscoreThree.position = CGPoint(x:300,y: 340)
            addChild(highscoreThree)
        
            let highscoreFour = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            highscoreFour.text = "4. \(scores[3])"
            highscoreFour.fontColor = UIColor.blackColor()
            highscoreFour.fontSize = 45
            highscoreFour.position = CGPoint(x:300,y: 290)
            addChild(highscoreFour)
        
            let highscoreFive = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            highscoreFive.text = "5. \(scores[4])"
            highscoreFive.fontColor = UIColor.blackColor()
            highscoreFive.fontSize = 45
            highscoreFive.position = CGPoint(x:300,y: 240)
            addChild(highscoreFive)

        }
        
        chaosHighScoreCheck()  
        
        if let scores2 = NSUserDefaults.standardUserDefaults().objectForKey("scores2"){
            
            let scores2 = NSUserDefaults.standardUserDefaults().objectForKey("scores2") as! Array <Int>
            
            let highscoreOne = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            highscoreOne.text = "1. \(scores2[0])"
            highscoreOne.fontColor = UIColor.blackColor()
            highscoreOne.fontSize = 45
            highscoreOne.position = CGPoint(x:700,y: 440)
            addChild(highscoreOne)
            
            let highscoreTwo = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            highscoreTwo.text = "2. \(scores2[1])"
            highscoreTwo.fontColor = UIColor.blackColor()
            highscoreTwo.fontSize = 45
            highscoreTwo.position = CGPoint(x:700,y: 390)
            addChild(highscoreTwo)
            
            let highscoreThree = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            highscoreThree.text = "3. \(scores2[2])"
            highscoreThree.fontColor = UIColor.blackColor()
            highscoreThree.fontSize = 45
            highscoreThree.position = CGPoint(x:700,y: 340)
            addChild(highscoreThree)
            
            let highscoreFour = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            highscoreFour.text = "4. \(scores2[3])"
            highscoreFour.fontColor = UIColor.blackColor()
            highscoreFour.fontSize = 45
            highscoreFour.position = CGPoint(x:700,y: 290)
            addChild(highscoreFour)
            
            let highscoreFive = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            highscoreFive.text = "5. \(scores2[4])"
            highscoreFive.fontColor = UIColor.blackColor()
            highscoreFive.fontSize = 45
            highscoreFive.position = CGPoint(x:700,y: 240)
            addChild(highscoreFive)
            
        }
        
        let mainMenu = SKSpriteNode(imageNamed: "houseW")
        mainMenu.position = CGPoint(x: 512, y: 190)
        mainMenu.zPosition = 1
        mainMenu.name = "mainMenu"
        addChild(mainMenu)
        
        let classicLabel = SKLabelNode(fontNamed:  "MarkerFelt-Wide")
        classicLabel.text = "Classic Mode"
        classicLabel.fontColor = UIColor.blueColor()
        classicLabel.fontSize = 45
        classicLabel.position = CGPoint(x: 300, y: 520)
        addChild(classicLabel)
        
        let chaosLabel = SKLabelNode(fontNamed:  "MarkerFelt-Wide")
        chaosLabel.text = "Chaos Mode"
        chaosLabel.fontColor = UIColor.redColor()
        chaosLabel.fontSize = 45
        chaosLabel.position = CGPoint(x: 700, y: 520)
        addChild(chaosLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSUserDefaults.standardUserDefaults().setInteger(0, forKey: "score")
            /* Called when a touch begins */
        if let touch = touches.first {
            let location = touch.locationInNode(self)
            let nodes = nodesAtPoint(location)
            for node in nodes {
                if node.name == "mainMenu" {
                    let nextScene = GameScene(size: self.size)
                    nextScene.scaleMode = scaleMode
                    let reveal = SKTransition.fadeWithDuration(1)
                    self.view?.presentScene(nextScene, transition: reveal)
                }
            }
        }
    }
}
