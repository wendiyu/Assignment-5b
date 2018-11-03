

// Created on: October-29-2018
// Created by: Wendi Yu
// Created for: ICS3U
// This program is the UIKit solution for 21 card game
// this will be commented out when code moved to Xcode
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let player1Card : Int = Int(arc4random_uniform(10) + 1)
    let player2Card : Int = Int(arc4random_uniform(10) + 1)
    let thirdCard : Int = Int(arc4random_uniform(10) + 1)
    let dealer1Card : Int = Int(arc4random_uniform(10) + 1)
    let dealer2Card : Int = Int(arc4random_uniform(10) + 1)
    
    let playerCardLable = UILabel()
    let playerCurrentLable = UILabel()
    let optionLable = UILabel()
    let thirdCardLable = UILabel()
    let playerScoreLable = UILabel()
    let dealerCardLable = UILabel()
    let dealerScoreLable = UILabel()
    let resultLable = UILabel()
    let drawButton = UIButton()
    let checkButton = UIButton()
    
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        playerCardLable.text = "Player first two cards: \(player1Card), \(player2Card) "
        view.addSubview(playerCardLable)
        playerCardLable.translatesAutoresizingMaskIntoConstraints = false
        playerCardLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        playerCardLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        playerCurrentLable.text = "Player current scores is: \(player1Card + player2Card)"
        view.addSubview(playerCurrentLable)
        playerCurrentLable.translatesAutoresizingMaskIntoConstraints = false
        playerCurrentLable.topAnchor.constraint(equalTo: playerCardLable.topAnchor, constant: 20).isActive = true
        playerCurrentLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        optionLable.text = "Do you want draw additional card? "
        view.addSubview(optionLable)
        optionLable.translatesAutoresizingMaskIntoConstraints = false
        optionLable.topAnchor.constraint(equalTo: playerCurrentLable.topAnchor, constant: 20).isActive = true
        optionLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        drawButton.setTitle("Yes! Draw ", for: .normal)
        drawButton.setTitleColor(.blue, for: .normal)
        drawButton.addTarget(self, action: #selector(showDraw), for: .touchUpInside)
        view.addSubview(drawButton)
        drawButton.translatesAutoresizingMaskIntoConstraints = false
        drawButton.topAnchor.constraint(equalTo: optionLable.bottomAnchor, constant: 10).isActive = true
        drawButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        checkButton.setTitle("No,check", for: .normal)
        checkButton.setTitleColor(.blue, for: .normal)
        checkButton.addTarget(self, action: #selector(showCheck), for: .touchUpInside)
        view.addSubview(checkButton)
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton.topAnchor.constraint(equalTo: optionLable.bottomAnchor, constant: 10).isActive = true
        checkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
        
        //player third card lable
        view.addSubview(thirdCardLable)
        thirdCardLable.translatesAutoresizingMaskIntoConstraints = false
        thirdCardLable.topAnchor.constraint(equalTo: drawButton.bottomAnchor, constant: 20).isActive = true
        thirdCardLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // player total card score lable
        view.addSubview(playerScoreLable)
        playerScoreLable.translatesAutoresizingMaskIntoConstraints = false
        playerScoreLable.topAnchor.constraint(equalTo: thirdCardLable.bottomAnchor, constant: 20).isActive = true
        playerScoreLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        //dealer Card Lable
        view.addSubview(dealerCardLable)
        dealerCardLable.translatesAutoresizingMaskIntoConstraints = false
        dealerCardLable.topAnchor.constraint(equalTo: playerScoreLable.bottomAnchor, constant: 20).isActive = true
        dealerCardLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        //dealer total card score lable 
        view.addSubview(dealerScoreLable)
        dealerScoreLable.translatesAutoresizingMaskIntoConstraints = false
        dealerScoreLable.topAnchor.constraint(equalTo: dealerCardLable.bottomAnchor, constant: 20).isActive = true
        dealerScoreLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        //result lable
        view.addSubview(resultLable)
        resultLable.translatesAutoresizingMaskIntoConstraints = false
        resultLable.topAnchor.constraint(equalTo: dealerScoreLable.bottomAnchor, constant: 20).isActive = true
        resultLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
    }
    
    @objc func showDraw() {
        // show answer 
        
        thirdCardLable.text = "Player's third card is: \(thirdCard)"
        playerScoreLable.text = "Player's scores is: \(player1Card + player2Card + thirdCard)"
        dealerCardLable.text = "Dealer's card is: \(dealer1Card), \(dealer2Card)"
        dealerScoreLable.text = "Dealer's scores is: \(dealer1Card + dealer2Card)"
        
        if (player1Card + player2Card + thirdCard) > (dealer1Card + dealer2Card) && (player1Card + player2Card + thirdCard) <= 21 {
            resultLable.text = "Player win"
        }
        else if (player1Card + player2Card + thirdCard) <= 21 && (dealer1Card + dealer2Card) > 21 {
            resultLable.text = "Player win"
        }
        else {
            resultLable.text = "Dealer win"
        }
        
    }
    
    @objc func showCheck() {
        // show answers
        
        dealerCardLable.text = "Dealer's card is: \(dealer1Card), \(dealer2Card)"
        dealerScoreLable.text = "Dealer's scores is: \(dealer1Card + dealer2Card)"
        
        if (player1Card + player2Card) > (dealer1Card + dealer2Card) && (player1Card + player2Card) <= 21  {
            resultLable.text = "Player win"
        }
        else if (player1Card + player2Card) <= 21 && (dealer1Card + dealer2Card) > 21 {
            resultLable.text = "Player win"
        }
        else {
            resultLable.text = "Dealer win"
        }
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
