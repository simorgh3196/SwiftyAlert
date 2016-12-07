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
    
    static public var okButtonTitle = "OK"
    static public var cancelButtonTitle = "Cancel"
    
    public var controller: UIAlertController
    public var textFieldHandler: ((UITextField, Int) -> Void)?
    
    private var disposeBag: Alert?
    
    /**
     initializer
     
     - parameter title   : Alert title
     - parameter message : Alert message
     - parameter style   : UIAlertControllerStyle. Default is .alert.
     */
    public init(title: String, message: String = "", style: UIAlertControllerStyle = .alert) {
        controller = UIAlertController(title: title, message: message, preferredStyle: style)
    }
    
    /**
     Add default type button and action to UIAlertController.
     Button title is Alert.okButtonTitle.
     This is convenience method to show "OK".
     If you wont to change default title, change Alert.okButtonTitle.
     - Return Alert, so you can use method chain.
     
     - parameter title  : Button title.
     - parameter action : Called when button selected. Default is nil.
     - returns          : Alert
     */
    public func addOk(_ action: (() -> Void)? = nil) -> Alert {
        controller.addAction(UIAlertAction(title: Alert.okButtonTitle, style: .default) {_ in action?() })
        return self
    }

    /**
     Add default type button and action to UIAlertController.
     - Return Alert, so you can use method chain.
     
     - parameter title  : Button title.
     - parameter action : Called when button selected. Default is nil.
     - returns          : Alert
     */
    public func addDefault(_ title: String, action: (() -> Void)? = nil) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .default) {_ in action?() })
        return self
    }
    
    /**
     Add default type button and action to UIAlertController.
     - Return Alert, so you can use method chain.
     
     - parameter title  : Button title.
     - parameter action : Called when button selected. Default is nil.
     - returns          : Alert
     */
    public func addDefaultWithTextField(_ title: String,
                                        action: (([UITextField]?) -> Void)? = nil) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .default) { [weak self] _ in
            action?(self?.controller.textFields)
            self?.disposeBag = nil
        })
        disposeBag = disposeBag ?? self
        return self
    }
    
    /**
     Add destructive type button and action to UIAlertController.
     - Return Alert, so you can chain method.
     
     - parameter title  : Button title.
     - parameter action : Called when button selected. Default is nil.
     - returns          : Alert
     */
    public func addDestructive(_ title: String, action: (() -> Void)? = nil) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .destructive) {_ in action?() })
        return self
    }
    
    /**
     Add destructive type button and action to UIAlertController.
     - Return Alert, so you can use method chain.
     
     - parameter title  : Button title.
     - parameter action : Called when button selected. Default is nil.
     - returns          : Alert
     */
    public func addDestructiveWithTextField(_ title: String,
                                            action: (([UITextField]?) -> Void)? = nil) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .destructive) { [weak self] _ in
            action?(self?.controller.textFields)
            self?.disposeBag = nil
            })
        disposeBag = disposeBag ?? self
        return self
    }
    
    /**
     Add cancel type button and action to UIAlertController.
     Default value of title is Alert.cancelButtonTitle.
     If you wont to change default title, change Alert.okButtonTitle.
     - Return Alert, so you can chain method.
     
     - parameter title  : Button title. default is "Cancel".
     - parameter action : Called when button selected. default is nil.
     - returns          : Alert
     */
    public func addCancel(_ title: String = Alert.cancelButtonTitle, action: (() -> Void)? = nil) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .cancel) {_ in action?() })
        return self
    }
    
    /**
     Add cancel type button and action to UIAlertController.
     Default value of title is Alert.cancelButtonTitle.("Cancel").
     If you wont to change default title, change Alert.okButtonTitle.
     - Return Alert, so you can use method chain.
     
     - parameter title  : Button title.
     - parameter action : Called when button selected. Default is nil.
     - returns          : Alert
     */
    public func addCancelWithTextField(_ title: String = Alert.cancelButtonTitle,
                                       action: (([UITextField]?) -> Void)? = nil) -> Alert {
        controller.addAction(UIAlertAction(title: title, style: .cancel) { [weak self] _ in
            action?(self?.controller.textFields)
            self?.disposeBag = nil
        })
        disposeBag = disposeBag ?? self
        return self
    }
    
    /**
     Add textField to UIAlertController and handle textField.
     - Return Alert, so you can chain method.
     
     - parameter handle : Configure UITextField.
     - returns          : Alert
     */
    public func addTextField(_ handler: @escaping (UITextField) -> Void) -> Alert {
        controller.addTextField { [weak self] textField in
            guard let s = self else { return }
            handler(textField)
            NotificationCenter.default.addObserver(
                s,
                selector: #selector(s.textFieldDidChange(_:)),
                name: NSNotification.Name.UITextFieldTextDidChange,
                object: textField)
        }
        return self
    }

    /**
     Register handler of UITextFieldTextDidChangeNotification.
     
     - parameter handler: UITextField, Index of textFields
     - returns          : Alert
     */
    public func handleTextFieldDidChange(_ handler: @escaping (UITextField, Int) -> ()) -> Alert {
        textFieldHandler = handler
        return self
    }
    
    /**
     Configure UIPopoverPresentationController.
     If you use UIAlertController at iPad, you have to define this.
     - Return Alert, so you can chain method.
     
     - parameter handler : (UIPopoverPresentationController?) -> Void
     - returns           : Alert
     */
    public func handlePopoverController(_ handler: (UIPopoverPresentationController?) -> Void) -> Alert {
        handler(controller.popoverPresentationController)
        return self
    }

    /**
     Present UIAlertController to View.
     
     - parameter target     : Target UIViewController.
     - parameter animated   : If you wont to no animation, set this false. default is true.
     - parameter completion : Called when did show UIAlertController.
     */
    public func show(animated: Bool = true, completion: (() -> Void)? = nil) {
        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            DispatchQueue.main.async { [weak self] in
                guard let s = self else { return }
                vc.present(s.controller, animated: animated, completion: completion)
            }
        }
    }
    
    private dynamic func textFieldDidChange(_ notification: Notification) {
        guard let textField = notification.object as? UITextField
            , let index = controller.textFields?.index(of: textField) else {
                return
        }
        textFieldHandler?(textField, index)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
