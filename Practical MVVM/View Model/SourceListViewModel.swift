import Foundation
import UIKit
class SourceListViewModel : NSObject {
    
    @objc dynamic private(set) var sourceViewModels :[SourceViewModel] = [SourceViewModel]()
    private var token :NSKeyValueObservation?
    var bindToSourceViewModels :(() -> ()) = {  }
    private var webservice :Webservice
    
    init(webservice :Webservice) {
        
        self.webservice = webservice
        super.init()
        
        token = self.observe(\.sourceViewModels) { _,_ in
            self.bindToSourceViewModels()
        }
        
        // call populate sources
        populateSources()
    }
    
    func invalidateObservers() {
        self.token?.invalidate()
    }
    
    func populateSources() {
        
//        if(Utilities.sharedInstance.checkNetwork())
//        {
//            Utilities.sharedInstance.showLoadingIndicator(title: "Loading..")
            Utilities.sharedInstance.showGlobalProgressHUD(withTitle: "Loading..")
            self.webservice.loadSources { [unowned self] sources in
//                Utilities.sharedInstance.hideLoadingIndicator()
                Utilities.sharedInstance.dismissGlobalHUD()
                self.sourceViewModels = sources.compactMap(SourceViewModel.init)
            }
//        }
//        else
//        {
//            print("Check your network connection")
//        }
    }
    
    func addSource(source: SourceViewModel) {
        self.sourceViewModels.append(source)
    }
    
    func source(at index:Int) -> SourceViewModel {
        return self.sourceViewModels[index]
    }
}

class SourceViewModel : NSObject {
    
    var id :String?
    var name :String
    var body :String
    
    init(name :String, description: String) {
        self.name = name
        self.body = description
    }
    
    init(source :Source) {
        
        self.id = source.id
        self.name = source.name
        self.body = source.description
    }
}



