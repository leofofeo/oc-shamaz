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
        resetUI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var storyPrompt: UILabel!
    
    @IBOutlet weak var nextPlayer: UILabel!
    
    @IBAction func promptPastAction(_ sender: UIButton) {
        storyPrompt.text = generatePastAction()
    }
    
    @IBAction func promptFutureAction(_ sender: UIButton) {
        storyPrompt.text = generateFutureAction()
    }
    
    @IBAction func selectNextPlayer(_ sender: UIButton) {
        //return random number from range of 1-10
        nextPlayer.text = String(arc4random_uniform(10) + 1)
    }

    func resetUI(){
        storyPrompt.text = "";
        nextPlayer.text = "";
    }
    
    func generatePastAction() -> String {
        
        return "past action"
    }
    
    func generateFutureAction() -> String {
        
        return "future action"
    }
    
}

