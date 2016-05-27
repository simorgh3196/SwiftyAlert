//
//  ViewController.swift
//  Example
//
//  Created by 早川智也 on 2016/05/26.
//  Copyright © 2016年 simorgh. All rights reserved.
//

import UIKit
import SwiftyAlert


class ViewController: UIViewController {
    
    @IBOutlet weak var alertButton1: UIButton!
    @IBOutlet weak var alertButton2: UIButton!
    @IBOutlet weak var alertButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertButton1.addTarget(self, action: #selector(tappedAlert1(_:)), forControlEvents: .TouchUpInside)
        alertButton2.addTarget(self, action: #selector(tappedAlert2(_:)), forControlEvents: .TouchUpInside)
        alertButton3.addTarget(self, action: #selector(tappedAlert3(_:)), forControlEvents: .TouchUpInside)
    }
    
    dynamic private func tappedAlert1(sender: UIButton) {
        
        Alert(title: "Alert", message: "Simple Alert.")
            .addDefault("OK")
            .show(self)
    }
    
    dynamic private func tappedAlert2(sender: UIButton) {
        
        Alert(title: "ActionSheet", message: "", style: .ActionSheet)
            .addDefault("Take Photo") { print("take phote") }
            .addDefault("Open Library") { print("open library") }
            .addDestructive("Delete") { print("delete") }
            .addCancel()
            .show(self)
    }
    
    dynamic private func tappedAlert3(sender: UIButton) {
        
        var idField: UITextField?
        var passwordField: UITextField?
        
        Alert(title: "Alert", message: "Alert with TextField.")
            .addDefault("Login") {
                print("Action1 selected.\nID:", idField?.text, "Password:", passwordField?.text)
            }
            .addTextField { textField in
                idField = textField
                textField.placeholder = "ID"
            }
            .addTextField { textField in
                passwordField = textField
                textField.placeholder = "Password"
            }
            .addCancel { print("Cancelled") }
            .show(self) { print("Completion") }
    }
}
