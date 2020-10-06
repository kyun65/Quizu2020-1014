//
//  QuizuViewController.swift
//  Quizu2020
//
//  Created by きゅん on 2020/10/06.
//

import UIKit

class QuizuViewController: UIViewController {

    
    
    @IBOutlet weak var quizuNumberLabel: UILabel!
    @IBOutlet weak var quizuTextView: UITextView!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    
    //問題文を配列に
    var csvArray: [String] = []
    

    //csvから取り出した問題を格納する
    //問題データの1問ずつデータをいれる箱
    var quizArray: [String] = []
    
    //現在の問題数を表示
    var quizCount = 0
    
    //問題数
    var quizTotal = 5
    
    //正解数
    var correctCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //選択した問題により表示を入れ替え
        QuestionGate()

    }
    
    
    
    
    //選択した問題により表示を入れ替える関数
    func QuestionGate() {
        //1番が選択されていた場合
        if UserDefaults.standard.object(forKey:"Question0") != nil{
            //配列にデータを入れる
            csvArray = loadCSV(fileName: "quiz")
            //キー値を削除
            UserDefaults.standard.removeObject(forKey: "Question0")
        }
        if UserDefaults.standard.object(forKey:"Question1") != nil{
            //配列にデータを入れる
            csvArray = loadCSV(fileName: "quiz2")
            //キー値を削除
            UserDefaults.standard.removeObject(forKey: "Question1")
        }
        
        if UserDefaults.standard.object(forKey:"Question2") != nil{
            //配列にデータを入れる
            csvArray = loadCSV(fileName: "quiz3")
            //キー値を削除
            UserDefaults.standard.removeObject(forKey: "Question2")
        }
        
        
        //問題を表示する
        QuestionOpen()
    }
    
    
    
    //問題を表示する関数
    func QuestionOpen() {

        quizArray = csvArray[quizCount].components(separatedBy: ",")
        
        quizuNumberLabel.text = "第\(quizCount + 1)問"
        quizuTextView.text = quizArray[0]
        answer1.setTitle(quizArray[2], for: .normal)
        answer2.setTitle(quizArray[3], for: .normal)
        answer3.setTitle(quizArray[4], for: .normal)
        answer4.setTitle(quizArray[5], for: .normal)
        
    }
    

    //次の問題へ
    func nextQuestion() {
        
        quizCount += 1
        
        quizArray.removeAll()
        
        //現在の問題番号が、問題数より少なかったら、問題をセット
        if quizCount < quizTotal {
            quizArray = csvArray[quizCount].components(separatedBy: ",")
            quizuNumberLabel.text = "第\(quizCount + 1)問"
            quizuTextView.text = quizArray[0]
            answer1.setTitle(quizArray[2], for: .normal)
            answer2.setTitle(quizArray[3], for: .normal)
            answer3.setTitle(quizArray[4], for: .normal)
            answer4.setTitle(quizArray[5], for: .normal)
        }else {
            
            //そうでなかったら画面を遷移する
            performSegue(withIdentifier: "score", sender: nil)
        }
        
            
        
    }
    

    @IBAction func btnAction(_ sender: UIButton) {
        //ボタンを押したときに呼ばれる
        //print(sender.tag)
        
        //問題の英語判定をする
        if sender.tag == Int(quizArray[1]) {
                print("正解")
            correctCount += 1
            } else {
                print("不正解")
            }
        
        
        print("スコア:\(correctCount)")
        //次の問題へ
        nextQuestion()
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let Svc = segue.destination as! ScoreViewController
        Svc.correct = correctCount
        
        
    }
    
    
    
    
    //csvを問題に格納
    func loadCSV(fileName: String) -> [String] {
    
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!

        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
        } catch {
            print("エラー")
        }
        return csvArray
    }
    
    

    
    
    
    
    
    
//         if UserDefaults.standard.object(forKey:"genre0") != nil{
    
//}

}
