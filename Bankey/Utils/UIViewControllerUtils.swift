//
//  UIViewControllerUtils.swift
//  Bankey
//
//  Created by Vinicios Wentz on 31/01/24.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
        guard let statusBarSize = view.window?.windowScene?.statusBarManager?.statusBarFrame.size else { return }
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusBarView = UIView(frame: frame)
        statusBarView.backgroundColor = .systemTeal
        view.addSubview(statusBarView)
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
