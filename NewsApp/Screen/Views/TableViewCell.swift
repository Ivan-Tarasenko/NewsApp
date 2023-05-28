//
//  TableViewCell.swift
//  NewsApp
//
//  Created by Иван Тарасенко on 26.05.2023.
//

import UIKit
import SnapKit

final class TableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    private let imageNews: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "iconApp")
        view.backgroundColor = .red
        return view
    }()
    
    private let titleNews: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = "Дохуя всяких новостей про IT"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addedConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private method
private extension TableViewCell {
    
   func addedConstraints() {
       addSubview(imageNews)
       addSubview(titleNews)
       
       imageNews.snp.makeConstraints { make in
           make.width.equalTo(120)
           make.height.equalTo(70)
           make.centerY.equalTo(self)
           make.leading.equalTo(self).offset(10)
       }
       
       titleNews.snp.makeConstraints { make in
           make.height.equalTo(70)
           make.centerY.equalTo(self)
           make.leading.equalTo(imageNews.snp_trailingMargin).offset(20)
           make.trailing.equalTo(self).offset(10)
       }
    }
}
