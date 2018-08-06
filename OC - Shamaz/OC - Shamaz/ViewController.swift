//
//  ViewController.swift
//  OC - Shamaz
//
//  Created by Leonardo Rubiano on 05.08.18.
//  Copyright © 2018 leofofeo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        storyPrompt.text = "";
        nextPlayer.text = "";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    enum PromptTense {
        case future
        case past
    }

    //Past tense options
    let pastTensePrompts = ["Describe a time when you felt happy",
                            "Tell us about a time when you felt scared",
                            "Tell us about an occasion when you felt embarrassed",
                            ]
    
    //Future tense options
    let futureTensePrompts = ["Where would you like to live in",
                              "What would you like to be doing for a living in",
                              "How often would you like to see your friends in"
                              ]
    
    let timeIntervalNumbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    let timeIntervalUnits = ["day", "week", "month", "year"]
    
    @IBOutlet weak var storyPrompt: UILabel!
    
    @IBOutlet weak var nextPlayer: UILabel!
    
    @IBAction func promptPastAction(_ sender: UIButton) {
        storyPrompt.text = generatePrompt(tense: PromptTense.past)
    }
    
    @IBAction func promptFutureAction(_ sender: UIButton) {
        storyPrompt.text = generatePrompt(tense: PromptTense.future)
    }
    
    @IBAction func selectNextPlayer(_ sender: UIButton) {
        //return random number from range of 1-10
        nextPlayer.text = String(arc4random_uniform(10) + 1)
        storyPrompt.text = ""
    }
    
    func generatePrompt(tense: PromptTense)-> String {
        if tense == PromptTense.future {
            return generateFutureAction()
        } else {
            return generatePastAction()
        }
    }
    
    func generatePastAction() -> String {
        var prompt: String = ""
        
        //generate Past tense prompt
        let initialQuestionIndex = Int(arc4random_uniform(UInt32(pastTensePrompts.count)))
        let initialQuestion = pastTensePrompts[initialQuestionIndex]
        
        let timeIntervalString = createCorrectTimeIntervalString()
        
        prompt = "\(initialQuestion) \(timeIntervalString) ago."
        
        return prompt
    }
    
    func generateFutureAction() -> String {
        var prompt: String = ""
        
        //generate Future tense prompt
        let initialQuestionIndex = Int(arc4random_uniform(UInt32(futureTensePrompts.count)))
        let initialQuestion = futureTensePrompts[initialQuestionIndex]
        
        let timeIntervalString = createCorrectTimeIntervalString()
        
        prompt = "\(initialQuestion) \(timeIntervalString) ?"
        
        return prompt
    }
    
    func createCorrectTimeIntervalString() -> String {
        let timeIntervalString: String
        
        let timeIntervalNumbersIndex = Int(arc4random_uniform(UInt32(timeIntervalNumbers.count)))
        let timeIntervalNumber = timeIntervalNumbers[timeIntervalNumbersIndex]
        
        let timeIntervalUnitsIndex = Int(arc4random_uniform(UInt32(timeIntervalUnits.count)))
        var timeIntervalUnit = timeIntervalUnits[timeIntervalUnitsIndex]
        
        if timeIntervalNumber > "1" {
            timeIntervalUnit += "s"
        }
        
        timeIntervalString = "\(timeIntervalNumber) \(timeIntervalUnit)"
        return timeIntervalString
    }
    
}

