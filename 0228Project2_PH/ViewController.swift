//
//  ViewController.swift
//  day30 Project6a_PH
//
//  Created by 李沐軒 on 2019/2/28.
//  Copyright © 2019 李沐軒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    var countries = [String]()
    var score = 0
    var answer = 0
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
        
    }

    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        answer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[answer].uppercased()
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String = ""
//        var selectWrong: Int
        
        count += 1
        
        if sender.tag == answer {
            title = "Good job!"
            score += 1
        } else {
            title = "Wrong!\n That’s the flag of \(countries[sender.tag].uppercased())"
            score -= 1
            
        }
        
        if count < 10 {
            message = "Question \(count) is done."
        } else if count == 10 {
            message = "This's final question."
            count = 0
        }
    
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true, completion: nil)
        
        let scoreOnBarItem = UIBarButtonItem(title: "Score: \(score)", style: .plain, target: self, action: nil)
        
        self.navigationItem.rightBarButtonItem = scoreOnBarItem
        

    }
    
    
    
    
}

