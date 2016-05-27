////
////  SwiftyAlert.swift
////  SwiftyAlert
////
////  Created by 早川智也 on 2016/05/26.
////  Copyright © 2016年 simorgh. All rights reserved.
////
//
//import Foundation
//
//public typealias AlertActionType = () -> Void
//
//public class SwiftyAlert {
//    
//    public weak var delegate: SwiftyAlertDelegate?
//    
//    public init() {}
//    
////    @available(iOS 8.0, *)
////    static func make() -> Alert {
////        return Alert(title: "", message: "", style: .Alert)
////    }
////    
////    static func make() -> AlertView {
////        return AlertView(title: "", message: "")
////    }
//}
//
//
//public protocol SwiftyAlertDelegate: UIAlertViewDelegate {
//    var swiftyAlert: SwiftyAlert { get }
//}
//
//extension SwiftyAlertDelegate {
//    
//    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
//        print(#function, "buttonIndex:", buttonIndex)
//    }
//    
//    func alertViewCancel(alertView: UIAlertView) {
//        print(#function)
//    }
//    
//    func didPresentAlertView(alertView: UIAlertView) {
//        print(#function)
//    }
//    
//    func willPresentAlertView(alertView: UIAlertView) {
//        print(#function)
//    }
//    
//    func alertView(alertView: UIAlertView, willDismissWithButtonIndex buttonIndex: Int) {
//        print(#function)
//    }
//    
//    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
//        print(#function)
//    }
//    
//    func alertViewShouldEnableFirstOtherButton(alertView: UIAlertView) -> Bool {
//        print(#function)
//        return true
//    }
//}