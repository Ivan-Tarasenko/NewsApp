//
//  TableViewCell.swift
//  NewsApp
//
//  Created by Иван Тарасенко on 26.05.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class TableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    private let imageNews: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let titleNews: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
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

// MARK: - Public methods
extension TableViewCell {
    func setTitle(text: String) {
        titleNews.text = text
    }
    
    func setImage(url: String) {
        let url = URL(string: url)
        imageNews.kf.setImage(with: url) { result in
            switch result {
            case .failure:
                self.imageNews.image = UIImage(named: "iconApp")
            case .success:
                break
            }
        }
    }
}

// MARK: - Private methods
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
           make.trailing.equalTo(self).offset(-10)
       }
    }
}
