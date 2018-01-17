//
//  customView.swift
//  MasterDetail
//
//  Created by Anhdzai on 1/10/18.
//  Copyright © 2018 Anhdzai. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.tag = Int(newValue)
            layer.cornerRadius = self.tag == -1 ? (frame.width / 2) : CGFloat(self.tag)
            clipsToBounds = true
//            layer.borderWidth = 2.0
//            layer.borderColor = UIColor.white.cgColor
        }
        get {
            return CGFloat(self.tag)
        }
    }
}
