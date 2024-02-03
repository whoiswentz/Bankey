//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Vinicios Wentz on 31/01/24.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    var tableView = UITableView()
    var accounts: [AccountSummaryCell.ViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
        delegates()
        dataSources()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let header = AccountSummaryTableHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 144))
        tableView.tableHeaderView = header
        header.layoutIfNeeded()
    }
}

extension AccountSummaryViewController {
    private func style() {
        tableView.backgroundColor = .systemTeal
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
        
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseIdentifier)
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.tableFooterView = UIView()
    }
    
    private func delegates() {
        tableView.delegate = self
    }
    
    private func dataSources() {
        tableView.dataSource = self
    }
    
    private func setup() {
        fetchData()
    }
    
    private func fetchData() {
        let savings = AccountSummaryCell.ViewModel(accountType: .Banking, accountName: "Basic Savings", balance: 929466.23)
        let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard, accountName: "Visa Avion Card", balance: 929466.23)
        let investment = AccountSummaryCell.ViewModel(accountType: .Investment, accountName: "Tax-Free Saver", balance: 929466.23)
        let investment2 = AccountSummaryCell.ViewModel(accountType: .Investment, accountName: "Growth Fund", balance: 929466.23)
        
        accounts.append(savings)
        accounts.append(visa)
        accounts.append(investment)
        accounts.append(investment2)
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accounts.isEmpty else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseIdentifier, for: indexPath) as? AccountSummaryCell else {
            return UITableViewCell()
        }
        cell.configure(with: accounts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
}
