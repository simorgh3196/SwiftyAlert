# SwiftyAlert
Simple UIAlertController and UIAlertView wrapper.
Enable to use Swifty.


## Installation and Setup

### Installing with Carthage
```
github "simorgh3196/SwiftyAlert"
```

### Installing with CocoaPods
To integrate SwiftyAlert into your Xcode project using CocoaPods, specify it in your Podfile and run pod install.  

```
platform :ios, '8.0'
use_frameworks!
pod "SwiftyAlert", '~>0.1.0'
```

### Manual Installation
To install SwiftyAlert without a dependency manager, please add Alert.swift to your Xcode Project.


## How to use
- Add import
``` swift
import SwiftyAlert
```

- Simple Alert
``` swift
Alert(title: "Alert", message: "Simple Alert.")
    .addDefault("OK")
    .show(self)
```

- Action Sheet
``` swift
Alert(title: "ActionSheet", message: "", style: .ActionSheet)
    .addDefault("Take Photo") { print("take phote") }
    .addDefault("Open Library") { print("open library") }
    .addDestructive("Delete") { print("delete") }
    .addCancel()
    .show(self)
```

- With TextField
``` swift
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
```


## Message
This is my firt released library.  
So I hope the help from everyone.  
Please report bug to `@Sim_progra` at Twitter.
