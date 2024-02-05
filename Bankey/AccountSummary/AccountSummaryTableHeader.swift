//
//  AccountSummaryTableHeader.swift
//  Bankey
//
//  Created by Vinicios Wentz on 31/01/24.
//

import UIKit

class AccountSummaryTableHeader: UIView {
    let horizontalStack = UIStackView()
    let verticalUIView = UIView()
    let verticalStack = UIStackView()
    let appNameLabel = UILabel()
    let welcomeLabel = UILabel()
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let imageView = UIImageView()
    let shakeyBellView = ShakeyBellView()
    
    struct ViewModel {
        let welcomeMessage: String
        let name: String
        let date: Date
        
        var dateFormated: String {
            return date.monthDayYearString
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not benn implemented")
    }
}

extension AccountSummaryTableHeader {
    private func style() {
        backgroundColor = .systemTeal
        
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.text = "Bankey"
        appNameLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Good morning,"
        welcomeLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "name surname"
        nameLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = "Date"
        dateLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .top
        horizontalStack.distribution = .fill
        
        verticalStack.axis = .vertical
        verticalStack.spacing = 4
        verticalStack.alignment = .fill
        verticalStack.distribution = .fill
        
        let sfConfig = UIImage.SymbolConfiguration(pointSize: 100)
        let image = UIImage(systemName: "sun.max.fill", withConfiguration: sfConfig)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        
    }
    
    private func layout() {
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalUIView.translatesAutoresizingMaskIntoConstraints = false
        shakeyBellView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(shakeyBellView)
        
        verticalStack.addArrangedSubview(appNameLabel)
        verticalStack.addArrangedSubview(welcomeLabel)
        verticalStack.addArrangedSubview(nameLabel)
        verticalStack.addArrangedSubview(dateLabel)
        verticalUIView.addSubview(verticalStack)
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: verticalUIView.topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: verticalUIView.leadingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: verticalUIView.bottomAnchor),

        ])
        
        horizontalStack.addArrangedSubview(verticalUIView)
        horizontalStack.addArrangedSubview(imageView)
        addSubview(horizontalStack)
        
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: horizontalStack.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: horizontalStack.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            shakeyBellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shakeyBellView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension AccountSummaryTableHeader {
    func configure(viewModel: ViewModel) {
        welcomeLabel.text = viewModel.welcomeMessage
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.dateFormated
    }
}
