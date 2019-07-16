//
//  DialogController.swift
//  Practical MVVM
//
//  Created by Gopi Krishna Kasireddy on 7/16/19.
//  Copyright © 2019 Gopi Krishna Kasireddy. All rights reserved.
//

import Foundation
import UIKit
import SCLAlertView
extension UIViewController
{
    func  showDialog(title : String,message : String) -> Void
    {
        SCLAlertView().showInfo(title, subTitle: message)
    }
}
