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
    var correctLetters: Int = 0
    var lives: Int = 7
    var finished: Bool = false
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
        correctLetters = 0
        lives = 7
        finished = false;
    }
    
    /* return true if the user has won, i.e the number of correct letters guessed
    equals the number of characters in the Phrasee, minus whitespace. Note: correct
    letters can be the same, i.e guessing "r" for Crossroads counts as 2 correct
    letters*/
    func hasWon() -> Bool {
        return correctLetters == phrase.replacingOccurrences(of: " ", with: "").characters.count
    }
    
    /* Return true if the user has lost, i.e the number of lives is now 0. Lives = 7 because there are 7 body parts (head, neck, body, left arm, right arm, left leg, right leg. */
    func hasLost() -> Bool {
        return lives == 1
    }
    
    /*Returns TRUE if the Hidden Word need to be updated, else FALSE */
    func changeHiddenWord(guess: String) -> Bool {
        return containsGuess(guess: guess)
    }
    
    
    /*Returns TRUE if the Incorrect Guesses need to be updated, else FALSE */
    func changeIncorrectGuesses(guess: String) -> Bool{
        return !containsGuess(guess: guess)
    }
    
    /*Returns TRUE if the image needs to be updated, else FALSE */
    func changeImage(guess: String) -> Bool {
        return !containsGuess(guess: guess)
    }
    
    /*returns TRUE if GUESS is in PHRASE else FALSE */
    func containsGuess(guess: String) -> Bool {
        return phrase.contains(guess)
    }
    
    func decreaseLives() {
        lives -= 1
    }
    
    func incrCorrectLetters(indicesArr: [Int]) {
        correctLetters += indicesArr.count
    }
    
    /* returns indices of GUESS in PHRASE in a list.  Also
     increments correctLETTERS */
    
    
    
    func indicesOfLetter(letter: String) -> [Int] {
        var indices = [Int]()
        for i in 0...phrase.characters.count {
            if phrase.substring(atIndex: i) == letter {
                indices.append(i)
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
