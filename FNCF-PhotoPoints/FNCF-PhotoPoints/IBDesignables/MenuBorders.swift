//
//  MenuBorders.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 10/10/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import UIKit

@IBDesignable
class MenuBorders: UIButton {

    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
}
