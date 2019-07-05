//
//  SourceDetailsTableViewController.swift
//  Practical MVVM
//
//  Created by Gopi Krishna Kasireddy on 7/4/19.
//  Copyright © 2019 Gopi Krishna Kasireddy. All rights reserved.
//

import UIKit

class SourceDetailsTableViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var newsSourceModel : SourceViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Source Details"
        
        self.nameLabel.text = String("Name is \(self.newsSourceModel.name)")
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
