//
//  Article.swift
//  NewsApp
//
//  Created by Artem Samolyga on 2/4/23.
//

import Foundation

struct Article {
    var url: String
    var author: String
    var title: String
    var publishedAt: String
    var urlToImage: String
    var description: String
    var sourceName: String
    
    init(dictionary: Dictionary<String, Any>) {
        url = dictionary["url"] as? String ?? "url nil"
        author = dictionary["author"] as? String ?? "author nil"
        title = dictionary["title"] as? String ?? "title nil"
        publishedAt = dictionary["publishedAt"] as? String ?? "publishedAt nil"
        urlToImage = dictionary["urlToImage"] as? String ?? "urlToImage nil"
        description = dictionary["description"] as? String ?? "description nil"
        
        sourceName = (dictionary["source"] as? Dictionary<String, Any> ?? ["":""])["name"] as? String ?? "source nil"
    }
}
