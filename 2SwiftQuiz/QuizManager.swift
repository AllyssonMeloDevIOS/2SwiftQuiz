//
//  QuizManager.swift
//  2SwiftQuiz
//
//  Created by Allysson Melo on 05/11/22.
//

import Foundation

class QuizManager {
    
    private let quizes: [(question: String, correctAnswer: String, options: [String])] = [
            (question: "Quais desses é string?", correctAnswer: "\"Olá mundo\"",
             options: ["20", "\"Olá mundo\"", "Olá mundo", "'Olá mundo'"]),
            (question: "Qual é o resultado da expressão \"1\" + \"1\"", correctAnswer: "\"11\"",
             options: ["11", "\"2\"", "\"11\"", "\"1 1\""]),
            (question: "Qual desses símbolos é usado para \"escapar\" caracteres especiais", correctAnswer: "\\",
             options: ["/", "\\", "!", "ESC"]),
            (question: "Qual a sintaxe correta para declarar uma função?", correctAnswer: "func myFunction() {}",
             options: ["func = myFunction() {}", "let myFunction = func() {}", "let func = myFunction() {}", "func myFunction() {}"]),
            (question:
                """
                   func printSomething() {
                      print("Adoro funções")
                   }
                   printSomething()
                """, correctAnswer: "Adoro funções",
                     options: ["Nada", "printSomething()", "Adoro funções", "Erro"]),
            (question: "Quando não declaramos o tipo de retorno de uma função, qual é o retorno padrão?", correctAnswer: "Void",
             options: ["Void", "Int", "String", "nil"]),
            (question: "Qual é a sintaxe correta para declarar um parâmetro?", correctAnswer: "resposta correta",
             options: ["func myFunc(String message) {}", "func myFunc(let message = String) {}", "func myFunc(message String) {}", "func myFunc(message: String) {}"]),
            
            (question: "Qual é o tipo de uma variavél String que pode aceitar nil?", correctAnswer: "String?",
             options: ["String", "String?", "Int", "Void"]),
            (question: "Quando queremos declarar uma constante, qual palavra reservada devemos usar?", correctAnswer: "let",
             options: ["var", "const", "let", "CONST"]),
            (question: "O que é um dicionário?", correctAnswer: "É uma coleção não-ordenada com chave e valor",
             options: ["É uma coleção que não aceita objetos repetidos", "É uma coleção ordenada com chave e valor", "É uma coleção não-ordenada com chave e valor", "É uma coleção que permite valores de tipos diferentes"]),
            (question: "Qual o nome do tipo especial em Swift que é usado para declarar blocos ou funções anônimas?", correctAnswer: "Closure",
             options: ["Lambda", "Block", "Closure", "Protocol"]),
            (question: "O que é um enum?", correctAnswer: "Tipo definido pelo usuário para um grupo de valores relacionados",
             options: ["É um conjunto de Strings", "É um tipo especial de String", "É um operador unário do tipo prefix", "Tipo definido pelo usuário para um grupo de valores relacionados"]),
            (question: "O que uma extension não pode fazer?", correctAnswer: "Adicionar propriedades armazenadas",
             options: ["Adicionar novas funcionalidades", "Definir novos construtores", "Adicionar propriedades armazenadas", "Adicionar propriedades computadas"]),
            (question: "Quando herdamos de uma classe e queremos chamar o seu construtor, usamos...", correctAnswer: "super.init",
             options: ["main.init", "super.init", "self.init", "super"]),
            ]
    private var quiz: Quiz! // vamos botar privado por que eu não quero que ele tenha acesso as perguntas e respostas.
    private var _totalAnswers = 0
    private var _totalCorrectAnswers = 0
    
    
    // Visto acima, criamos variáveis privadas para que o usuário não possa ter acesso a elas. porém vamos criar simples variáveis computadas onde possa me retornar as perguntas.
    var question: String {
        return quiz.question
    }
    
    var options: [String] {
        return quiz.options
    }
    var totalAnwsers: Int {
        return _totalAnswers
    }
    var totalCorrectAnwsers: Int {
        return _totalCorrectAnswers
    }
    // Como é essa classe que vai me trazer as perguntas, então vamos precisar de uma função que possa ficar me trazendo novos quizes e ordem não repetida.
    
    //Variável que irá receber todos os quizes, é dela que iremos remover cada pergunta respondida
    
    private lazy var remainingQuizes = quizes
    var hasRemainingQuestions: Bool {
        !remainingQuizes.isEmpty
    }
    /*
    func refreshQuiz() { // Lembrando que essa func é um método que crria um quiz novo.
        let randomIndex = Int(arc4random_uniform(UInt32(quizes.count))) // Ao criar um Uint32(quizes.count) eu estou dizendo ao código para ele puxar o universo que é o total de elementos desse quizes.
        let  quizData = quizes[randomIndex] // Recupera os dados do Quiz. como o init abaixo:
        quiz = Quiz(question: quizData.question, options: quizData.options, correctedAnswer: quizData.correctAnswer)
    }
     */
    func refreshQuiz() {
        if hasRemainingQuestions {
            //Veja que abaixo estamos removendo um quiz aleatoriamente da nossa nova variável remainingQuizes
            //Aqui já estamos usando a nova técnica de recuperar números aleatórios (Int.random) onde devemos
            // passar o range de números de onde o número aleatório virá.
            let quizData = remainingQuizes.remove(at: Int.random(in: 0..<remainingQuizes.count))
            quiz = Quiz(question: quizData.question, options: quizData.options, correctedAnswer: quizData.correctAnswer)
        }
    }
    
    //Aqui no reset vamos realimentar remainingQuizes com todos os quizes e limpar os resultados anteriores
    func reset() {
        remainingQuizes = quizes
        _totalAnswers = 0
        _totalCorrectAnswers = 0
    }
     
    
    // Criar uma função para validar a resposta.
    func validateAnswer(index: Int) {
        _totalAnswers += 1
        if quiz.validateOption(index) {
            _totalCorrectAnswers += 1
        }
    }
    
}
