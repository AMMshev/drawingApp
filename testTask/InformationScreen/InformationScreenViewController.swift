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
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 16)
        return label
    }()
    let suggestionsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "SUGGESTIONS"
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 16)
        return label
    }()
    let namesOfTabsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.widthAnchor.constraint(equalToConstant: 175).isActive = true
        return stackView
    }()
    var collectionView: UICollectionView
    let cellsData = InformationScreenData().cellsDataArray
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumLineSpacing = 16.0
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 30, left: 30,
                                                         bottom: 10, right: 30)
        self.collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: collectionViewLayout)
        collectionView.register(InformationCollectionViewCell.self,
                                forCellWithReuseIdentifier: Constants.CollectionViewCellsID.informationCell.rawValue)
        namesOfTabsStack.addArrangedSubview(infoLabel)
        namesOfTabsStack.addArrangedSubview(suggestionsLabel)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        collectionView.delegate = self
        collectionView.dataSource = self
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
            namesOfTabsStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 74),
            collectionView.topAnchor.constraint(equalTo: namesOfTabsStack.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InformationScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellsData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewCellsID.informationCell.rawValue, for: indexPath) as? InformationCollectionViewCell else { return UICollectionViewCell() }
        let cellData = cellsData[indexPath.item]
        cell.setCellsData(imageName: cellData.imageName, labelText: cellData.labelText)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize = collectionView.bounds.size
        return CGSize(width: (collectionViewSize.width - 76) / 2, height: (collectionViewSize.width - 76) / 2)
    }
}
