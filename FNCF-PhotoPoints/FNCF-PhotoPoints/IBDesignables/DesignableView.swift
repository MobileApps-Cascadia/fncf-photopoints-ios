//
//  DesignableView.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 5/5/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: UIView {
    
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }

}
