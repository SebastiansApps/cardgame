//  Created by Sebastian Nilsson on 2017-08-22.
//  Copyright © 2017 bettercallnilsson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //connect storyboard contents to vc
    @IBOutlet weak var rightCard: UIImageView!
    @IBOutlet weak var leftCard: UIImageView!
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var cpuScore: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    //Timer variables
    var timer = Timer()
    var seconds = 0
    var timerIsOn = false
    var buttonTaps = 0
    //Player and CPU scores
    var plScore = 0
    var cpScore = 0
    //Random number variable
    var randomNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Timerfunction
    func activateTimer(){
        seconds += 1
        timerLabel.text = "\(seconds)"
    }
    
    @IBAction func dealTap(_ sender: UIButton) {
        if buttonTaps == 0 {
            
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.activateTimer), userInfo: nil, repeats: true)
        }
        
        buttonTaps += 1
        
        self.playerScore.text = "\(plScore)"
        self.cpuScore.text = "\(cpScore)"
        
        let a = arc4random_uniform(13)+2
        let b = arc4random_uniform(13)+2
        
        leftCard.image = UIImage(named: "card\(a)")
        rightCard.image = UIImage(named: "card\(b)")
        
        if a > b{
            plScore += 1
            self.playerScore.text = "\(plScore)"
            
        }else if a < b{
            cpScore += 1
            self.cpuScore.text = "\(cpScore)"
            
        }else{
            print("equal,try again")
            
        }
        
        if cpScore > 12 || plScore > 12{
            
            var a: String
            
            if plScore > 12{
                a = "won!"
            }else{
                a = "lost!"
            }
            
            let alertController = UIAlertController(
                title: "You \(a)", message: "time: \(seconds) seconds", preferredStyle: .alert)
            let defaultAction = UIAlertAction(
                title: "Play again", style: .default, handler: nil)
            //you can add custom actions as well
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
            cpScore = 0
            plScore = 0
            self.playerScore.text = "\(plScore)"
            self.cpuScore.text = "\(cpScore)"
            leftCard.image = UIImage(named: "back")
            rightCard.image = UIImage(named: "back")
            
            timer.invalidate()
            seconds = 0
            timerLabel.text = "\(0)"
            buttonTaps = 0
        }
        
    }

}
