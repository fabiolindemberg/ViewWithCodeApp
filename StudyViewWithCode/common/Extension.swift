//
//  Extension.swift
//  StudyViewWithCode
//
//  Created by Fabio Lindemberg on 11/06/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import UIKit

extension UIView {
    func setShadow(fillColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: CGFloat = 10) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 3)
        layer.masksToBounds = false

        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3
        layer.cornerRadius = cornerRadius
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }
}
