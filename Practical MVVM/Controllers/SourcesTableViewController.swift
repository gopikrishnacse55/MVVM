

import Foundation
import UIKit

class SourcesTableViewController : UIViewController,UITableViewDelegate,SourceDetailsDelegate {
 


    @IBOutlet weak var table_View: UITableView!
    private var webservice :Webservice!
    private var sourceListViewModel :SourceListViewModel!
    private var dataSource :TableViewDataSource<SourceTableViewCell,SourceViewModel>!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func updateUI() {
        
        self.title = "News"
        addPlusNavigationButton()
        self.webservice = Webservice()
        self.sourceListViewModel = SourceListViewModel(webservice: self.webservice)
        
        // setting up the bindings
        self.sourceListViewModel.bindToSourceViewModels = {
            self.updateDataSource()
        }
        
    }
    
    private func updateDataSource() {
        
        
       
        self.dataSource = TableViewDataSource(cellIdentifier: Cells.source, items: self.sourceListViewModel.sourceViewModels) { cell, vm in
            
            cell.nameLabel.text = vm.name
        }
        
        
        self.table_View.dataSource = self.dataSource
        self.dataSource.delegate = self
        self.table_View.delegate = self.dataSource
        self.table_View.reloadData()
    }
  
    func moveToSourceDetails(data: SourceViewModel) {
        
        
        // push the view controller
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : SourceDetailsTableViewController = storyboard.instantiateViewController(withIdentifier:"SourceDetailsTableViewController") as! SourceDetailsTableViewController
        vc.sourceViewModel = data
        self.navigationController?.pushViewController(vc, animated: true)
    
        // present the view controller
        
//        let storyboard : UIStoryboard  = UIStoryboard(name: "Main", bundle: nil);
//        let vc : SourceDetailsTableViewController = storyboard.instantiateViewController(withIdentifier: SegueIdentifier.showSourceDetails) as! SourceDetailsTableViewController
//        let navi = UINavigationController(rootViewController: vc);
//        self.present(navi, animated: true, completion: nil)
    
    }
  
    // add plus navigation button
    
    func addPlusNavigationButton()
    {
        let plus = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handlePlus(sender :)))
        self.navigationItem.rightBarButtonItem = plus
    }
    
    @objc func handlePlus(sender : UIBarButtonItem)
    {
        let storyboard : UIStoryboard  = UIStoryboard(name: "Main", bundle: nil);
        let vc : AddSourceTableViewController = storyboard.instantiateViewController(withIdentifier: SegueIdentifier.addSource) as! AddSourceTableViewController
        let navi = UINavigationController(rootViewController: vc);
        vc.addSourceClosure = { [unowned self] sourceVM, controller in
            
            controller.dismiss(animated: true, completion: nil)
            self.sourceListViewModel.addSource(source: sourceVM)
            print("Updated to \(self.sourceListViewModel.sourceViewModels.count)")
        }
         self.present(navi, animated: true, completion: nil)
    }
    
}
