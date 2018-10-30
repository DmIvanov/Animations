//
//  AnimationLayer.swift
//  Animations
//
//  Created by Dmitrii Ivanov on 11/10/2018.
//  Copyright © 2018 DI. All rights reserved.
//

import UIKit

class AnimationLayer: CALayer {

    // MARK: - Properties
    let type: ViewType

    var displaylink: CADisplayLink!

    var x: CGFloat = 0

    var firstColor = UIColor.red.cgColor
    var secondColor = UIColor.yellow.cgColor


    // MARK: - Lifecycle
    init(type: ViewType) {
        self.type = type
        super.init()

        DispatchQueue.global().async {
            self.displaylink = CADisplayLink(target: self, selector: #selector(self.linkTriggered))
            self.displaylink.add(to: .current, forMode: .default)
            RunLoop.current.run()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(in ctx: CGContext) {
        ctx.setFillColor(firstColor)
        let rect1 = CGRect(x: 0, y: 0, width: x, height: bounds.size.height)
        ctx.fill(rect1)
        ctx.stroke(rect1)

        ctx.setFillColor(secondColor)
        let rect2 = CGRect(x: x, y: 0, width: bounds.size.width - x, height: bounds.size.height)
        ctx.fill(rect2)
        ctx.stroke(rect2)
    }


    // MARK: - Public

    // MARK: - Private

    @objc func linkTriggered(displaylink: CADisplayLink) {
        x += 1
        if x >= bounds.size.width {
            x = 0
            let col = secondColor
            secondColor = firstColor
            firstColor = col
        }
        type.doCalculationIfNeeded(link: displaylink)
        DispatchQueue.main.async { [weak self] in
            self?.setNeedsDisplay()
        }
        NSLog("type: \(type), x: \(x)")
    }
}
