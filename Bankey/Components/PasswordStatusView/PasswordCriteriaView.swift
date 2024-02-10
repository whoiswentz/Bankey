//
//  PasswordCriteriaView.swift
//  Bankey
//
//  Created by Vinicios Wentz on 08/02/24.
//

import UIKit

class PasswordCriteriaView: UIView {
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    
    let checkmarkImage = UIImage(systemName: "checkmark.circle")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
    let xmarkImage = UIImage(systemName: "xmark.circle")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
    let circleImage = UIImage(systemName: "circle")?.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
    
    var isCriteriaMet: Bool = false {
        didSet {
            if isCriteriaMet {
                imageView.image = checkmarkImage
            } else {
                imageView.image = xmarkImage
            }
        }
    }
    
    init(text: String) {
        super.init(frame: .zero)
            
        imageView.image = UIImage(systemName: "circle")?.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
        label.text = text
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension PasswordCriteriaView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
    }
    
    private func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        addSubview(stackView)
        
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }
}

extension PasswordCriteriaView {
    func reset() {
        isCriteriaMet = false
        imageView.image = circleImage
    }
}
