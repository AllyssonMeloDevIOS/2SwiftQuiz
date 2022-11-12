//
//  Quiz.swift
//  2SwiftQuiz
//
//  Created by Allysson Melo on 05/11/22.
//

import Foundation

class Quiz {
    
    let question: String // A pergunta em si
    let options: [String] // Múltipla escolha então vai ser um array.
    private let correctedAnswer: String // Armazenar a resposta correta para esta classe.
    
    init(question: String, options: [String], correctedAnswer: String) {
        self.question = question
        self.options = options
        self.correctedAnswer = correctedAnswer
    }
    
    func validateOption (_ index: Int) -> Bool { // Aqui criaremos uma função para que qual foi a opção que o usuário escolheu.
        let answer = options[index]
        return answer == correctedAnswer
        // Já pensando num encapsulamento, eu não quero que o usuário saiba qual a resposta correta, e só quando for validar. então vamos botar um private em let corrected.
    }
    
    deinit {
        print("Liberou Quiz da memória.")
    }
    
}
