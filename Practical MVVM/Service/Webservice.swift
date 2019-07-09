//
//  Webservice.swift
//  Practical MVVM
//
//  Created by Gopi Krishna Kasireddy on 7/4/19.
//  Copyright © 2019 Gopi Krishna Kasireddy. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:Any]

class Webservice {
    
    private let sourcesURL = URL(string: "https://newsapi.org/v2/sources?apiKey=0cf790498275413a9247f8b94b3843fd")!
    
    
    func loadSources(completion :@escaping ([Source]) -> ()) {
        
//     Utilities.sharedInstance.showLoadingIndicator(title: "Loading...")
        
        URLSession.shared.dataTask(with: sourcesURL) { data, _, _ in
            
//            Utilities.sharedInstance.hideLoadingIndicator()
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let sourceDictionary = json as! JSONDictionary
                let dictionaries = sourceDictionary["sources"] as! [JSONDictionary]
                
                let sources = dictionaries.compactMap(Source.init)
                
                DispatchQueue.main.async {
                    completion(sources)
                }
            }
            
            }.resume()
        
    }
    
    func loadHeadlinesByCourse(source :Source, completion :@escaping ([Headline]) -> ()) {
        
//        print(source.id)
        
        let urlString = "https://newsapi.org/v2/top-headlines?sources=\((source.id)!)&apiKey=0cf790498275413a9247f8b94b3843fd"
        
        let articlesBySourceURL = URL(string: urlString)!
        
//        Utilities.sharedInstance.showLoadingIndicator(title: "Loading...")
        
        URLSession.shared.dataTask(with: articlesBySourceURL) { data, _, _ in
            
//            Utilities.sharedInstance.hideLoadingIndicator()
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let result = json as! JSONDictionary
                let dictionaries = result["articles"] as! [JSONDictionary]
                
                let headlines = dictionaries.compactMap(Headline.init)
                
                DispatchQueue.main.async {
                    completion(headlines)
                }
                
            }
            
            }.resume()
        
    }
    
    
}

