//
//  MainViewController.swift
//  testTask
//
//  Created by Artem Manyshev on 18.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    var tableView: UITableView?
    let sections = Sections().sectionsArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        guard let tableView = tableView else { return }
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor
            )
        ])
        navigationController?.navigationBar.clipsToBounds = true
        tableView.register(SectionTableViewCell.self, forCellReuseIdentifier: "sectionCell")
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as? SectionTableViewCell else { return UITableViewCell() }
        cell.sectionData = sections[indexPath.row]
        cell.tableViewCellIndex = indexPath.row
        cell.cellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.height / 3.0
    }
}

extension MainViewController: CollectionViewCellDelegate {
    
    func collectionView(collectionviewcell: UICollectionViewCell?, index: Int, didTappedInTableViewCell: TableViewCell) {
        print("tapped \(index) and tableViewCell \(didTappedInTableViewCell.tableViewCellIndex)")
    }
}
