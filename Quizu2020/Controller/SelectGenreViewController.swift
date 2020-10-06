//
//  SelectGenreViewController.swift
//  Quizu2020
//
//  Created by きゅん on 2020/10/05.
//

import UIKit

class SelectGenreViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var UseNameLabel: UILabel!
    
    
    //クイズのジャンルを配列に格納
    var GenreArray = ["ノンジャンル","スポーツ","政治"]
    var UserNameString = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        //ユーザーデフォルトがあった場合、値を入れる
        if UserDefaults.standard.object(forKey: "NameKey") != nil {
            
            UserNameString = UserDefaults.standard.object(forKey: "NameKey") as! String
       
            UseNameLabel.text = UserNameString
        } else {
            
            UseNameLabel.text = UserNameString
            
        }
        
        //もしユーザーデフォルトで値があったらラベルに値を入れる
        
    }
    

    
    
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GenreArray.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0{
            let genre0 = 0
            UserDefaults.standard.set(genre0, forKey: "Question0")
                    
            print(self.GenreArray[indexPath.row])
            
            performSegue(withIdentifier: "quizNext", sender: nil)
            
        } else if indexPath.row == 1 {
            let genre1 = 1
            UserDefaults.standard.set(genre1, forKey: "Question1")
            
            print(self.GenreArray[indexPath.row])
            performSegue(withIdentifier: "quizNext", sender: nil)
            
        } else if indexPath.row == 2 {
            
            let genre1 = 2
            UserDefaults.standard.set(genre1, forKey: "Question2")
            
            print(self.GenreArray[indexPath.row])
            performSegue(withIdentifier: "quizNext", sender: nil)
            
        }
       
    }
    
    
    //セルの情報
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //問題を配列からテーブルセルに表示
        cell.textLabel!.text = GenreArray[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.layer.frame.height/13
    }
    
    
    
    


}
