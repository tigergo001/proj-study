//
//  ViewController.swift
//  day1-iosstudy
//
//  Created by Ryan Yang on 2020/1/28.
//  Copyright © 2020 Ryan Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MASK: propeties
    
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var pauseBtn: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var counter: Float = 0.0 {
        // 属性观察器
        didSet {
            if(timeLabel != nil){
                timeLabel.text = String(format:"%.1f", counter)
            }
            
        }
    }
    
    
    var timer :Timer? = Timer();
    var isPlaying = false;
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent;
    }
    
    
    //MASK:actions
    @IBAction func playbtnDidTouch(_ sender: UIButton) {
        playBtn?.isEnabled = false;
        pauseBtn?.isEnabled = true;
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true);
        timeLabel.text = String(format:"%.1f", counter);
        isPlaying = true;
        
    }
    
   
    
    @IBAction func pauseBtnDidTouch(_ sender: UIButton) {
        pauseBtn?.isEnabled = false;
        playBtn?.isEnabled = true;
   
        if let timerStamp = timer{
            timerStamp.invalidate();
        }
        isPlaying = false;
    }
    
    @IBAction func resetBtnDitTouch(_ sender: UIButton) {
        if let timerStemp = timer{
            timerStemp.invalidate();
        }
        timer = nil;
        isPlaying = false;
        counter = 0.0;
        playBtn.isEnabled = true;
        pauseBtn.isEnabled = true;
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counter = 0.0;
    }

    @objc func updateTimer(){
        counter = counter + 0.1;
    }

}

