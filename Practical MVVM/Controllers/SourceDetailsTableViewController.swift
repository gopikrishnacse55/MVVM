//
//  SourceDetailsTableViewController.swift
//  Practical MVVM
//
//  Created by Gopi Krishna Kasireddy on 7/4/19.
//  Copyright © 2019 Gopi Krishna Kasireddy. All rights reserved.
//

import UIKit

class SourceDetailsTableViewController: UIViewController {

    @IBOutlet weak var table_View: UITableView!
    var sourceViewModel :SourceViewModel!
    private var headlineListViewModel :HeadlineListViewModel!
    private var dataSource :TableViewDataSource<HeadlineTableViewCell,HeadlineViewModel>!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       updateUI()
        
    }
    private func updateUI() {
        
        self.title = self.sourceViewModel.name
        self.headlineListViewModel = HeadlineListViewModel(source :sourceViewModel)
        
        self.headlineListViewModel.populateHeadlines {
            
            // setup the data source here
            self.dataSource = TableViewDataSource(cellIdentifier: Cells.headline, items: self.headlineListViewModel.headlines) { cell, vm in
                
                cell.titleLabel.text = vm.title
                cell.descriptionLabel.text = vm.description
            }
            
            self.table_View.dataSource = self.dataSource
            self.table_View.delegate = self.dataSource
            self.table_View.reloadData()
        }
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
