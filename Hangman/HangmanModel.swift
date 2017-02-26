//
//  HangmanModel.swift
//  Hangman
//
//  Created by Joshua Zeitsoff on 2/26/17.
//  Copyright © 2017 Shawn D'Souza. All rights reserved.
//

import UIKit

class HangmanModel: UIViewController {
    
    var phrase: String = ""
    var correctLetters = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //handle game over condition
    
    func reset() {
        correctLetters = 0;
    }
    /* returns TRUE if the game is over (i.e, the number of correctly
    guessed letters equals the number of letters in phrase*/
    
    func gameOver() -> Bool {
        return correctLetters == phrase.removingWhitespaces().characters.count
    }
    
    /*returns TRUE if GUESS is in PHRASE else FALSE */
    func containsGuess(guess: String) -> Bool {
        return phrase.contains(guess)
    }
    
    /* returns indices of GUESS in PHRASE in a list.  Also
     increments correctLETTERS */
    
    
    func indicesOfLetter(letter: String) -> [Int] {
        var indices = [Int]()
        for i in 0...phrase.characters.count {
            if phrase.substring(atIndex: i) == letter {
                indices.append(i)
                correctLetters += 1
            }
        }
        return indices
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
