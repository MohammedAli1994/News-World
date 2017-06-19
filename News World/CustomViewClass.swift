//
//  CustomViewClass.swift
//  News World
//
//  Created by Mohammad Husin aly on 08/06/2017.
//  Copyright © 2017 Mohammad Husin aly. All rights reserved.
//

import UIKit

@IBDesignable class CustomViewClass: UIView {

    @IBInspectable var cornerRadious : CGFloat = 0 {
        
        didSet{
            
            self.layer.cornerRadius = cornerRadious
            self.layer.masksToBounds = true
            
        }
    }
}
