//
//  CardSelectionVC.swift
//  CardsRandom
//
//  Created by marvin evins on 5/17/20.
//  Copyright © 2020 websavantmedia. All rights reserved.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    var timer:  Timer!

    @IBOutlet weak var cardImageView: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var cards: [UIImage] = Card.allValues
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        // Do any additional setup after loading the view.
        for button in buttons{
            button.layer.cornerRadius = 8
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
       // print("timer fired off")
        cardImageView.image = cards.randomElement() ?? UIImage(named:"AS")
    }
    @IBAction func stopButtonTapped(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func restartButtonTapped(_ sender: Any) {
        timer.invalidate()
        startTimer()
    }
    
    @IBAction func rulesButtonTapped(_ sender: Any) {
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
