//
//  InformationScreenViewController.swift
//  testTask
//
//  Created by Artem Manyshev on 21.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class InformationScreenViewController: UIViewController {
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "INFO"
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 16.0)
        return label
    }()
    let suggestionsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "SUGGESTIONS"
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 16.0)
        return label
    }()
    let namesOfTabsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.widthAnchor.constraint(equalToConstant: 175.0).isActive = true
        return stackView
    }()
    var collectionView: InformationCollectionView
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumLineSpacing = 16.0
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 30.0, left: 30.0,
                                                         bottom: 10.0, right: 30.0)
        self.collectionView = InformationCollectionView(frame: .zero,
                                               collectionViewLayout: collectionViewLayout)
        namesOfTabsStack.addArrangedSubview(infoLabel)
        namesOfTabsStack.addArrangedSubview(suggestionsLabel)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navigationController = UIApplication.shared.windows[0].rootViewController as? NavigationController
        navigationController?.menuBarView.isHidden = false
    }
    fileprivate func setupSubviews() {
        view.addSubview(namesOfTabsStack)
        view.addSubview(collectionView)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            namesOfTabsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            namesOfTabsStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 74.0),
            collectionView.topAnchor.constraint(equalTo: namesOfTabsStack.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90.0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
