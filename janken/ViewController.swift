//
//  ViewController.swift
//  janken
//
//  Created by Tomoki on 2016/06/16.
//  Copyright © 2016年 Tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var jankenLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var guButton: UIButton!
    @IBOutlet weak var tyokiButton: UIButton!
    @IBOutlet weak var paButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var aiHands: UInt32?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.reset()
        
        // スタートボタン
        startButton.addTarget(self, action: "pushStartButton", forControlEvents: .TouchUpInside)
        startButton.setTitle("スタート", forState: .Normal)
        // ぐーボタン
        guButton.addTarget(self, action: "pushGuButton", forControlEvents: .TouchUpInside)
        guButton.setTitle("ぐー", forState: .Normal)
        
        // チョキボタン
        tyokiButton.addTarget(self, action: "pushTyokiButton", forControlEvents: .TouchUpInside)
        tyokiButton.setTitle("チョキ", forState: .Normal)
        
        // パーボタン
        paButton.addTarget(self, action: "pushPaButton", forControlEvents: .TouchUpInside)
        paButton.setTitle("パー", forState: .Normal)
        
        // リセット
        resetButton.addTarget(self, action: "pushRestartButton", forControlEvents: .TouchUpInside)
        resetButton.setTitle("リセット", forState: .Normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // スタートボタンタップ
    func pushStartButton() {
        print("スタート")
        startLabel.text = "ぽん！"
        aiHands = arc4random() % 3
        
        startButton.hidden = true
        
        guButton.hidden = false
        tyokiButton.hidden = false
        paButton.hidden = false
    }
    
    // ぐーボタンタップ 0
    func pushGuButton() {
        print("ぐー")
        if aiHands == 0 {
            startLabel.text = "ぐー"
            jankenLabel.text = "あいこ"
        } else if aiHands == 1 {
            startLabel.text = "ちょき"
            jankenLabel.text = "かち"
        } else {
            startLabel.text = "ぱー"
            jankenLabel.text = "まけ"
        }
        jankenLabel.hidden = false
        resetButton.hidden = false
        
        guButton.hidden = true
        tyokiButton.hidden = true
        paButton.hidden = true
    }
    
    // チョキボタン 1
    func pushTyokiButton() {
        print("チョキ")
        if aiHands == 0 {
            startLabel.text = "ぐー"
            jankenLabel.text = "まけ"
        } else if aiHands == 1 {
            startLabel.text = "ちょき"
            jankenLabel.text = "あいこ"
        } else {
            startLabel.text = "ぱー"
            jankenLabel.text = "かち"
        }
        jankenLabel.hidden = false
        resetButton.hidden = false
        
        guButton.hidden = true
        tyokiButton.hidden = true
        paButton.hidden = true
    }
    
    // パーボタン 2
    func pushPaButton() {
        print("パー")
        if aiHands == 0 {
            startLabel.text = "ぐー"
            jankenLabel.text = "かち"
        } else if aiHands == 1 {
            startLabel.text = "ちょき"
            jankenLabel.text = "まけ"
        } else {
            startLabel.text = "ぱー"
            jankenLabel.text = "あいこ"
        }
        jankenLabel.hidden = false
        resetButton.hidden = false
        
        guButton.hidden = true
        tyokiButton.hidden = true
        paButton.hidden = true
    }

    // restertボタン
    func pushRestartButton() {
        print("リセット")
        self.reset()
    }
    
    func reset() {
        startLabel.text = "じゃんけん"
        jankenLabel.hidden = true
        
        startButton.hidden = false
        
        guButton.hidden = true
        tyokiButton.hidden = true
        paButton.hidden = true
        resetButton.hidden = true
    }
}

