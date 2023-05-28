//
//  TableViewDelegate.swift
//  NewsApp
//
//  Created by Иван Тарасенко on 26.05.2023.
//

import UIKit

final class TableViewDelegate: NSObject, UITableViewDelegate {
    
    var onScrollAction: (() -> Void)?
    
    var isEndOfList: Bool = false
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
         if scrollView.contentOffset.y + scrollView.frame.height >= scrollView.contentSize.height {
             if !isEndOfList {
                 onScrollAction?()
                 isEndOfList = true
             }
         }
     }
}
