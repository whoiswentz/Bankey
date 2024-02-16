//
//  PasswordResetViewController.swift
//  Bankey
//
//  Created by Vinicios Wentz on 07/02/24.
//

import UIKit

class PasswordResetViewController: UIViewController {
    let stackView = UIStackView()
    
    let newPasswordTextField = PasswordTextField(placeHolderText: "New Password")
    let confirmPasswsordTextField = PasswordTextField(placeHolderText: "Re-enter Password")
    let passwordStatusView = PasswordStatusView()
    
    let resetPasswordUIButton = UIButton(type: .system)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension PasswordResetViewController {
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordStatusView.translatesAutoresizingMaskIntoConstraints = false
        passwordStatusView.layer.cornerRadius = 5
        passwordStatusView.clipsToBounds = true
        
        confirmPasswsordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        resetPasswordUIButton.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordUIButton.configuration = .filled()
        resetPasswordUIButton.setTitle("Reset Password", for: [])
    }
    
    private func layout() {
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(passwordStatusView)
        stackView.addArrangedSubview(confirmPasswsordTextField)
        stackView.addArrangedSubview(resetPasswordUIButton)
        view.addSubview(stackView)
    
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
    }
}
