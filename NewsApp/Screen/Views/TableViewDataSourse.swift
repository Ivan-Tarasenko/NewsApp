//
//  TableViewDataSourse.swift
//  NewsApp
//
//  Created by Иван Тарасенко on 26.05.2023.
//

import UIKit

final class TableViewDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath)
                as? TableViewCell else { fatalError("cell nil") }
        
        return cell
    }
}
