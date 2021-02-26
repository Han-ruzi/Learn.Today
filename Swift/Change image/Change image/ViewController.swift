//
//  ViewController.swift
//  Change image
//
//  Created by 감자 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageView: UIImageView!

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    var changeView = ["Rick","Scorcher","Summer","TO","TT","Xergiok"]
    
    var changeNum = 0
    

    @IBAction func backButton(_ sender: Any) {
        changeNum = changeNum - 1
        if ( changeNum < 0){
            changeNum = changeView.count - 1
        }
        imageView.image = UIImage(named: changeView[changeNum])
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        changeNum = changeNum + 1
        if( changeNum >= changeView.count){
            changeNum = 0
        }
        imageView.image = UIImage(named: changeView[changeNum])
    }
    
}
