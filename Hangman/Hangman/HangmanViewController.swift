//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    var hangman = HangmanModel();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hangmanPhrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        let phrase: String = hangmanPhrases.getRandomPhrase()
        print(phrase)
        hangman.phrase = phrase
        
        //initialize empty
        for char in phrase.characters {
            if char != " " {
                HiddenWord.text? += ("_  ")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
   
    @IBAction func StartOverButton(_ sender: Any) {
        hangman.reset()
    }
    
    
    @IBOutlet weak var GuessEnter: UITextField!


    @IBAction func GuessButton(_ sender: Any) {
    }
    
    @IBOutlet weak var IncorrectGuesses: UILabel!
    
    @IBOutlet weak var HiddenWord: UILabel!
    
    /*
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
