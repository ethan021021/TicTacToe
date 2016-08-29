//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Ethan Thomas on 8/28/16.
//  Copyright © 2016 Ethan Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var gameBtns: [UIButton]!
    
    var activePlayer = 1
    
    var tags = 1
    
    var gameState = [Int]()
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    var activeGame = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for gameBtn in gameBtns {
            gameBtn.tag = tags
            gameBtn.setImage(nil, for: [])
            tags += 1
            gameState.append(0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    
    func playGameAgain() {
        activeGame = true
        activePlayer = 1
        gameState = [0,0,0,0,0,0,0,0,0,0]
        for gameBtn in gameBtns {
            gameBtn.setImage(nil, for: [])
        }
    }

    @IBAction func gameBtnPressed(_ sender: UIButton) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "o"), for: [])
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "x"), for: [])
                activePlayer = 1
            }
            
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    activeGame = false
                    var winner: String
                    if gameState[combination[0]] == 1 {
                        winner = "O's"
                    } else {
                        winner = "X's"
                    }
                    showAlert(title: "Winner!", message: "Looks like \(winner) win!")
                    
                    playGameAgain()
                }
            }
        }
    }

}

