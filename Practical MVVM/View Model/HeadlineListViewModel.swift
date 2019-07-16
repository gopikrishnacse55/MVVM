//
//  HeadlineListViewModel.swift
//  Practical MVVM
//
//  Created by Gopi Krishna Kasireddy on 7/8/19.
//  Copyright © 2019 Gopi Krishna Kasireddy. All rights reserved.
//

import Foundation

class HeadlineListViewModel {
    
    var selectedSource :SourceViewModel!
    public private(set) var headlines :[HeadlineViewModel] = [HeadlineViewModel]()
    
    init(source :SourceViewModel) {
        self.selectedSource = source
    }
    
    func populateHeadlines(completion :@escaping () -> ()) {
        
        let source = Source(viewModel :self.selectedSource)
        
//        Utilities.sharedInstance.showLoadingIndicator(title: "Loading..")
        
         Utilities.sharedInstance.showGlobalProgressHUD(withTitle: "Loading..")
        
        Webservice().loadHeadlinesByCourse(source: source) { headlines in
            
//            Utilities.sharedInstance.hideLoadingIndicator()
            
             Utilities.sharedInstance.dismissGlobalHUD()
            
            self.headlines = headlines.compactMap(HeadlineViewModel.init)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func headline(at index:Int) -> HeadlineViewModel {
        return self.headlines[index]
    }
    
}

class HeadlineViewModel {
    
    var title :String!
    var description :String!
    
    init(headline :Headline) {
        self.title = headline.title
        self.description = headline.description
    }
}
