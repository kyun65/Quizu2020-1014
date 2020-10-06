//
//  EntryNameViewController.swift
//  Quizu2020
//
//  Created by きゅん on 2020/10/05.
//

import UIKit

class EntryNameViewController: UIViewController,UITextFieldDelegate {

    
    
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NameField.delegate = self

    }
    
    
    //テキストフィールド外をタップしたら
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        //入力の確認
        checkField()
        NameField.resignFirstResponder()
    }

    //リターンキーが押されたとき
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        //入力の確認
        checkField()
        
        //テキストフィールドを閉じる
        NameField.resignFirstResponder()
     
        return true
        
    }
    
    

    //テキストフィールドが空の場合、遷移させない
    func checkField() {
        if NameField.text == "" {
            print("入力されていないよ")
            
            NextButton.isEnabled = false
            NextButton.backgroundColor = UIColor(red:0.44, green:0.44, blue:0.44, alpha:1.0)
            
            //アラート
            let alert: UIAlertController = UIAlertController(title: "名前が入力されていません", message: "名前を入力してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            NextButton.isEnabled = true
            NextButton.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            NameLabel.text = NameField.text
        }
    }
    

    
    
    //名前を入力した値を引き継いで遷移する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "next") {
            let nextVC = segue.destination as! SelectGenreViewController
            
            nextVC.UserNameString = NameField.text!
        }
    }
    
    


    //進むボタンを押したら
    @IBAction func Next(_ sender: Any) {
        
        let NameData = NameField.text!
  
        UserDefaults.standard.set(NameData, forKey: "NameKey")
        
        performSegue(withIdentifier: "next", sender: nil)
       
    }
    
}
