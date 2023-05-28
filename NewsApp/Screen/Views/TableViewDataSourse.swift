//
//  TableViewDataSourse.swift
//  NewsApp
//
//  Created by Иван Тарасенко on 26.05.2023.
//

import UIKit

final class TableViewDataSource: NSObject, UITableViewDataSource {
    
    var allNews: [News]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return allNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath)
                as? TableViewCell else { fatalError("cell nil") }
        
        let news = allNews[indexPath.row]
        
        cell.setTitle(text: news.title)
        cell.setImage(url: news.urlToImage)
        return cell
    }
}
