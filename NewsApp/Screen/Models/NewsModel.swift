//
//  NewsModel.swift
//  NewsApp
//
//  Created by Иван Тарасенко on 28.05.2023.
//

import Foundation
import ObjectMapper

class NewsModel: Mappable {
    
    var allNews: [News] = []
    
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: Map) {
        allNews <- map["articles"]
    }
}

class News: Mappable {
    
    var title: String = ""
    var urlToImage: String = ""
    
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        title <- map["title"]
        urlToImage <- map["urlToImage"]
    }
    
}
