//
//  ViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/8/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    override func viewDidLayoutSubviews() {
//        enableConstraints()
    }
    
    func setup() {
//        view.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0)
        view.backgroundColor = .white
        navigationItem.title = "Today"

        
    }
    
    func enableConstraints() {
       
    }


}

