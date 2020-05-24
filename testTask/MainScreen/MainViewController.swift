//
//  MainViewController.swift
//  testTask
//
//  Created by Artem Manyshev on 18.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SectionTableViewCell.self, forCellReuseIdentifier: Constants.TableViewCellsID.sectionCell.rawValue)
        return tableView
    }()
    let sections = Sections().sectionsArray
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "EXPLORE"
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(titleLabel)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        setLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navigationController = UIApplication.shared.windows[0].rootViewController as? NavigationController
        navigationController?.menuBarView.isHidden = false
    }
    fileprivate func setLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 72),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 31),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        sections.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCellsID.sectionCell.rawValue) as? SectionTableViewCell else { return UITableViewCell() }
        cell.cellDelegate = self
        let sectionData = sections[indexPath.row]
        cell.addToCell(section: sectionData.sectionName, image: sectionData.imageName)
        cell.sectionPictures = sectionData.cellsPictures
        cell.tableViewCellIndex = indexPath.row
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        220.0
    }
}

extension MainViewController: CollectionViewCellDelegate {
    
    func collectionView(collectionviewcell: UICollectionViewCell?, collectionCellIndex: Int, didTappedInTableViewCell: SectionTableViewCell) {
        let sectionIndex = didTappedInTableViewCell.tableViewCellIndex ?? 0
        let drawingScreen = DrawingViewController(sectionIndex: sectionIndex, pictureIndex: collectionCellIndex, nibName: nil, bundle: nil)
        navigationController?.pushViewController(drawingScreen, animated: true)
    }
}
