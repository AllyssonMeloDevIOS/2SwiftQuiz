//
//  QuizViewController.swift
//  2SwiftQuiz
//
//  Created by Allysson Melo on 05/11/22.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    
    var quizManager: QuizManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) { // Toda vez que a tela vai aparecer esse método é chamado
        super.viewWillAppear(animated)
        quizManager = QuizManager()
        
        viTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations:  {
            self.viTimer.frame.size.width = 0
        }) { (sucess) in
            self.showResults()
        }
        // Incrementando a função para reniciar o quiz sempre que a tela for exebida.
        quizManager.reset()
        getNewQuiz()
        
    }
    
    /*
    func getNewQuiz() {
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = btAnswers[i]
            button.setTitle(option, for: .normal)
        }
    }
    */
    // Faremos uma nova Func GetNewquiz onde pediremos um novo quiz caso ainda possuam perguntas restantes
    
    func getNewQuiz() {
        if quizManager.hasRemainingQuestions {
            quizManager.refreshQuiz()
            lbQuestion.text = quizManager.question
            for i in 0..<quizManager.options.count {
                let option = quizManager.options[i]
                let button = btAnswers[i]
                button.setTitle(option, for: .normal)
            }
        } else {
            //A linha abaio faz com que a animação do timer encerre, executando assim o código show(results)
            viTimer.layer.removeAllAnimations()
        }
    }
    
    
    
    
    /*
    func noRepeatQuestions () {
        quizManager.noRepeatQuestions()
        showResults()
    }
    */
    func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnswers = quizManager.totalAnwsers
        resultViewController.totalCorrectAnswers = quizManager.totalCorrectAnwsers
    }
    
    @IBAction func selectAnwser(_ sender: UIButton) {
        let index = btAnswers.index(of: sender)!
        quizManager.validateAnswer(index: index)
        getNewQuiz()
        
    }
    

}
