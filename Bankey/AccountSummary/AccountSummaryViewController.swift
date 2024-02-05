//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Vinicios Wentz on 31/01/24.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    var profile: Profile?
    var accounts: [Account] = []
    
    var tableView = UITableView()
    var accountCellViewModels: [AccountSummaryCell.ViewModel] = []
    
    lazy var logoutBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        button.tintColor = .label
        return button
    }()
    
    lazy var frameWidth = self.view.frame.width
    lazy var header = AccountSummaryTableHeader(frame: CGRect(x: 0, y: 0, width: frameWidth, height: 144))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
        delegates()
        dataSources()
        setupNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.tableHeaderView = header
        header.layoutIfNeeded()
    }
}

extension AccountSummaryViewController {
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = logoutBarButton
    }
    
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
        
        fetchAndLoadViews()
    }
        
    private func configureTableHeaderView(with profile: Profile) {
        let vm = AccountSummaryTableHeader.ViewModel(welcomeMessage: "Good Morning", name: profile.firstName, date: Date())
        header.configure(viewModel: vm)
    }
    
    private func configureTableCells(with accounts: [Account]) {
        accountCellViewModels = accounts.map {
            AccountSummaryCell.ViewModel(accountType: $0.type, accountName: $0.name, balance: $0.amount)
        }
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accountCellViewModels.isEmpty else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseIdentifier, for: indexPath) as? AccountSummaryCell else {
            return UITableViewCell()
        }
        cell.configure(with: accountCellViewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountCellViewModels.count
    }
}

extension AccountSummaryViewController {
    @objc func logoutTapped(sender: UIButton) {
        NotificationCenter.default.post(name: .logout, object: nil)
    }
}

extension AccountSummaryViewController {
    private func fetchAndLoadViews() {
        fetchProfile(forUserId: "1") { result in
            switch result {
            case .success(let profile):
                self.profile = profile
                self.configureTableHeaderView(with: profile)
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        fetchAccounts(forUserId: "1") { result in
            switch result {
            case .success(let accounts):
                self.accounts = accounts
                self.configureTableCells(with: accounts)
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
