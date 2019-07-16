//
//  Utilities.swift
//  Practical MVVM
//
//  Created by Gopi Krishna Kasireddy on 7/9/19.
//  Copyright © 2019 Gopi Krishna Kasireddy. All rights reserved.
//

import UIKit
//import ANLoader
import Reachability
import SVProgressHUD
class Utilities: NSObject {

    class var sharedInstance : Utilities
    {
        let _sharedInstance = Utilities();
        return _sharedInstance
    }
    
//    func showLoadingIndicator(title : String) -> Void
//    {
//        ANLoader.showLoading(title, disableUI: true)
//    }
    
//    func hideLoadingIndicator()
//    {
//        ANLoader.hide()
//    }
    func checkNetwork() -> Bool
    {
        let reach = Reachability();
        
        let networkReachability = reach;
        let remoteHostStatus = networkReachability!.connection
        
        if (remoteHostStatus == .none)
        {
            return false
        }
        else
        {
            return true
        }
        
    }
    func showGlobalProgressHUD(withTitle title: String?) {
        //    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
        //    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
        //    hud.label.text = title;
        //
        SVProgressHUD.appearance().defaultStyle = SVProgressHUDStyle.custom
        SVProgressHUD.appearance().backgroundColor = UIColor.clear
        SVProgressHUD.appearance().foregroundColor = UIColor.init(red: 51/255, green: 66/255, blue: 5/255, alpha: 1.0)
        //SVProgressHUD.appearance().font = UIFont(name: "Poppins-Medium", size: 14)!
        //}
        SVProgressHUD.show(withStatus: "")
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.clear)
    }
    
    func dismissGlobalHUD() {
        //UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
        //[MBProgressHUD hideHUDForView:window animated:YES];
        SVProgressHUD.dismiss()
    }

}

