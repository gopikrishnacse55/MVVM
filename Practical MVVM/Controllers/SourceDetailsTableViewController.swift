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
    private var indexPaths : IndexPathClass!
    private var dataSource :TableViewDataSource<HeadlineTableViewCell,HeadlineViewModel,IndexPathClass>!
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
//            self.dataSource = TableViewDataSource(cellIdentifier: Cells.headline, items: self.headlineListViewModel.headlines) { cell, vm in
//
//                cell.titleLabel.text = vm.title
//                cell.descriptionLabel.text = vm.description
//            }
            
            self.dataSource = TableViewDataSource(cellIdentifier: Cells.headline, items: self.headlineListViewModel.headlines, configureCell: { (cell, vm, index) in
                
                cell.titleLabel.text = vm.title
                cell.descriptionLabel.text = vm.description
                cell.details_btn.addTarget(self, action: #selector(self.handleDetails(sender : )), for: .touchUpInside)
                cell.details_btn.tag = index.row
            })
            
            self.table_View.dataSource = self.dataSource
            self.table_View.delegate = self.dataSource
            self.table_View.reloadData()
        }
    }
    @objc func handleDetails(sender : UIButton)
    {
        print(sender.tag)
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
