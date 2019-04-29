//
//  ViewController.swift
//  ShuffleDoubles
//
//  Created by 夏目 崇 on 2019/04/29.
//  Copyright © 2019 夏目 崇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LblAppliName: UILabel!
    @IBOutlet weak var LblString1: UILabel!
    @IBOutlet weak var Int1: UITextField!
    @IBOutlet weak var Int2: UITextField!
    @IBOutlet weak var Int3: UITextField!
    @IBOutlet weak var Int4: UITextField!
    
    @IBOutlet weak var DouiblesNum: UITextField!
    @IBAction func BtnShuffle(_ sender: UIButton) {
        
        let personNum = DouiblesNum.text!
        let personNumber:Int = Int(personNum)!
        // ４人組を作って重複がないかをチェックする
        makeDouble(Num: personNumber)
    }
    func makeDouble(Num:Int) {
        var intArray: [Int]
        intArray = []
        var intset: [Int]
        intset = []
        
        if Num < 4 {
            displayAlert()
        }else{
            intArray = []
            for i in 1...Num{
                intArray.append(i)
            }
            //
            for _ in 0..<4{
                let j = Int(arc4random_uniform(UInt32(intArray.count)))
                intset.append(intArray[j])
                intArray.remove(at: j)
            }
            if(intset.count != 0){
                Int1.text = String(intset[0])
                Int2.text = String(intset[1])
                Int3.text = String(intset[2])
                Int4.text = String(intset[3])
            }
        }
    }
    // ボタンを押下した時にアラートを表示するメソッド
    @IBAction func displayAlert() {
        let title = "アラートテスト"
        let message = "人数は4人以上を入力してください。"
        let okText = "ok"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okayButton = UIAlertAction(title: okText, style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okayButton)
        
        present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DouiblesNum.text = "0"
//        Int1.text = "0"
//        Int2.text = "0"
//        Int3.text = "0"
//        Int4.text = "0"
        
    }


}

