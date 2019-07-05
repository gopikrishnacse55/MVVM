//
//  Source.swift
//  Practical MVVM
//
//  Created by Gopi Krishna Kasireddy on 7/4/19.
//  Copyright © 2019 Gopi Krishna Kasireddy. All rights reserved.
//

class Source {
    
    var id :String!
    var name :String!
    var description :String!
    
    init?(dictionary :JSONDictionary) {
        
        guard let id = dictionary["id"] as? String,
            let name = dictionary["name"] as? String,
            let description = dictionary["description"] as? String else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.description = description
    }
    
    init(viewModel :SourceViewModel) {
        
        self.id = viewModel.id
        self.name = viewModel.name
        self.description = viewModel.body
    }
    
}
