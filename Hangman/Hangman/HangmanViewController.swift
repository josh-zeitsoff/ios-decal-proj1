//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController, UITextFieldDelegate {
    
    var hangman = HangmanModel();
    let limitLength = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hangmanPhrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        let phrase: String = hangmanPhrases.getRandomPhrase()
        print(phrase)
        hangman.phrase = phrase
        
        //initialize empty HiddenWord
        var hiddenText = ""
        for char in phrase.characters {
            if char != " " {
                hiddenText += "_  "
            }
            else {
                hiddenText += "   "
            }
        }
        HiddenWord.text = hiddenText
        
        //initialize original image
        hangmanImage.image = UIImage(named: "hangman1")
        
        //initialize incorrect guesses
        IncorrectGuesses.text = "Incorrect Guesses: "
        
        GuessEnter.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitLength
    }

    
   
    
    func updateHiddenWordText(guess: String, indices: [Int]) {
        var newString = ""
        var index = 0
        for i in 0..<HiddenWord.text!.characters.count {
            if (index < indices.count && i / 3 == indices[index]) {
                newString.append(guess)
                index += 1
            }
            else {
                newString.append(HiddenWord.text!.substring(atIndex: i))
            }
        }
        HiddenWord.text = newString
    }
    
    func updateIncorrectGuessesText(guess: String) {
        IncorrectGuesses.text!.append(" " + guess)
    }
    
    func updateHangmanImage(lives: Int) {
        let imageNum = 8 - lives
        let name = "hangman" + String(imageNum)
        hangmanImage.image = UIImage(named: name)
    }
    

    @IBAction func StartOverButton(_ sender: Any) {
        hangmanImage.image = UIImage(named: "hangman1")
        hangman.reset()
        viewDidLoad()
    }

    
    @IBAction func GuessButtonEnter(_ sender: Any) {
        //get input
        if !hangman.finished {
        if let input = GuessEnter.text {
            GuessEnter.text = ""
            let inputUpper = input.uppercased()
            //change hidden word if needed
            if hangman.containsGuess(guess: inputUpper) {
                let indices = hangman.indicesOfLetter(letter: inputUpper)
                updateHiddenWordText(guess: inputUpper, indices: indices)
                hangman.incrCorrectLetters(indicesArr: indices)
            }
            else {
                hangman.decreaseLives()
                updateIncorrectGuessesText(guess: inputUpper)
                updateHangmanImage(lives: hangman.lives);
            }
            if hangman.hasWon() {
                hangman.finished = true;
                let alert = UIAlertController(title: "Congrats!", message: "You've won!", preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    (result : UIAlertAction) -> Void in
                    print("OK")
                }
                alert.addAction(okAction)
                self.present(alert, animated: true)
                print("has won")
                //do game won stuff
            }
            if hangman.hasLost() {
                hangman.finished = true;
                let alert = UIAlertController(title: "Oops", message: "You've lost :(", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                print("has lost")
                //do game lost stuff
            }
            
        }
        }
        else {
            
        let alert = UIAlertController(title: "Oops", message: "Game over! Press Start Over to play again", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false;
    }
    
    
    
    @IBOutlet weak var hangmanImage: UIImageView!
    
    @IBOutlet weak var HiddenWord: UILabel!
    
    @IBOutlet weak var IncorrectGuesses: UILabel!
    
    @IBOutlet weak var GuessEnter: UITextField!
    
        
    /*
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
