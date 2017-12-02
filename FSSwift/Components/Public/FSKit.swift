//
//  FSKit.swift
//  FSSwift
//
//  Created by Guazi on 2017/12/2.
//  Copyright © 2017年 china. All rights reserved.
//

import UIKit

class FSKit: NSObject {
    
    open class func rgbColor(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
        let color = UIColor.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
        return color
    }

}
