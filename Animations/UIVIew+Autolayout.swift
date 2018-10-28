//
//  UIVIew+Autolayout.swift
//  Animations
//
//  Created by Dmitrii Ivanov on 27/10/2018.
//  Copyright © 2018 DI. All rights reserved.
//

import UIKit


extension UIView {

    convenience init(forAutoLayout: ()) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
    }
}
