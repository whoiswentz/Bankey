//
//  LoginView.swift
//  Bankey
//
//  Created by Vinicio Wentz on 26/01/24.
//

import Foundation
import UIKit

class LoginView: UIView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .orange
    }
    
    private func layout() {
        
    }
}
