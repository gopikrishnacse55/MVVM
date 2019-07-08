//
//  Headline.swift
//  Practical MVVM
//
//  Created by Gopi Krishna Kasireddy on 7/8/19.
//  Copyright © 2019 Gopi Krishna Kasireddy. All rights reserved.
//

import Foundation

class Headline {
    
    var title :String!
    var description :String!
    
    init?(dictionary :JSONDictionary) {
        
        guard let title = dictionary["title"] as? String,
            let description = dictionary["description"] as? String else {
                return nil
        }
        
        self.title = title
        self.description = description
    }
}
