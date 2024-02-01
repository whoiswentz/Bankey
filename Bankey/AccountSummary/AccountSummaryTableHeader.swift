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
    
    let label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bankey"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    let label2: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Good morning,"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    let label3: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "name surname"
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    let label4: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date"
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    let imageView = UIImageView()
    
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
        
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .top
        horizontalStack.distribution = .fill
        
        verticalStack.axis = .vertical
        verticalStack.spacing = 4
        verticalStack.alignment = .fill
        verticalStack.distribution = .fill
        
        let image = UIImage(systemName: "sun.max.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        
    }
    
    private func layout() {
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalUIView.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStack.addArrangedSubview(label)
        verticalStack.addArrangedSubview(label2)
        verticalStack.addArrangedSubview(label3)
        verticalStack.addArrangedSubview(label4)
        verticalUIView.addSubview(verticalStack)
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: verticalUIView.topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: verticalUIView.leadingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: verticalUIView.bottomAnchor),

        ])
        
        horizontalStack.addArrangedSubview(verticalUIView)
//        horizontalStack.addArrangedSubview(imageView)
        addSubview(horizontalStack)

        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
