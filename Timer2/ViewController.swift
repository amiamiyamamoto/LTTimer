//
//  ViewController.swift
//  Timer2
//
//  Created by s247 on 2018/03/01.
//  Copyright © 2018年 ami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //時間を表示させるラベル
    @IBOutlet weak var timeLabel: UILabel!
    
    //UIImageViewを紐付ける
    @IBOutlet weak var imageView: UIImageView!
    
    //猫の画像のインスタンスを格納する
    var firstCat:UIImage! = UIImage(named: "neko")
    var lastCat:UIImage! = UIImage(named: "lastimg")

    //タイマー
    var timer:Timer?
    //タイマーが動いているかどうかのフラグ
    var isTimerRunning:Bool = false
    //タイマーのlimit
    var limit:Int = 300

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ナビゲーションバー部分の処理
        let button:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.play, target: self, action: #selector(ViewController.tapPlayButton))
        navigationItem.rightBarButtonItem = button
        navigationItem.title = "LT Timer"
        
        //画像の表示
        displayImg(img: firstCat)
    }

    //再生ボタンを押したときの処理
    @objc func tapPlayButton() {
        if isTimerRunning == true {
            return
        }
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {_ in
            self.runningTimer()
        })
    }
    //タイマーを動かす処理
    func runningTimer() {
        limit = limit - 1
        //時間部分
        var min = limit / 60
        var sec = limit % 60
        //表記を更新
        timeLabel.text = "\(min):" + String(format: "%02d", sec)
        //画像を小さくする処理
        //            self.imageView.transform = CGAffineTransform(scaleX: CGFloat(self.limit / 300), y: CGFloat(self.limit / 300))
    }
    
    //pauseボタンが押されたときの処理
    @IBAction func tapPauseButton(_ sender: Any) {
        timer!.invalidate()
    }
    
    //☓ボタンが押されたときの処理
    @IBAction func tapStopButton(_ sender: Any) {
        timer!.invalidate()
        timeLabel.text = "5:00"
        limit = 300
        displayImg(img: firstCat)
    }
    
    //画像のサイズを取得して、適正な縮尺で表示させる
    func displayImg(img:UIImage){
        
        //画面サイズを取得する
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        
        //画像のサイズを取得する
        let imgWidth = img.size.width
        let imgHeight = img.size.height
        
        //画像が画面横幅7割になるよう縮尺を取得する
        let scare = (screenWidth / imgWidth) * 0.7
        
        //画像サイズを変更する
        let rect = CGRect(x: 0, y: 0, width:  imgWidth * scare, height: imgHeight * scare)
        imageView.frame = rect
        
        //画像位置を変更する
        imageView.center = CGPoint(x: screenWidth/2, y: screenHeight * 0.65)
        
        //画像を表示させる
        imageView.image = img
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

