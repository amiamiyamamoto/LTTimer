//
//  ViewController.swift
//  Timer2
//
//  Created by s247 on 2018/03/01.
//  Copyright © 2018年 ami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @objc func tapPlayButton() {
        print("osareta")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let button:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.play, target: self, action: #selector(ViewController.tapPlayButton))
        navigationItem.rightBarButtonItem = button
        navigationItem.title = "LT Timer"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

