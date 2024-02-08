//
//  PasswordTextField.swift
//  Bankey
//
//  Created by Vinicios Wentz on 07/02/24.
//

import UIKit

class PasswordTextField: UIView {
    let lockImageView = UIImageView(image: UIImage(systemName: "lock.fill"))
    let passwordTextField = UITextField()
    let showPasswordButton = UIButton(type: .custom)
    let dividerView = UIView()
    let errorLabel = UILabel()
    
    private let placeHolderText: String
    
    init(placeHolderText: String) {
        self.placeHolderText = placeHolderText
        
        super.init(frame: .zero)
        
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

extension PasswordTextField {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = placeHolderText
//        passwordTextField.delegate = self
        passwordTextField.keyboardType = .asciiCapable
        passwordTextField.attributedPlaceholder = NSAttributedString(string: placeHolderText, attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel
        ])
        
        showPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        showPasswordButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
        showPasswordButton.setImage(UIImage(systemName: "eye.slash.circle"), for: .selected)
        showPasswordButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .separator
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        errorLabel.textColor = UIColor.systemRed
        errorLabel.text = "Enter you new password"
        errorLabel.numberOfLines = 0
        errorLabel.isHidden = false
        errorLabel.lineBreakMode = .byWordWrapping
    }
    
    func layout() {
        addSubview(lockImageView)
        addSubview(passwordTextField)
        addSubview(showPasswordButton)
        addSubview(dividerView)
        addSubview(errorLabel)
        
        lockImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        passwordTextField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        showPasswordButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            lockImageView.centerYAnchor.constraint(equalTo: lockImageView.centerYAnchor),
            lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: topAnchor),
            passwordTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: lockImageView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            showPasswordButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            showPasswordButton.leadingAnchor.constraint(equalToSystemSpacingAfter: passwordTextField.trailingAnchor, multiplier: 1),
            showPasswordButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: passwordTextField.bottomAnchor, multiplier: 1),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            errorLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 4)
        ])
    }
}

// MARK: Actions
extension PasswordTextField {
    @objc private func togglePasswordView(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        showPasswordButton.isSelected.toggle()
    }
}
