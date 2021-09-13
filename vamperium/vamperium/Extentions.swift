//
//  Extentions.swift
//  vamphelper
//
//  Created by goktan on 1.09.2021.
//  Copyright © 2021 goktan. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
