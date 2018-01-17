//
//  ViewController.swift
//  shuffle
//
//  Created by hidekazu uenishi on 2017/12/28.
//  Copyright © 2017年 hidekazu uenishi. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    //座席ラベルの接続
    @IBOutlet weak var chair1: UILabel!
    @IBOutlet weak var chair2: UILabel!
    @IBOutlet weak var chair3: UILabel!
    @IBOutlet weak var chair4: UILabel!
    
        var chair = [Int:UILabel]()
    
    //メンバーラベルの接続
    @IBOutlet weak var yamada: UILabel!//山田//tagが1 *tagはINT型のプロパティ　現在座っている座席を表す
    @IBOutlet weak var tanaka: UILabel!//田中//tagが2
    @IBOutlet weak var yamamoto: UILabel!//山本//tagが3
    @IBOutlet weak var matsumoto: UILabel!//松本//tagが4
    
        var member = [Int:UILabel]()
    
        let studentsNumber:Int = 4//クラスの生徒数
    
    
    var moveNumber:Int = 0//タッチしているmemberLabelの元の場所のナンバー
    
    var targetNumber:Int = 0//タッチ終わりで入れ替わるmemberLabelの場所のナンバー
    
    

    
    
    //タッチ開始
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //タッチされたビュー
        let move = touches.first?.view
        if Double((move?.tag)!)>0 {
            
        moveNumber = (move?.tag)!
        move?.backgroundColor = UIColor.red
    }
    
    }
    
    
    
    
    //タッチ中
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //タッチされている座標
        let loc = touches.first?.location(in: view)//view?.centerではなぜか動かない
        if Double((touches.first?.view?.tag)!)>0 {
            touches.first?.view?.center = loc!
            
            
            
            
            let xrange1 = CGFloat(200)...CGFloat(300)
            let yrange1 = CGFloat(200)...CGFloat(300)
            let xrange2 = CGFloat(200)...CGFloat(300)
            let yrange2 = CGFloat(800)...CGFloat(900)
            let xrange3 = CGFloat(500)...CGFloat(600)
            let yrange3 = CGFloat(200)...CGFloat(300)
            let xrange4 = CGFloat(500)...CGFloat(600)
            let yrange4 = CGFloat(800)...CGFloat(900)
            
            
            //ドラッグしたmemberラベルが交換候補の近くにきたとき、交換候補を赤く光らせる
            switch (CGFloat((loc?.x)!), CGFloat((loc?.y)!)) {
                
            case (xrange1, yrange1):
                member[1]?.backgroundColor = UIColor.red
                
            case (xrange2, yrange2):
                member[2]?.backgroundColor = UIColor.red
                
            case (xrange3, yrange3):
                member[3]?.backgroundColor = UIColor.red
                
            case (xrange4, yrange4):
                member[4]?.backgroundColor = UIColor.red
            case (_, _):
                for n in 1...studentsNumber {
                    if n != touches.first?.view?.tag {
                member[n]?.backgroundColor = UIColor.yellow
                }

                
            }
            
            
        }
    }
    }
    
    
    
    
    
    //タッチ終了
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //タッチ終了時の座標
        let touchEnd = touches.first?.view?.center
        
        moveNumber = (touches.first?.view?.tag)!
        
        
        //このifの判定をつけないと背景をタッチしたら背景全てがyellowとなってしまう
        if Double((touches.first?.view?.tag)!)>0 {
        touches.first?.view?.backgroundColor = UIColor.yellow
        }
        print("離した座標",touchEnd)
        
        
        //座席を入れ替えるのに使う関数::::::::::引数xが移動先の座席番号::::::::::::::::::::::::::::::::::::::::::::
        
        func change(moveNumberTo x:Int) {
            //座席順に辞書を入れ替える
            let tmp = member[(touches.first?.view?.tag)!]
            member[(touches.first?.view?.tag)!] = member[x]
            member[x] = tmp
            
            //座った座席をmemberのtagに記録
            member[moveNumber]?.tag = moveNumber
            member[targetNumber]?.tag = targetNumber
            
            //座席に移動
            member[moveNumber]?.frame = (chair[moveNumber]?.frame)!
            member[targetNumber]?.frame = (chair[targetNumber]?.frame)!
            

            
            
            //ちゃんと動いているのかチェック
//            print("ケース",targetNumber)
//            print("ムーブ",moveNumber)
//            print("ターゲット",targetNumber)
//            print("辞書１",member[1]?.text,member[1]?.tag)
//            print("辞書２",member[2]?.text,member[2]?.tag)
//            print("辞書３",member[3]?.text,member[3]?.tag)
//            print("辞書４",member[4]?.text,member[4]?.tag)
            
        }
        
        //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        
        let xrange1 = CGFloat(200)...CGFloat(300)
        let yrange1 = CGFloat(200)...CGFloat(300)
        let xrange2 = CGFloat(200)...CGFloat(300)
        let yrange2 = CGFloat(800)...CGFloat(900)
        let xrange3 = CGFloat(500)...CGFloat(600)
        let yrange3 = CGFloat(200)...CGFloat(300)
        let xrange4 = CGFloat(500)...CGFloat(600)
        let yrange4 = CGFloat(800)...CGFloat(900)
        
        switch (CGFloat((touchEnd?.x)!), CGFloat((touchEnd?.y)!)) {
            
        case (xrange1, yrange1):
            targetNumber = 1
            change(moveNumberTo: targetNumber)//触っているmemberと引数の番号に座っているメンバーを入れ替える

        case (xrange2, yrange2):
            targetNumber = 2
            change(moveNumberTo: targetNumber)//触っているmemberと引数の番号に座っているメンバーを入れ替える
        
        case (xrange3, yrange3):
            targetNumber = 3
            change(moveNumberTo: targetNumber)//触っているmemberと引数の番号に座っているメンバーを入れ替える
            
        case (xrange4, yrange4):
            targetNumber = 4
            change(moveNumberTo: targetNumber)//触っているmemberと引数の番号に座っているメンバーを入れ替える
            
        case (_, _):
            targetNumber = moveNumber
            change(moveNumberTo: targetNumber)//触っているmemberと引数の番号に座っているメンバーを入れ替える
            
        }
        
        
        

        
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //座席の定義
        chair = [1:chair1, 2:chair2, 3:chair3, 4:chair4]
        chair[1]?.frame = CGRect(x:200, y:200, width:100, height:100)
        chair[2]?.frame = CGRect(x:200, y:800, width:100, height:100)
        chair[3]?.frame = CGRect(x:500, y:200, width:100, height:100)
        chair[4]?.frame = CGRect(x:500, y:800, width:100, height:100)
        
        chair[1]?.text = "座席1"
        chair[2]?.text = "座席2"
        chair[3]?.text = "座席3"
        chair[4]?.text = "座席4"
        

        


        
        member = [1:yamada, 2:tanaka, 3:yamamoto, 4:matsumoto]
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

