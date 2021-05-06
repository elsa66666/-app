//
//  ToDoViewController.swift
//  InternetPlus
//
//  Created by Elsa Shaw on 2021/5/6.
//

import UIKit

class ToDoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goBackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
