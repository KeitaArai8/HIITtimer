//
//  TimeViewController.swift
//  HIITtimerApp1
//
//  Created by Keita Arai on 2020/05/24.
//  Copyright © 2020 Keita Arai. All rights reserved.
//

import UIKit
import Foundation
import UICircularProgressRing
import AVFoundation

class TimeViewController: UIViewController,AVAudioPlayerDelegate{
    
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var setCount: UILabel!
    
    var setCount2 = 1
    var countUp = 1
    var result = ""
    
    let timeRing = UICircularTimerRing()
    let timeRing2 = UICircularTimerRing()
    
    var timer1:Timer?
    var timer2:Timer?
    var soundTimer:Timer?
    var audioPlayer:AVAudioPlayer?
    var soundCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCount.text = String(1)
        
        timeRing.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        timeRing2.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        timeRing.center = CGPoint(x: 200, y: 210)
        timeRing2.center = CGPoint(x: 200, y: 210)
        
        timeRing.fontColor = .green
        timeRing2.fontColor = .red
        
        timeRing.font = UIFont.boldSystemFont(ofSize: 35)
        timeRing2.font = UIFont.boldSystemFont(ofSize: 35)
        
        timeRing.outerRingColor = .orange
        timeRing.innerRingColor = .green
        
        timeRing2.outerRingColor = .green
        timeRing2.innerRingColor = .orange
        
        self.view.addSubview(timeRing2)
        self.view.addSubview(timeRing)
        
        startButton.layer.cornerRadius = 45.0
        stopButton.layer.cornerRadius = 45.0
        setButton.layer.cornerRadius = 45.0
        resetButton.layer.cornerRadius = 45.0
        
    }
    //スタートボタンを押した時
    @IBAction func startButton(_ sender: Any) {
        
        timechange()
        self.playSound(name: "start", onSound: true)
        sound()
        
        self.timer2 = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(TimeViewController.timeStop), userInfo: nil, repeats: true)
        
        self.timer1 = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(TimeViewController.timechange), userInfo: nil, repeats: true)
        
    }
    
    @objc func sound(){
        
        self.soundTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (soundTimer) in
            
            self.soundCount += 1
            //print(self.soundCount)
            
            
            if self.soundCount == 8{
                self.playSound(name: "nokori", onSound: true)
            }
            
            if self.soundCount == 9{
                self.playSound(name: "10", onSound: true)
            }
            
            if self.soundCount == 10{
                self.playSound(name: "second", onSound: true)
            }
            
            if self.soundCount == 15{
                self.playSound(name: "mouhitoikidesu", onSound: true)
            }
            
            if self.soundCount == 17{
                self.playSound(name: "countdown", onSound: true)
            }
            
            if self.soundCount == 20{
                self.playSound(name: "syuuryou", onSound: true)
            }
            
            if self.soundCount == 25{
                self.playSound(name: "zyunbihaiidesuka", onSound: true)
            }
            
            if self.soundCount == 27{
                self.playSound(name: "countdown", onSound: true)
            }
            
            if self.soundCount == 30{
                self.soundCount = 0
                self.playSound(name: "start", onSound: true)
            }
            
            if self.soundCount == 0{
                self.soundCount += 1
            }
        })
        
    }
    
    @objc func timeStop(){
        
        countUp = countUp + 1
        
        if countUp > setCount2{
            
            countUp = 1
            timer1?.invalidate()
            timer2?.invalidate()
            soundTimer?.invalidate()
            self.playSound(name: "cheer", onSound: true)
            
        }
    }
    
    @objc func timechange(){
        
        self.timeRing2.isHidden = true
        self.timeRing.isHidden = false
        
        timeRing.startTimer(to: 20) { state in
            
            self.result = "state: \(state)"
            
            if self.result == "state: finished"{
                
                self.timeRing.isHidden = true
                self.timeRing2.isHidden = false
                
                self.timeRing2.startTimer(to: 10) { (state2) in
                    self.result = "state: \(state2)"
                    
                }
                
            }
            
        }
        
    }
    
    
    @IBAction func stopButton(_ sender: Any) {
        
        timeRing.resetTimer()
        timeRing2.resetTimer()
        timer1?.invalidate()
        timer2?.invalidate()
        soundTimer?.invalidate()
        soundCount = 0
        
    }
    
    
    @IBAction func setButton(_ sender: Any) {
        
        setCount2 += 1
        
        setCount.text = String(setCount2)
        
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        
        timeRing.resetTimer()
        timeRing2.resetTimer()
        setCount2 = 1
        setCount.text = String(1)
        
    }
    
    @objc func playSound(name: String, onSound: Bool) {
        guard let audiopath = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("音源ファイルが見つかりません")
            return
        }
        
        do {
            
            // インスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audiopath))
            // デリゲートをセット
            audioPlayer?.delegate = self
            
            if onSound{
                // 音声の再生
                audioPlayer?.play()
            } else {
                audioPlayer?.stop()
            }
        } catch {
            print("音声がありません")
        }
    }
    
    
    
}
