//
//  ViewController.swift
//  Quizu2020
//
//  Created by きゅん on 2020/10/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
        
    }


    //ボタンを押したら
    @IBAction func goGame(_ sender: Any) {
        
        
        //UserDefaultがあった場合、ジャンル選択画面へ遷移する
        if UserDefaults.standard.object(forKey: "NameKey") != nil {
            
            let selectModeView = self.storyboard?.instantiateViewController(identifier: "selectMode") as! SelectGenreViewController
            
            selectModeView.modalPresentationStyle = .fullScreen
            
            self.present(selectModeView, animated: true, completion: nil)
            
          
       
        
        } else {
            //UserDefaultがない場合は名前入力画面へ遷移する
            print("ユーザーデフォルトがありません")
            
            let NameModeView = self.storyboard?.instantiateViewController(identifier: "NameEntry") as! EntryNameViewController
            
            NameModeView.modalPresentationStyle = .fullScreen
            
            self.present(NameModeView, animated: true, completion: nil)
       
          
        }
        
    }
}

