//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Updated by Ilya Shapovalov on 09/04/2022
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.layer.opacity = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.layer.opacity = 1
        }
        playSound(from: sender)
    }
    
    func playSound(from button: UIButton) {
        guard let url = Bundle.main.url(forResource: button.currentTitle, withExtension: "wav") else { return }
        
        do {
        player = try AVAudioPlayer(contentsOf: url)
            guard let safePlayer = player else { return }
            safePlayer.play()
        }
        catch {
            print("Something went wrong!")
            return
        }
        
    }

}

