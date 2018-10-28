//
//  ViewController.swift
//  Animations
//
//  Created by Dmitrii Ivanov on 11/10/2018.
//  Copyright © 2018 DI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var displaylink: CADisplayLink!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    // MARK: - Privat
    private func setupViews() {
        let regularLabel = setupLabel(text: "Regular", topViewAnchor: view.safeAreaLayoutGuide.topAnchor)
        let regularView = setupAnimationView(type: .regular, topViewAnchor: regularLabel.bottomAnchor)

        let unstableLabel = setupLabel(text: "Unstable calculation", topViewAnchor: regularView.bottomAnchor)
        let unstableView = setupAnimationView(type: .unstableCalculation, topViewAnchor: unstableLabel.bottomAnchor)
        
        let heavyLabel = setupLabel(text: "Heavy calculation", topViewAnchor: unstableView.bottomAnchor)
        let _ = setupAnimationView(type: .heavyCalculation, topViewAnchor: heavyLabel.bottomAnchor)
    }

    private func setupLabel(text: String, topViewAnchor: NSLayoutYAxisAnchor) -> UILabel {
        let label = UILabel(forAutoLayout: ())
        label.text = text
        view.addSubview(label)
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        label.topAnchor.constraint(equalTo: topViewAnchor, constant: 40).isActive = true
        return label
    }

    private func setupAnimationView(type: ViewType, topViewAnchor: NSLayoutYAxisAnchor) -> UIView {
        let animationView = AnimationView(type: type)
        view.addSubview(animationView)
        animationView.topAnchor.constraint(equalTo: topViewAnchor, constant: 10).isActive = true
        animationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        animationView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return animationView
    }
}

