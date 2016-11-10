//
//  Extensions.swift
//  MeBook
//
//  Created by Stanley Pan on 10/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
