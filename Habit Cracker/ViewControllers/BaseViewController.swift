//
//  BaseViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 10/6/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        UILabel.appearance().textColor = .white
//        UILabel.appearance().font = UIFont(name: "Arial", size: 30)
//        UITextField.appearance().font = UIFont(name: "Arial", size: 30)
        
        // Do any additional setup after loading the view.
    }
    
    
//    override func present(_ viewControllerToPresent: UIViewController,
//                            animated flag: Bool,
//                            completion: (() -> Void)? = nil) {
//        viewControllerToPresent.modalPresentationStyle = .formSheet
//        super.present(viewControllerToPresent, animated: flag, completion: completion)
//      }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
