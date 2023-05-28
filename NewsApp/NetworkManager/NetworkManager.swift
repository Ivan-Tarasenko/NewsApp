//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Иван Тарасенко on 28.05.2023.
//

import Foundation
import Moya

enum NewsEnum {
    enum news: TargetType {
        
        case newsUrl
        
        var baseURL: URL {
            guard let url = URL(string: "https://newsapi.org/v2") else { fatalError() }
            return url
            
        }
        
        var topic: String {
            return NewsEnum.news.topicValue
        }
        
        static var topicValue = "Russia"
       
        static func setTestValue(_ newValue: String) {
            topicValue = newValue
        }
        
        var path: String {
            switch self {
            case .newsUrl:
                return "/everything"
            }
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Moya.Task {
            switch self {
            case .newsUrl:
                return .requestParameters(parameters: ["q": NewsEnum.news.topicValue, "apiKey": APIKey.key], encoding: URLEncoding.queryString)
            }
        }
        
        var headers: [String: String]? {
            return nil
        }
        
    }
}
