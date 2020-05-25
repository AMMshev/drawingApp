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
    private let boostersData = ShopData().boostersData
    private let headerView: ShopHeaderView = {
        let view = ShopHeaderView()
        view.closeButton.addTarget(self, action: #selector(closeButtonTapped),
                                   for: .touchUpInside)
        return view
    }()
    private var tableView = ShopTableView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
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
        boostersData.forEach({
            headerView.productsPriceView.addToStack(productImage: $0.boosterImageName,
                                                    priceCount: $0.boosterPrice)})
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
        cell.addToStack(freeTask: cellData.freeTask, bonus: cellData.bonus)
        cell.addToCell(price: cellData.price, bonusTask: cellData.bonusTaskName,
                       sticker: cellData.stickerName)
        cell.delegate = self
        cell.parantVCDelegate = self.presentingViewController?.children.last as? DrawingViewController
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        85.0
    }
}

extension ShopViewController: ShopTableViewCellDelegate {
    func buyColor(boughtColorCount: Double) {
        let newBalance = (UserDefaults.standard.object(forKey: Constants.UserDafaultsKeys.balance.rawValue) as? Double ?? 0.0) + boughtColorCount
        UserDefaults.standard.set(newBalance,
                                  forKey: Constants.UserDafaultsKeys.balance.rawValue)
        headerView.colorCountView.setColorCount(value: newBalance)
    }
}
