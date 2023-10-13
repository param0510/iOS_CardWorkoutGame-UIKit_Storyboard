//
//  ViewController.swift
//  CardWorkoutGame
//
//  Created by param  on 2023-05-17.
//

import UIKit

class CardGameUIVC: UIViewController {
    
    
    @IBOutlet var cardImageView: UIImageView!
    
    var cardsImageNameArray: [String] = []
    
//    var timer: Timer?
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Populating the cards location array for dynamically changing the Image view
        cardsImageNameArray = CardsUtility.getCardsNameList()
        
        // starting the card change animation
        startTimer()
        
        // print(CardsUtility.getCardsLocationList())
        
        // Startup load image - Testing
        
        // Statically generated
//        cardImageView.image = UIImage(named: "Joker") ?? UIImage.remove
        
        // Randomly generated
//        cardImageView.image = UIImage(named: "Images/\(getRandomCardName())") ?? UIImage.remove
        
//        print(getRandomCardName())
        
    }
    
    // Random image name generator from an array of image names
    func getRandomCardName() -> String{
        if cardsImageNameArray.count > 0 {
            return cardsImageNameArray[Int.random(in: 0..<cardsImageNameArray.count)]
        }
        else
        {
            return ""
            // Make use of this later for enhanced version
//            return "Joker_404"
        }
    }
    
    // Function generates the visual animation using timer and linked up other functions
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(changeCardImage), userInfo: nil, repeats: true)
    }
    
    // Objective-C type function for Timer to run after every interval
    // Connected to the Timer using a selector
    // Func - Changes the image view after regular intervals by getting calls from Timer
    @objc func changeCardImage(){
        cardImageView.image = UIImage(named: "Images/\(getRandomCardName())") ?? .remove
    }
    
    // Action for Stop Button
    @IBAction func stopButtonAction(_ sender: Any) {
        // Note: if let, guard let and ?? - nil collacesing in used for accessing value of optional
        
//        if let timer = timer{
//            timer.invalidate()
//        }
        
        // For referencing or calling methods/attributes inside the optional use optional chaining
        timer!.invalidate()
        
    }
    
    // Action for restart button
    @IBAction func restartBtnAction(_ sender: Any) {
        
        // Implicit unwrapping use only when certain that it contains value and not nil, to prevent crash
        // For this example this will work well only if on view load we initialize the value of timer by calling startTimer() method defined above
        // timer!.invalidate()
        
        // Can use anytime as it will only be triggered if the value is not nil
        timer?.invalidate()
        startTimer()
    }
}
