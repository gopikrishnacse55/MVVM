//
//  TableViewDataSource.swift
//  Practical MVVM
//
//  Created by Gopi Krishna Kasireddy on 7/4/19.
//  Copyright © 2019 Gopi Krishna Kasireddy. All rights reserved.
//


import Foundation
import UIKit
protocol SourceDetailsDelegate{
    func moveToSourceDetails(data : SourceViewModel )
}
class TableViewDataSource<Cell :UITableViewCell,ViewModel> : NSObject, UITableViewDataSource,UITableViewDelegate {
    
    private var cellIdentifier :String!
    private var items :[ViewModel]!
    var delegate: SourceDetailsDelegate?
    var configureCell :(Cell,ViewModel) -> ()
    init(cellIdentifier :String, items :[ViewModel], configureCell: @escaping (Cell,ViewModel) -> ()) {
        
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! Cell
        let item = self.items[indexPath.row]
        self.configureCell(cell,item)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(cellIdentifier == Cells.source)
        {
            return 50
        }
        else
        {
            return 80
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if(cellIdentifier == Cells.source)
        {
            let model = self.items[indexPath.row] as! SourceViewModel
            delegate?.moveToSourceDetails(data: model)
        }
    }
}
