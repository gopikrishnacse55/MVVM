//
//  Utilities.swift
//  Practical MVVM
//
//  Created by Gopi Krishna Kasireddy on 7/9/19.
//  Copyright © 2019 Gopi Krishna Kasireddy. All rights reserved.
//

import UIKit
import ANLoader
class Utilities: NSObject {

    class var sharedInstance : Utilities
    {
        let _sharedInstance = Utilities();
        return _sharedInstance
    }
    
    func showLoadingIndicator(title : String) -> Void
    {
        ANLoader.showLoading(title, disableUI: true)
    }
    
    func hideLoadingIndicator()
    {
        ANLoader.hide()
    }
    
    func showAlert()
    {
        
    }
}

