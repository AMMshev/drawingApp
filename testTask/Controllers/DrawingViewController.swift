//
//  DrawingViewController.swift
//  testTask
//
//  Created by Artem Manyshev on 19.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {
    
    let greenBrownBlueRedPaths = ColorsPathsGreenBrownBlueRed()
    let grayLightbluePaths = ColorsPathsGrayLightBlue()
    var currentColor: Constants.DrawingColorNames?
    let sections = Sections().sectionsArray
    let colors = ColorsForPicture().colors
    var sectionIndex: Int
    var pictureIndex: Int
    let drawingView: DrawingView = {
        let view = DrawingView()
        view.heightAnchor.constraint(equalToConstant: 400).isActive = true
        return view
    }()
    let pinchGesture = UIPinchGestureRecognizer()
    let panGesture = UIPanGestureRecognizer()
    var settingsMenuIsHidden = true
    let backButton: DrawingScreenBackButton = {
        let button = DrawingScreenBackButton()
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    let settingsView: SettingsView = {
        let view = SettingsView()
        view.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    var settingsViewHeight = NSLayoutConstraint()
    let pickedImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }()
    let colorCountView: ColorCountView = {
        let view = ColorCountView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    let addColorCountButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.ImageNames.DrowingScreen.addColorCount.rawValue), for: .normal)
        button.addTarget(self, action: #selector(addColorButtonTapped), for: .touchUpInside)
        return button
    }()
    var trainingVC = TrainingViewController()
    var choisingColorView = ChoisingColorView()
    let ananasBusterButton: BoosterButton = {
        let button = BoosterButton()
        button.chooseBooster(type: .ananas)
        return button
    }()
    let wandBusterButton: BoosterButton = {
        let button = BoosterButton()
        button.chooseBooster(type: .wand)
        return button
    }()
    let loupeBusterButton: BoosterButton = {
        let button = BoosterButton()
        button.chooseBooster(type: .loupe)
        return button
    }()
    
    init(sectionIndex: Int, pictureIndex: Int, nibName nibNameOrNil: String?,
         bundle nibBundleOrNil: Bundle?) {
        self.sectionIndex = sectionIndex
        self.pictureIndex = pictureIndex
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = .white
        setupTrainingVC()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubiews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navigationController = UIApplication.shared.windows[0].rootViewController as? NavigationController
        navigationController?.menuBarView.isHidden = true
    }
}

extension DrawingViewController {
    @objc func pinchGesture(sender: UIPinchGestureRecognizer) {
        guard let zoomView = sender.view else { return }
        if (sender.state == .began || sender.state == .changed) && zoomView.transform.d >= 0.9 {
            zoomView.transform = zoomView.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1
            if zoomView.transform.d < 0.9 {
                zoomView.transform.d = 0.9
                zoomView.transform.a = 0.9
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let point = touches.first?.location(in: drawingView) else { return }
        fillSegment(at: point, with: currentColor)
        choisingColorView.collectionView?.reloadData()
    }
    
    @objc func panGesture(sender: UIPanGestureRecognizer) {
        guard let movableView = sender.view else { return }
        let translation = sender.translation(in: sender.view?.superview)
        if sender.state == .began || sender.state == .changed {
            movableView.center = CGPoint(x: movableView.center.x + translation.x, y: movableView.center.y + translation.y)
            sender.setTranslation(.zero, in: sender.view?.superview)
        }
    }
    fileprivate func setupTrainingVC() {
        trainingVC.delegate = self
        addChild(trainingVC)
        view.addSubview(trainingVC.view)
        trainingVC.didMove(toParent: self)
    }
    fileprivate func setupSubiews() {
        view.addSubview(pickedImage)
        view.addSubview(backButton)
        view.addSubview(settingsView)
        view.addSubview(colorCountView)
        view.addSubview(drawingView)
        view.addSubview(choisingColorView)
        view.addSubview(ananasBusterButton)
        view.addSubview(wandBusterButton)
        view.addSubview(loupeBusterButton)
        choisingColorView.collectionView?.dataSource = self
        choisingColorView.collectionView?.delegate = self
        pinchGesture.addTarget(self, action: #selector(pinchGesture(sender:)))
        panGesture.addTarget(self, action: #selector(panGesture(sender:)))
        drawingView.addGestureRecognizer(pinchGesture)
        drawingView.addGestureRecognizer(panGesture)
        colorCountView.addToStack(element: addColorCountButton)
        settingsView.settingsGeneralButton.addTarget(self, action: #selector(settingsButtonTapped),
                                                     for: .touchUpInside)
        settingsViewHeight = settingsView.heightAnchor.constraint(equalToConstant: 50)
        NSLayoutConstraint.activate([
            settingsViewHeight,
            pickedImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickedImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            settingsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            settingsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            colorCountView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorCountView.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            drawingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            drawingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            drawingView.widthAnchor.constraint(equalToConstant: 400),
            choisingColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            choisingColorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            choisingColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                        constant: 25),
            choisingColorView.heightAnchor.constraint(equalToConstant: 50),
            ananasBusterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            ananasBusterButton.bottomAnchor.constraint(equalTo: choisingColorView.topAnchor,
                                                       constant: -15),
            loupeBusterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                        constant: -15),
            loupeBusterButton.bottomAnchor.constraint(equalTo: choisingColorView.topAnchor,
                                                      constant: -15),
            wandBusterButton.trailingAnchor.constraint(equalTo: loupeBusterButton.leadingAnchor,
                                                       constant: -15),
            wandBusterButton.bottomAnchor.constraint(equalTo: choisingColorView.topAnchor,
                                                     constant: -15)
        ])
        pickedImage.image = UIImage(named: sections[sectionIndex].cellsPictures[pictureIndex])
        wandBusterButton.addTarget(self, action: #selector(wandBoosterButtonTapped), for: .touchUpInside)
    }
    @objc func wandBoosterButtonTapped() {
        guard let currentColor = currentColor else { return }
        fillAllSegment(of: currentColor)
        choisingColorView.collectionView?.reloadData()
    }
    @objc fileprivate func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    @objc fileprivate func settingsButtonTapped() {
        switch settingsMenuIsHidden {
        case true:
            resizeSettingsMenu(to: 150, hideViews: false)
        case false:
            resizeSettingsMenu(to: 50, hideViews: true)
        }
        settingsMenuIsHidden = !settingsMenuIsHidden
    }
    fileprivate func resizeSettingsMenu(to height: CGFloat, hideViews: Bool) {
        settingsViewHeight.constant = height
        switch hideViews {
        case true:
            settingsView.settingsGeneralButton.setImage(UIImage(named: Constants.ImageNames.DrowingScreen.settingsInactive.rawValue), for: .normal)
        case false:
            settingsView.settingsGeneralButton.setImage(UIImage(named: Constants.ImageNames.DrowingScreen.settingsActive.rawValue), for: .normal)
        }
        settingsView.hideButton()
//        settingsView.settingsAudioButton.isHidden = hideViews
//        settingsView.settingsVibrantButton.isHidden = hideViews
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    fileprivate func fillSegment(at path: CGPoint, with color: Constants.DrawingColorNames?) {
        guard let color = color else { return }
        sourcePathsArray(with: color).forEach({
            if $0().contains(path) {
                drawingView.checkIsSegmentColoredAndAdd(segment: $0(), with: color)
            }
        })
    }
    fileprivate func fillAllSegment(of color: Constants.DrawingColorNames) {
        drawingView.fillAll(segments: sourcePathsArray(with: color), of: color)
    }
    fileprivate func sourcePathsArray(with color: Constants.DrawingColorNames) ->
        [() -> UIBezierPath] {
            switch color {
            case .gray:
                return grayLightbluePaths.grayColorPaths
            case .lightBlue:
                return grayLightbluePaths.lightBlueColorPaths
            case .green:
                return greenBrownBlueRedPaths.greenColorPaths
            case .brown:
                return greenBrownBlueRedPaths.brownColorPaths
            case .blue:
                return greenBrownBlueRedPaths.blueColorPaths
            case .red:
                return greenBrownBlueRedPaths.redColorPaths
            }
    }
    @objc fileprivate func addColorButtonTapped() {
        let shopVC = ShopViewController(nibName: nil, bundle: nil)
        present(shopVC, animated: true, completion: nil)
    }
}

extension DrawingViewController: TrainingViewCellDelegate {
    func hideTraining(onLeftSide: Bool) {
        var xTranslation = UIScreen.main.bounds.width
        if onLeftSide == false {
            xTranslation *= -1
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.trainingVC.view.transform = CGAffineTransform(translationX: xTranslation, y: 0)
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.trainingVC.willMove(toParent: nil)
                self.trainingVC.view.removeFromSuperview()
                self.trainingVC.removeFromParent()
            }
        }
    }
}
extension DrawingViewController: ShopTableViewCellDelegate {
    func buyColor(boughtColorCount: Double) {
        let newBalance = (UserDefaults.standard.object(forKey: Constants.UserDafaultsKeys.balance.rawValue) as? Double ?? 0.0)
        colorCountView.setColorCount(value: newBalance)
    }
}
extension DrawingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewCellsID.choisingColorCell.rawValue, for: indexPath) as? ChoisingColorCollectionViewCell else { return UICollectionViewCell() }
        let segmentColor = colors[indexPath.item]
        cell.colorNumerLabel.text = String(indexPath.item + 1)
        cell.segmentColor = segmentColor
        cell.partOfColoredSegments = CGFloat(drawingView.countOfSegmentsArray(with: segmentColor)) / CGFloat(sourcePathsArray(with: segmentColor).count)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentColor = colors[indexPath.item]
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
}
