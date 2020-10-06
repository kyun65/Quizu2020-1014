//
//  ScoreViewController.swift
//  Quizu2020
//
//  Created by きゅん on 2020/10/05.
//

import UIKit

class ScoreViewController: UIViewController {
    
    
    var correct = 0

    @IBOutlet weak var correctLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        correctLabel.text = "\(correct)問正解!"
        
      
    }
    

 
    
    //選択画面へ戻る
    @IBAction func backTop(_ sender: Any) {
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    
}
