//
//  ViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/8/22.
//

import UIKit

class TodayViewController: BaseViewController {
    let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        enableConstraints()
    }
    
    func setup() {
        titleLabel.text = "Today"
        view.addSubview(titleLabel)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       navigationItem.title = "Today"
    }
    
    func enableConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }


}

