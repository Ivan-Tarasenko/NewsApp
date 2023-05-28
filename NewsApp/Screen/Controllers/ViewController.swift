//
//  ViewController.swift
//  NewsApp
//
//  Created by Иван Тарасенко on 29.04.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, ConstraintRelatableTarget, UISearchControllerDelegate {
    
    private var dataSource: TableViewDataSource
    private var delegate: TableViewDelegate
    
    private let tableView = UITableView()
    private let searchController = UISearchController()
    
    private let viewModel: ViewModelProtocol = ViewModel()
    
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
        configureSearchBar()
        configureTableView()
        addedConstraints()
        bing()
    }
}

// MARK: - Private methods
private extension ViewController {
    
    func configureSearchBar() {
        searchController.searchBar.delegate = self
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func addedConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(self.view)
        }
    }
    
    func bing() {
        viewModel.onUpdataNews = { [weak self] allNews in
            guard let self else { return }
            
            self.tableView.dataSource = self.dataSource
            self.tableView.delegate = self.delegate
            self.dataSource.allNews = allNews
            self.tableView.reloadData()
        }
    }
}

// MARK: - SearchBarDelegate
extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            viewModel.searchNews(text: searchText)
        }
        searchBar.resignFirstResponder()
    }
}
