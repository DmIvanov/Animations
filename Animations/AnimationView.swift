//
//  AnimationView.swift
//  Animations
//
//  Created by Dmitrii Ivanov on 11/10/2018.
//  Copyright © 2018 DI. All rights reserved.
//

import UIKit

class AnimationView: UIView {

    var alayer: AnimationLayer!

    init(type: ViewType) {
        super.init(frame: CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.alayer = AnimationLayer(type: type)
        layer.addSublayer(alayer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        alayer.frame = bounds
    }
}


enum ViewType {
    
    case regular
    case heavyCalculation
    case unstableCalculation

    func doCalculationIfNeeded(link: CADisplayLink) {
        switch self {
        case .heavyCalculation:
            doHeavyCalculation(link: link)
        case .unstableCalculation:
            if Int.random(in: 1...3) % 3 == 0 {
                doHeavyCalculation(link: link)
            }
        default:
            return
        }
    }

    private func doHeavyCalculation(link: CADisplayLink) {
        var sqrtSum = 0.0
        NSLog("calculation started")
        var logged = false
        for i in 0 ..< 400_000 {
            sqrtSum += sqrt(Double(i))
            if (CACurrentMediaTime() >= link.targetTimestamp) {
                if !logged {
                    NSLog("\t took longer than 1 frame")
                    logged = true
                }
            }
        }
        NSLog("\t\t calculation finished")
    }
}
