//
//  ViewController.swift
//  NewsApp
//
//  Created by Иван Тарасенко on 29.04.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, ConstraintRelatableTarget {
    
    private var dataSource: TableViewDataSource
    private var delegate: TableViewDelegate
    
    private let tableView = UITableView()
    
    // MARK: - Lifecycle
    init(dataSourse: TableViewDataSource, delegate: TableViewDelegate) {
        self.dataSource = dataSourse
        self.delegate = delegate
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        addedConstraints()
    }
}

// MARK: - Private methods
private extension ViewController {
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    func addedConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(self.view)
        }
    }
}
