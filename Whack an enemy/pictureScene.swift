//Author1: Nicholas Dargi ndargi@bu.edu
//Author2: Alex Bleda ableda@bu.edu
//Author3: Sameer Qureshi sameerq@bu.edu
//  pictureScene.swift
//  Whack an enemy
//
//  Created by Alex Bleda on 24/04/16.
//  Copyright © 2016 Alex Bleda. All rights reserved.
//
import UIKit
import SpriteKit

class pictureScene: SKScene, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    var friendPic = SKSpriteNode(imageNamed: "messi2")
    var enemyPic = SKSpriteNode(imageNamed: "cristiano2")
    
    var friendIsHit = true
    
    
    override func didMoveToView(view: SKView) {
        
        if let imageDataAsDefaults:NSData = defaults.objectForKey("CameraRollPictureEnemy") as? NSData {
            let someImage: UIImage = UIImage(data: imageDataAsDefaults)!
            //check to see if there’s a placeholder namedCameraRollPlaceholder…
            let finalImage = maskRoundedImage(someImage, radius: 600.0)
            let tex: SKTexture = SKTexture(image:finalImage)
            enemyPic.texture = tex
            enemyPic.zRotation = CGFloat(3 * M_PI_2)
            enemyPic.xScale = 1
            enemyPic.yScale = 1
            
        }

        if let imageDataAsDefaults:NSData = defaults.objectForKey("CameraRollPicture") as? NSData {
            let someImage:UIImage = UIImage(data: imageDataAsDefaults)!
            //check to see if there’s a placeholder namedCameraRollPlaceholder…
            let finalImage = maskRoundedImage(someImage, radius: 600.0)
            let tex: SKTexture = SKTexture(image:finalImage)
            friendPic.texture = tex
            friendPic.zRotation = CGFloat(3 * M_PI_2)
            friendPic.xScale = 1
            friendPic.yScale = 1
            
        }

        let background = SKSpriteNode(imageNamed: "forest_main")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .Replace
        background.zPosition = -1
        addChild(background)
        
        friendPic.position = CGPoint(x: 300, y: 400)
        friendPic.name = "friend"
        
        enemyPic.position = CGPoint(x: 660, y: 400)
        enemyPic.name = "enemy"
        
        addChild(friendPic)
        addChild(enemyPic)
        
        let title = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        title.text = "Tap to Change"
        title.position = CGPoint(x: CGRectGetMidX(self.frame), y: 600)
        title.fontColor = UIColor.blackColor()
        title.fontSize = 50
        addChild(title)
        
        let friendLabel = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        friendLabel.text = "Friend"
        friendLabel.position = CGPoint(x: 300, y: 500)
        friendLabel.fontSize = 50
        friendLabel.fontColor = UIColor.blackColor()
        friendLabel.zPosition = 1
        friendLabel.name = "friendLabel"
        
        addChild(friendLabel)
        
        let enemyLabel = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        enemyLabel.text = "Enemy"
        enemyLabel.position = CGPoint(x: 660, y: 500)
        enemyLabel.fontSize = 50
        enemyLabel.fontColor = UIColor.blackColor()
        enemyLabel.zPosition = 1
        enemyLabel.name = "enemyLabel"
        addChild(enemyLabel)
        
        let mainMenu = SKSpriteNode(imageNamed: "houseW")
        mainMenu.zPosition = 1
        mainMenu.position = CGPoint(x: CGRectGetMidX(self.frame), y: 200)
        mainMenu.name = "mainMenu"
        addChild(mainMenu)
        
        let squirrel = SKSpriteNode(imageNamed: "squirrel")
        squirrel.position = CGPoint(x:100, y: 200)
        addChild(squirrel)
        
        let bear = SKSpriteNode(imageNamed: "bear")
        bear.position = CGPoint(x: 890, y: 200)
        addChild(bear)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        if let touch = touches.first {
            let location = touch.locationInNode(self)
            let nodes = nodesAtPoint(location)
            
            for node in nodes {
                if node.name == "friend" {
                    friendIsHit = true
                    getPhotoFromSource(UIImagePickerControllerSourceType.Camera)
                }
                else if node.name == "enemy" {
                    friendIsHit = false
                    getPhotoFromSource(UIImagePickerControllerSourceType.Camera)
                }
                else if node.name == "mainMenu" {
                    let nextScene = GameScene(size: self.size)
                    nextScene.scaleMode = scaleMode
                    let reveal = SKTransition.fadeWithDuration(1)
                    self.view?.presentScene(nextScene, transition: reveal)
                }
            }
        }
    }
    
    func getPhotoFromSource(source: UIImagePickerControllerSourceType ){
        if UIImagePickerController.isSourceTypeAvailable(source)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.modalPresentationStyle = .CurrentContext
            imagePicker.delegate = self
            imagePicker.sourceType = source
            imagePicker.allowsEditing = false
            if (source == .Camera){
                imagePicker.cameraDevice = .Front
            }
            let vc:UIViewController = self.view!.window!.rootViewController!
            vc.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }

    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        picker.delegate = nil
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if (picker.sourceType == UIImagePickerControllerSourceType.PhotoLibrary || picker.sourceType == UIImagePickerControllerSourceType.Camera ) {
            //do something with the image we picked
            if let cameraRollPicture = info[UIImagePickerControllerOriginalImage] as? UIImage {
                print("herhe")
                
                // Could store image here inside the if statements

                if(friendIsHit){
                    defaults.setObject( UIImagePNGRepresentation(cameraRollPicture), forKey:"CameraRollPicture")

                    revealfriendImage()
                    
                    
                    
                }
                else {
                    defaults.setObject( UIImagePNGRepresentation(cameraRollPicture), forKey:"CameraRollPictureEnemy")

                    revealenemyImage()
                }
            }
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
        picker.delegate = nil
    }
    
    func revealenemyImage() {
        if let imageDataAsDefaults:NSData = defaults.objectForKey("CameraRollPictureEnemy") as? NSData {
            let someImage: UIImage = UIImage(data: imageDataAsDefaults)!
            //check to see if there’s a placeholder namedCameraRollPlaceholder…
            let finalImage = maskRoundedImage(someImage, radius: 550.0)
            let tex: SKTexture = SKTexture(image:finalImage)
            enemyPic.texture = tex
            enemyPic.zRotation = CGFloat(3 * M_PI_2)
            enemyPic.xScale = 1
            enemyPic.yScale = 1
            
        }
    }
    func revealfriendImage() {
        if let imageDataAsDefaults:NSData = defaults.objectForKey("CameraRollPicture") as? NSData {
            let someImage:UIImage = UIImage(data: imageDataAsDefaults)!
            //check to see if there’s a placeholder namedCameraRollPlaceholder…
            let finalImage = maskRoundedImage(someImage, radius: 550.0)
            let tex: SKTexture = SKTexture(image:finalImage)
            friendPic.texture = tex
            friendPic.zRotation = CGFloat(3 * M_PI_2)
            friendPic.xScale = 1
            friendPic.yScale = 1
            
        }
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

