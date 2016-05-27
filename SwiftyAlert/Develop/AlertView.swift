////
////  AlertView.swift
////  SwiftyAlert
////
////  Created by 早川智也 on 2016/05/26.
////  Copyright © 2016年 simorgh. All rights reserved.
////
//
//import UIKit
//
//public class AlertViewAction {
//    public var id: Int?
//    public var title: String
//    public var action: AlertActionType?
//    
//    init(title _title: String, action _action: AlertActionType?) {
//        title = _title
//        action = _action
//    }
//}
//
//
////@available(iOS, obsoleted=8.0, message="AlertView is obsoleted. Use AlertController")
//@available(iOS, deprecated=9.0, message="AlertView is deprecated. Use AlertController")
//public class AlertView: UIView {
//    
//    private var title: String!
//    private var message: String!
//    private var style: UIAlertViewStyle!
//    private var actions: [AlertViewAction]!
//    private var cancelAction: AlertViewAction!
//    private var completionAction: AlertActionType?
//    
//    public init(title _title: String, message _message: String) {
//        super.init(frame: CGRectZero)
//        title = _title
//        message = _message
//        style = .Default
//        actions = []
//        cancelAction = AlertViewAction(title: "Cancel", action: nil)
//    }
//    
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    public func addDefault(title: String, action: AlertActionType) -> AlertView {
//        print(#function)
//        actions.append(AlertViewAction(title: title, action: action))
//        return self
//    }
//    
//    public func addCancel(title: String = "Cancel", action: AlertActionType) -> AlertView {
//        print(#function)
//        cancelAction = AlertViewAction(title: title, action: action)
//        return self
//    }
//    
//    public func addTextField(handler: (UITextField -> Void)) -> AlertView {
//        print(#function)
//        style = .LoginAndPasswordInput
//        return self
//    }
//    
//    public func show(target: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
//        print(#function)
//        let alertView = UIAlertView(title: title, message: message, delegate: self, cancelButtonTitle: cancelAction.title)
//        actions.forEach({ $0.id = alertView.addButtonWithTitle($0.title) })
//        completionAction = completion
//        print("numberOfButtons:", alertView.numberOfButtons)
//        alertView.show()
//    }
//}
//
//extension AlertView: UIAlertViewDelegate {
//    
//    public func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
//        
//        print(#function, "buttonIndex:", buttonIndex)
//        
//        if buttonIndex == alertView.cancelButtonIndex {
//            cancelAction.action?()
//            return
//        }
//        
//        for action in actions where action.id == buttonIndex {
//            action.action?()
//            break
//        }
//    }
//    
//    public func alertViewCancel(alertView: UIAlertView) {
//        print(#function)
//        cancelAction.action?()
//    }
//    
//    public func didPresentAlertView(alertView: UIAlertView) {
//        print(#function)
//        completionAction?()
//    }
//    
//    public func willPresentAlertView(alertView: UIAlertView) {
//        print(#function)
//    }
//    
//    public func alertView(alertView: UIAlertView, willDismissWithButtonIndex buttonIndex: Int) {
//        print(#function)
//    }
//    
//    public func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
//        print(#function)
//    }
//    
//    public func alertViewShouldEnableFirstOtherButton(alertView: UIAlertView) -> Bool {
//        print(#function)
//        return true
//    }
//}
//
