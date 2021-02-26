//
//  ViewController.swift
//  ClickGesture
//
//  Created by 감자 on 2021/02/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clickImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var isValue = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clickImage.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        
        clickImage.addGestureRecognizer(gestureRecognizer)
      
        
    }
        
        @objc func changeImage(){
            if isValue == true{
                clickImage.image = UIImage(named: "TT")
                nameLabel.text = "This is Tree Trunks"
                isValue = false
            }else{
                clickImage.image = UIImage(named: "TO")
                nameLabel.text = "This is Tiffany Oiler"
                isValue = true
            }
        }
        
        
    


}

