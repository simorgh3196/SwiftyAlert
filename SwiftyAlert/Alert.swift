//
//  Alert.swift
//  SwiftyAlert
//
//  Created by 早川智也 on 2016/05/26.
//  Copyright © 2016年 simorgh. All rights reserved.
//

import UIKit


public struct Alert {
    public typealias AlertActionType = () -> Void
    
    private var controller: UIAlertController
    
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
     - parameter action : Called when button selected. default is null.
     - returns          : Alert
     */
    public func addDefault(title: String, action: AlertActionType? = nil) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .Default, handler: {_ in action?() }))
        return self
    }
    
    /**
     Add destructive type button and action to UIAlertController.
     - Return Alert, so you can chain method.
     - AlertActionType is () -> Void
     
     - parameter title  : Button title.
     - parameter action : Called when button selected. No default value, so you have to define this.
     - returns          : Alert
     */
    public func addDestructive(title: String, action: AlertActionType) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .Destructive, handler: {_ in action() }))
        return self
    }
    
    /**
     Add cancel type button and action to UIAlertController.
     - Return Alert, so you can chain method.
     - AlertActionType is () -> Void
     
     - parameter title  : Button title. default is "Cancel".
     - parameter action : Called when button selected. default is null.
     - returns          : Alert
     */
    public func addCancel(title: String = "Cancel", action: AlertActionType? = nil) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .Cancel, handler: {_ in action?() }))
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
