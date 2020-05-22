//
//  ShopViewController.swift
//  testTask
//
//  Created by Artem Manyshev on 21.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {
    
    private let priceData = ShopData().cellDataArray
    private let headerView: HeaderView = {
        let view = HeaderView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 220.0).isActive = true
        view.closeButton.addTarget(self, action: #selector(closeButtonTapped),
                                   for: .touchUpInside)
        return view
    }()
    private var tableView: UITableView
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        tableView = UITableView()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ShopTableViewCell.self,
                           forCellReuseIdentifier: Constants.TableViewCellsID.shopCell.rawValue)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerView)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 17.0),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ShopViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        priceData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCellsID.shopCell.rawValue) as? ShopTableViewCell else { return UITableViewCell() }
        let cellData = priceData[indexPath.row]
        cell.colorCount = cellData.colorCount
        cell.setColorCountAndBonusStack(freeTask: cellData.freeTask, bonus: cellData.bonus)
        cell.setPriceAndSticker(price: cellData.price,
                                bonusTaskName: cellData.bonusTaskName,
                                stickerName: cellData.stickerName)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        85
    }
}

extension ShopViewController: ShopTableViewCellDelegate {
    func buyColor(boughtColorCount: Double) {
        let newBalance = (UserDefaults.standard.object(forKey: Constants.UserDafaultsKeys.balance.rawValue) as? Double ?? 0.0) + boughtColorCount / 1000
        UserDefaults.standard.set(newBalance,
                                  forKey: Constants.UserDafaultsKeys.balance.rawValue)
        print(boughtColorCount)
        headerView.colorCountView.colorCountLabel.text = newBalance.stringWithoutZeroFraction + " K"
    }
}
