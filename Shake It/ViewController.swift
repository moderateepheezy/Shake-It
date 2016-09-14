//
//  ViewController.swift
//  Shake It
//
//  Created by SimpuMind on 9/14/16.
//  Copyright © 2016 SimpuMind. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    
    var sounds = ["sound1", "sound2", "sound3","sound4", "sound5", "sound6", "sound7"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event!.subtype == UIEventSubtype.MotionShake{
            
            let randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            
            let fileLocation = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "mp3")
            
            do{
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                player.play()
            }catch{
                
            }
        }
    }

}

