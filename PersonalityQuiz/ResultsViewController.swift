//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Jayden Patterson on 2021/11/14.
//

import UIKit

class ResultsViewController: UIViewController {

   
    @IBOutlet var resultsAnswerLabel: UILabel!
    @IBOutlet var resultsDefinitionLabel: UILabel!
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]){
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResults()
        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResults(){
        
        let frequencyOfAnswers = responses.reduce(into: [:]){
            
            (counts, answer) in
            counts[answer.type, default: 0] += 1
            //This creates and empty dictionary in which the answers are passed into
        }
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) in
            return pair1.value > pair2.value
        })
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        resultsAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultsDefinitionLabel.text = mostCommonAnswer.definition
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
