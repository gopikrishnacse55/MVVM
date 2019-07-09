//
//  AddSourceTableViewController.swift
//  Practical MVVM
//
//  Created by Gopi Krishna Kasireddy on 7/8/19.
//  Copyright © 2019 Gopi Krishna Kasireddy. All rights reserved.
//

import UIKit

class AddSourceTableViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    var addSourceClosure :(SourceViewModel,UIViewController) -> () = { _,_ in }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Add Source"
        
        let close =  UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleClose(sender :)))
        self.navigationItem.leftBarButtonItem = close
        
        let save =  UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSave(sender : )))
        self.navigationItem.rightBarButtonItem = save
    }
    @objc func handleClose(sender : UIBarButtonItem)
    {
        self.showAlert(withTitle: "Alert", message: "Are you want to close") {
            self.dismiss(animated: true, completion: nil)
        }
    }

    @objc func handleSave(sender : UIBarButtonItem)
    {
        let sourceViewModel = SourceViewModel(name:self.titleField.text!, description: "Cricket news")
        self.addSourceClosure(sourceViewModel,self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
