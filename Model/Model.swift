//
//  Model.swift
//  NewsApp
//
//  Created by Artem Samolyga on 2/4/23.
// api key b5323a0038864d548125d02c464291dd
//https://newsapi.org/v2/everything?q=Apple&from=2023-02-04&sortBy=popularity&apiKey=b5323a0038864d548125d02c464291dd

import Foundation
var articles: [Article] = []

func loadNews(completionHandler: (()->Void)?) { // загрузка json и сохранение в файлах
    let url = URL(string: "https://newsapi.org/v2/everything?q=Apple&from=2023-02-04&sortBy=popularity&apiKey=b5323a0038864d548125d02c464291dd")
    let session = URLSession(configuration: .default)
    
    let downloadTask = session.downloadTask(with: url!) {  (urlFile, responce, error) in
        
        if urlFile != nil {
            
            let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json" // возвращает путь в директорию пользователя
            let urlPath = URL(fileURLWithPath: path)
            try? FileManager.default.copyItem(at: urlFile!, to: urlPath)
            parseNews()
            completionHandler?()
            print(articles.count)
            print(articles[0])
        }
    }
    downloadTask.resume()
}

func parseNews() {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath = URL(fileURLWithPath: path)
    let data = try? Data(contentsOf: urlPath)
    if data == nil {
        return
    }
    
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return
    }
    
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil {
        return
    }
    
    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
        var returnArray : [Article] = []
        
        for dict in array {
            if returnArray.count < 20 {
                let newArticle = Article(dictionary: dict)
                returnArray.append(newArticle)
            }
        }
        articles = returnArray
    }
}
