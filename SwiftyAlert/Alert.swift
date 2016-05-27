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


public class Alert {
    public typealias AlertActionType = () -> Void
    
    public var controller: UIAlertController
    
    /**
     initializer
     
     - parameter title: Alert title
     - parameter message: Alert message
     - parameter style: UIAlertControllerStyle. Default is .Alert
     */
    public init(title: String, message: String, style: UIAlertControllerStyle = .Alert) {
        controller = UIAlertController(title: title, message: message, preferredStyle: style)
    }
    
    /**
     Add default type button and action to UIAlertController.
     - Return Alert, so you can chain method.
     - AlertActionType is () -> Void
     
     - parameter title  : Button title.
     - parameter action : Called when button selected. Default is nil.
     - returns          : Alert
     */
    public func addDefault(title: String, action: AlertActionType? = nil) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .Default) {_ in action?() })
        return self
    }
    
    /**
     Add destructive type button and action to UIAlertController.
     - Return Alert, so you can chain method.
     - AlertActionType is () -> Void
     
     - parameter title  : Button title.
     - parameter action : Called when button selected. Default is nil.
     - returns          : Alert
     */
    public func addDestructive(title: String, action: AlertActionType? = nil) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .Destructive) {_ in action?() })
        return self
    }
    
    /**
     Add cancel type button and action to UIAlertController.
     - Return Alert, so you can chain method.
     - AlertActionType is () -> Void
     
     - parameter title  : Button title. default is "Cancel".
     - parameter action : Called when button selected. default is nil.
     - returns          : Alert
     */
    public func addCancel(title: String = "Cancel", action: AlertActionType? = nil) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .Cancel) {_ in action?() })
        return self
    }
    
    /**
     Add textField to UIAlertController and handle textField.
     - Return Alert, so you can chain method.
     
     - parameter handle : Configure UITextField.
     - returns          : Alert
     */
    public func addTextField(handler: ((UITextField) -> Void)) -> Alert {
        controller.addTextFieldWithConfigurationHandler(handler)
        return self
    }
    
    /**
     Configure UIPopoverPresentationController.
     If you use at iPad, you have to define this.
     - Return Alert, so you can chain method.
     
     - parameter handler: (UIPopoverPresentationController?) -> Void
     - returns          : Alert
     */
    public func handlePopoverController(handler: (UIPopoverPresentationController?) -> Void) -> Alert {
        handler(controller.popoverPresentationController)
        return self
    }

    /**
     Present UIAlertController to View.
     
     - parameter target     : Target UIViewController.
     - parameter animated   : If you wont to no animation, set this false. default is true.
     - parameter completion : Called when did show UIAlertController.
     */
    public func show(target: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        target.presentViewController(controller, animated: animated, completion: completion)
    }
}
