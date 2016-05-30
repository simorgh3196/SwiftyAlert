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
pod "SwiftyAlert", '~>0.4.0'
```

### Manual Installation
To install SwiftyAlert without a dependency manager, please add Alert.swift to your Xcode Project.


## How to use
- Add import
``` swift
import SwiftyAlert
```

- The most simple alert
``` swift
Alert(title: "AlertTitle").addOk().show(self)
```

- Simple Alert
``` swift
Alert(title: "Alert", message: "Simple Alert.")
    .addDefault("OK")
    .show(self)
```

- Action Sheet
``` swift
Alert(title: "ActionSheet", style: .ActionSheet)
    .addDefault("Take Photo") { print("take phote") }
    .addDefault("Open Library") { print("open library") }
    .addDestructive("Delete") { print("delete") }
    .addCancel()
    .show(self)
```

- With TextField
``` swift
Alert(title: "Alert", message: "Alert with TextField.")
    .addTextField { textField in
        textField.placeholder = "ID"
    }
    .addTextField { textField in
        textField.placeholder = "Password"
        textField.secureTextEntry = true
    }
    .addDefaultWithTextField("Login") { textFields in
        textFields?.forEach({ print($0.text) })
    }
    .addCancel("Back") { print("Cancelled") }
    .show(self) { print("Completion") }
```

## Advance

- Change default text of addOk() and addCancel()
``` swift
Alert.okButtonTitle = "Go"
Alert.cancelButtonTitle = "Back"
```

- Use at iPad
``` swift

```


## Message
This is my firt released library.  
So I hope the help from everyone.  
Please report bug to `@Sim_progra` at Twitter.