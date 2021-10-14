//
//  ViewController.swift
//  TapMeFast
//
//  Created by Jisa Gigi on 10/13/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    var timer = Timer()
    var timeIn = 10
    var scoreIn = 0
    var gameIn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timeIn = 10
    }

    @IBAction func startGame(_ sender: Any) {
        if timeIn == 10{
            timer  = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startCounter), userInfo: nil, repeats: true)
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.5
        }
        if gameIn == 1{
            scoreIn += 1
            scoreLabel.text = String(scoreIn)
        }else{
            timeIn = 10
            scoreIn = 0
            timeLabel.text = String(timeIn)
            scoreLabel.text = String(scoreIn)
            startGameButton.setTitle("Start", for: .normal)

        }
    }
    @objc func startCounter(){
        timeIn -= 1
        timeLabel.text = String(timeIn)
        startGameButton.isEnabled = true
        startGameButton.alpha = 1
        startGameButton.setTitle("Tap", for: .normal)
        
        gameIn = 1
        
        if timeIn == 0 {
            
            timer.invalidate()
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.5
            startGameButton.setTitle("Restart", for: .normal)
            Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(restart), userInfo: nil, repeats: false)
            
        }
    }
    @objc func restart(){
        gameIn = 0

        startGameButton.isEnabled = true
        startGameButton.alpha = 1
        
    }
    
}

