//
//  ViewController.swift
//  shuffle
//
//  Created by hidekazu uenishi on 2017/12/28.
//  Copyright © 2017年 hidekazu uenishi. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var chair1: UILabel!
    @IBOutlet weak var chair2: UILabel!
    @IBOutlet weak var chair3: UILabel!
    @IBOutlet weak var chair4: UILabel!
    
    
    
    //タッチ開始
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //タッチされたビュー
        let move = touches.first?.view
        if Double((move?.tag)!)>0 {
        move?.backgroundColor = UIColor.red
    }
    
    }
    
    
    //タッチ中
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //タッチされている座標
        let loc = touches.first?.location(in: view)
        if Double((touches.first?.view?.tag)!)>0 {
            touches.first?.view?.center = loc!
        }
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

