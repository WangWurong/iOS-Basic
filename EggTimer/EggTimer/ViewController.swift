//
//  ViewController.swift
//  EggTimer
//
//  Created by 大兔子殿下 on 12/28/18.
//  Copyright © 2018 大兔子殿下. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // create the timer
    var timer = Timer()
    
    var time = 210
    
    // the timer action function
    // every second, this function will be called
    @objc func decreaseTimer() {
        if time > 0 {
            time -= 1
            timerLabel.text = String(time)
        } else {
            timer.invalidate()
        }
    }
    
    // UI controllers:
    @IBOutlet var timerLabel: UILabel!
    
    @IBAction func startButtonPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
    }

    @IBAction func stopButtonPressed(_ sender: Any) {
        // stop the timer
        timer.invalidate()
    }

    @IBAction func plusTenButton(_ sender: Any) {
        time += 10
        timerLabel.text = String(time)
    }
    
    @IBAction func minusTenButton(_ sender: Any) {
        time -= 10
        timerLabel.text = String(time)
    }
    
    @IBAction func resetButton(_ sender: Any) {
        time = 210
        timerLabel.text = String(time)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

