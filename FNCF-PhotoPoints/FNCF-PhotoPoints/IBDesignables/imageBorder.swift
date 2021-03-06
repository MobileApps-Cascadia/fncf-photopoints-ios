//
//  imageBorder.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 10/11/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import UIKit

class imageBorder: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet {
           self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }

}
