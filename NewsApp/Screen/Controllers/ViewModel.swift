//
//  ViewModel.swift
//  NewsApp
//
//  Created by Иван Тарасенко on 28.05.2023.
//

import Foundation
import Moya

protocol ViewModelProtocol: AnyObject {
    var onUpdataNews: (([News]) -> Void)? { get set }
    
    func searchNews(text: String)
}

final class ViewModel: ViewModelProtocol {
    
    var onUpdataNews: (([News]) -> Void)?
    
    private let requester = MoyaProvider<NewsEnum.news>()
    
    private var allNews: [News] = [] {
        didSet {
            onUpdataNews?(allNews)
        }
    }
    
    init() {
        requestApi()
    }
    
    func searchNews(text: String) {
        NewsEnum.news.setTestValue(text)
        requestApi()
    }
    
    private func requestApi() {
        requester.request(.newsUrl) { (result) in
            switch result {
            case .success(let response):
                let result = try? JSONSerialization.jsonObject(with: response.data, options: [])
                
                guard let jsonData = result as? [String: Any] else { return }
                
                let news = NewsModel(JSON: jsonData)

                if let news = news {
                    self.allNews = news.allNews
                }

            case .failure(let error):
                print("error \(error)")
                
            }
        }
    }
}
