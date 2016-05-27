/////////////////////////////////////////////////////////////////////////////////
// The MIT License (MIT)
//
// Copyright (c) 2016 TomoyaHayakawa.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
/////////////////////////////////////////////////////////////////////////////////

import UIKit
import SwiftyAlert


class ViewController: UIViewController {
    
    @IBOutlet private weak var alertButton1: UIButton!
    @IBOutlet private weak var alertButton2: UIButton!
    @IBOutlet private weak var alertButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertButton1.addTarget(self, action: #selector(tappedAlert1(_:)), forControlEvents: .TouchUpInside)
        alertButton2.addTarget(self, action: #selector(tappedAlert2(_:)), forControlEvents: .TouchUpInside)
        alertButton3.addTarget(self, action: #selector(tappedAlert3(_:)), forControlEvents: .TouchUpInside)
    }
    
    dynamic private func tappedAlert1(sender: UIButton) {
        
        Alert(title: "Alert", message: "Simple Alert.")
            .addDefault("OK")
            .addCancel()
            .show(self)
    }
    
    dynamic private func tappedAlert2(sender: UIButton) {
        
        Alert(title: "ActionSheet", message: "message", style: .ActionSheet)
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
                print("ID:", idField?.text, "Password:", passwordField?.text)
            }
            .addTextField { textField in
                idField = textField
                textField.placeholder = "ID"
            }
            .addTextField { textField in
                passwordField = textField
                textField.placeholder = "Password"
                textField.secureTextEntry = true
            }
            .addCancel { print("Cancelled") }
            .show(self) { print("Completion") }
    }
}
