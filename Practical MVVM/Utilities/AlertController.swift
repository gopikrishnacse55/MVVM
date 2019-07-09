//
//  AlertController.swift
//  Practical MVVM
//
//  Created by Gopi Krishna Kasireddy on 7/9/19.
//  Copyright © 2019 Gopi Krishna Kasireddy. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    func  showAlert(withTitle:String ,message:String) -> Void {
        let alert = UIAlertController(title: withTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: UIAlertAction.Style.default,
                                      handler: {(alert: UIAlertAction!) in print("Foo")}))
        self.present(alert, animated: true, completion:nil);
    }
    
    func  showAlert(withTitle:String ,message:String,completion: (() -> Swift.Void)? = nil) -> Void {
        let alert = UIAlertController(title: withTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: UIAlertAction.Style.default,
                                      handler: {(alert: UIAlertAction!) in completion!()}))
        self.present(alert, animated: true, completion:nil);
    }
    
    
    
    
}
