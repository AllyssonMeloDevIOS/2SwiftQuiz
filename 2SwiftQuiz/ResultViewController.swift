//
//  ResultViewController.swift
//  2SwiftQuiz
//
//  Created by Allysson Melo on 05/11/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lbAnwsers: UILabel!
    @IBOutlet weak var lbCorrects: UILabel!
    @IBOutlet weak var lbWrongs: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbAnwsers.text = "Perguntas respondidas: \(totalAnswers)"
        lbCorrects.text = "Perguntas corretas: \(totalCorrectAnswers)"
        lbWrongs.text = "Perguntas erradas: \(totalAnswers - totalCorrectAnswers)"
        
        let score = totalCorrectAnswers*100/totalAnswers
        lbScore.text = "\(score)%"
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true,completion: nil)
    }
    

}
