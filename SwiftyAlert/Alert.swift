//
//  Alert.swift
//  SwiftyAlert
//
//  Created by 早川智也 on 2016/05/26.
//  Copyright © 2016年 simorgh. All rights reserved.
//

import UIKit


@available(iOS 8.0, *)
public struct Alert {
    public typealias AlertActionType = () -> Void
    
    private(set) var controller: UIAlertController
    
    public init(title: String, message: String, style: UIAlertControllerStyle = .Alert) {
        controller = UIAlertController(title: title, message: message, preferredStyle: style)
    }
    
    public func addDefault(title: String, action: AlertActionType? = nil) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .Default, handler: {_ in action?() }))
        return self
    }
    
    public func addDestructive(title: String, action: AlertActionType) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .Destructive, handler: {_ in action() }))
        return self
    }
    
    public func addCancel(title: String = "Cancel", action: AlertActionType? = nil) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .Cancel, handler: {_ in action?() }))
        return self
    }
    
    public func addTextField(handler: ((UITextField) -> Void)) -> Alert {
        controller.addTextFieldWithConfigurationHandler(handler)
        return self
    }
    
    public func configurePop(handler: (UIPopoverPresentationController?) -> Void) -> Alert {
        handler(controller.popoverPresentationController)
        return self
    }
    
    public func show(target: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        target.presentViewController(controller, animated: animated, completion: completion)
    }
}
