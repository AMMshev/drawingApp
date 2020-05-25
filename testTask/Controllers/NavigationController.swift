//
//  NavigationController.swift
//  testTask
//
//  Created by Artem Manyshev on 21.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    let menuBarView: MenuBarView = {
        let view = MenuBarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 90.0).isActive = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        view.backgroundColor = UIColor.white
        view.addSubview(menuBarView)
        NSLayoutConstraint.activate([
            menuBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
