//Author1: Nicholas Dargi ndargi@bu.edu
//Author2: Alex Bleda ableda@bu.edu
//Author3: Sameer Qureshi sameerq@bu.edu
//  WhackSlot.swift
//  Whack an enemy
//
//  Created by Alex Bleda on 23/04/16.
//  Copyright © 2016 Alex Bleda. All rights reserved.
//

import SpriteKit
import UIKit


class WhackSlot: SKNode {
    
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    var charNode: SKSpriteNode!
    
    var visible = false
    var isHit = false
    
    func configureAtPosition(pos: CGPoint) {
        position = pos
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
        
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: 0, y: 20)
        cropNode.zPosition = 1
        cropNode.maskNode = SKSpriteNode(imageNamed: "whackMask")
        
        // Here is where will need to change the images to whack and to not whack
        charNode = SKSpriteNode(imageNamed: "messi2")
        charNode.position = CGPoint(x: 0, y: -90)
        charNode.name = "character"
        cropNode.addChild(charNode)
        
        addChild(cropNode)
    }
    
    func show(hideTime hideTime: Double) {
        if visible { return }
        
        charNode.xScale = 1
        charNode.yScale = 1
        
        charNode.runAction(SKAction.moveByX(0, y: 90, duration: 0.05))
        visible = true
        isHit = false
        
        if RandomInt(min:0, max: 2) == 0 {
            if let imageDataAsDefaults:NSData = defaults.objectForKey("CameraRollPicture") as? NSData {
                let someImage: UIImage = UIImage(data: imageDataAsDefaults)!
                //check to see if there’s a placeholder namedCameraRollPlaceholder…
                let finalImage = maskRoundedImage(someImage, radius: 600.0)
                let tex: SKTexture = SKTexture(image:finalImage)
                charNode.texture = tex
                charNode.zRotation = CGFloat(3 * M_PI_2)
                charNode.name = "charFriend"
            }
            else {
                charNode.texture = SKTexture(imageNamed: "messi2")
                charNode.name = "charFriend"
            }
            
        }
        
        else {
            if let imageDataAsDefaults:NSData = defaults.objectForKey("CameraRollPictureEnemy") as? NSData {
                let someImage:UIImage = UIImage(data: imageDataAsDefaults)!
                //check to see if there’s a placeholder namedCameraRollPlaceholder…
                let finalImage = maskRoundedImage(someImage, radius: 600.0)
                let tex2: SKTexture = SKTexture(image:finalImage)
                charNode.texture = tex2  // evil picture
                charNode.zRotation = CGFloat(3 * M_PI_2)
                charNode.name = "charEnemy"
            }
            else {
                charNode.texture = SKTexture(imageNamed: "cristiano2")
                charNode.name = "charEnemy"
            }
        }
        
        RunAfterDelay(hideTime * 3.0) { [unowned self] in  // time it stays up before hiding again
            self.hide()
        }
    }
    
    func hide() {
        if !visible { return }

        charNode.runAction(SKAction.moveByX(0, y: -95, duration: 0.05))
        visible = false
    }
    
    func hit() {
        isHit = true
        
        let explosion = SKEmitterNode(fileNamed: "explosion")
        explosion!.position = charNode.position
        addChild(explosion!)
        
        let delay = SKAction.waitForDuration(0.25)
        let hide = SKAction.moveByX(0, y: -90, duration: 0.5)
        let notVisible = SKAction.runBlock { [unowned self] in self.visible = false }
        charNode.runAction(SKAction.sequence([delay, hide, notVisible]))
        
    }
    
    func maskRoundedImage(image: UIImage, radius: Float) -> UIImage {
        var imageView: UIImageView = UIImageView(image: image)
        var layer: CALayer = CALayer()
        layer = imageView.layer
        
        layer.masksToBounds = true
        layer.cornerRadius = CGFloat(radius)
        
        UIGraphicsBeginImageContext(imageView.bounds.size)
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        var roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return roundedImage
    }


}
