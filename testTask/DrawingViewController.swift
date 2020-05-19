//
//  DrawingViewController.swift
//  testTask
//
//  Created by Artem Manyshev on 19.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {
    
    var sectionIndex: Int?
    var pictureIndex: Int?
    var drowingImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let sections = Sections().sectionsArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(drowingImage)
        guard let sectionIndex = sectionIndex,
            let pictureIndex = pictureIndex else { return }
        NSLayoutConstraint.activate([
            drowingImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            drowingImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            drowingImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            drowingImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        drowingImage.image = UIImage(named: sections[sectionIndex].cellsPictures[pictureIndex])
    }
}
