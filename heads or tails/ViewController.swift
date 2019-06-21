//
//  ViewController.swift
//  heads or tails
//
//  Created by Sebastian Moreno on 6/9/19.
//  Copyright © 2019 Sebastian Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //variable to keep track of how many times it lands on heads
    var countHeads: Int = 0
    
    //variable to keep track of how many times it lands on tails
    var countTails: Int = 0

    //declaration of the coin array
    let coinArray = ["heads", "tails"]
    
    
    //declaration of the coin index
     var randomCoinIndex: Int = 0
    
    //connection to the UI Image view
    @IBOutlet weak var coinImageView: UIImageView!
    
    //make it flip when the app is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        flipCoinImage()
    }

    //include motion dectection
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        flipCoinImage()
    }
    
    //connection for the UI button
    @IBAction func flipCoinPressed(_ sender: Any) {
        flipCoinImage()
    }
    @IBOutlet weak var countHeadsLbl: UILabel!
    
    @IBOutlet weak var countTailsLbl: UILabel!
    
   func flipCoinImage(){
    //crate the random generator to flip the coin
    randomCoinIndex = Int.random(in: 0 ... 1)
    
    //change the image properties of the coin
    coinImageView.image = UIImage(named: coinArray[randomCoinIndex])
    
    if(randomCoinIndex == 0){
        countHeads = countHeads + 1
        updateHeadsCount()
    }
        
    if(randomCoinIndex == 1 ){
        countTails = countTails + 1
        updateTailsCount()
    }
    
    }
    
    //function to update the heads counter
    func updateHeadsCount(){
        countHeadsLbl.text = String(countHeads)
    }

    //function to update the tails counter
    func updateTailsCount(){
        countTailsLbl.text = String(countTails)
    }
}

