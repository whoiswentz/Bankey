//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Vinicios Wentz on 31/01/24.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    lazy var header = AccountSummaryTableHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 144))
    let tableView = UITableView()
    
    let games = ["COD", "BF", "RED"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        delegates()
        dataSources()
    }
}

extension AccountSummaryViewController {
    private func style() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
        
    private func layout() {
        tableView.tableHeaderView = header
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func delegates() {
        tableView.delegate = self
    }
    
    private func dataSources() {
        tableView.dataSource = self
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = games[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
}
