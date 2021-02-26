//
//  ViewController.swift
//  gestureGame
//
//  Created by 감자 on 2021/02/09.
//

import UIKit

class ViewController: UIViewController {
    
    
    var score = 0
    var highScore = 0
    var imgArray = [UIImageView]()
    
    var counter = 0
    var timer = Timer()
    var hideTimer = Timer()
    
    
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    @IBOutlet weak var imgView4: UIImageView!
    @IBOutlet weak var imgView5: UIImageView!
    @IBOutlet weak var imgView6: UIImageView!
    @IBOutlet weak var imgView7: UIImageView!
    @IBOutlet weak var imgView8: UIImageView!
    @IBOutlet weak var imgView9: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        counter = 10
        timeLabel.text = "Timer \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown) , userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(hideView), userInfo: nil, repeats: true)
        

        scoreLabel.text = "Score \(score)"
        
        
        //High Score
        let storeHighScore = UserDefaults.standard.object(forKey: "highScore")
        
        if storeHighScore == nil{
            highScore = 0
            highLabel.text = "High Score: \(highScore)"
        }
        if let newScore = storeHighScore as? Int {
            highScore = newScore
            highLabel.text = "High Score: \(highScore)"
            
        }
        
        
        imgView1.isUserInteractionEnabled = true
        imgView2.isUserInteractionEnabled = true
        imgView3.isUserInteractionEnabled = true
        imgView4.isUserInteractionEnabled = true
        imgView5.isUserInteractionEnabled = true
        imgView6.isUserInteractionEnabled = true
        imgView7.isUserInteractionEnabled = true
        imgView8.isUserInteractionEnabled = true
        imgView9.isUserInteractionEnabled = true
        
        let gusture1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gusture2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gusture3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gusture4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gusture5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gusture6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gusture7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gusture8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gusture9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        imgView1.addGestureRecognizer(gusture1)
        imgView2.addGestureRecognizer(gusture2)
        imgView3.addGestureRecognizer(gusture3)
        imgView4.addGestureRecognizer(gusture4)
        imgView5.addGestureRecognizer(gusture5)
        imgView6.addGestureRecognizer(gusture6)
        imgView7.addGestureRecognizer(gusture7)
        imgView8.addGestureRecognizer(gusture8)
        imgView9.addGestureRecognizer(gusture9)
        
        imgArray = [imgView1,imgView2,imgView3,imgView4,imgView5,imgView6,imgView7,imgView8,imgView9]
        
        
       hideView()
    }


    @objc func increaseScore(){
        score = score + 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown(){
        counter -= 1
        timeLabel.text = "Timer: \(counter)"
        
        if counter == 0 {
            timer.invalidate() //무효화
            hideTimer.invalidate()
            
            
            for img in imgArray {
                img.isHidden = true
                print(img)
            }
            
            if self.score > self.highScore {
                self.highScore = self.score
                highLabel.text = "High Score : \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highScore")
            }
            
            let alert = UIAlertController(title: "Time is Over", message: "Do you wanna play again?", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                self.score = 0
                self.scoreLabel.text = "Score : \(self.score)"
                self.counter = 10
                self.timeLabel.text = "Timer : \(self.counter)"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown) , userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.hideView), userInfo: nil, repeats: true)
            }
            

            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
            
            
        }
    }
    @objc func hideView(){
        for img in imgArray {
            img.isHidden = true
        }
        let randomIndex = Int( arc4random_uniform(UInt32(imgArray.count - 1)))
        imgArray[randomIndex].isHidden = false
    }
    
    
}

