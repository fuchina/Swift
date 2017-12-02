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
    
    open class func showAlert(msg:String? = nil,controller:UIViewController? = nil) -> Void {
        let alert = alertController(style: .alert, title: "提示", message: msg, actionTitles: nil, styles: nil, cancelTitle: "确定")
        controller?.present(alert, animated: true, completion: nil)
    }
    
    open class func alert(controller:UIViewController,style:UIAlertControllerStyle,title:String?,message:String?,subjects:[String],styles:[NSNumber],handler:((UIAlertAction) -> Swift.Void)? = nil) -> Void {
        let alert = alertController(style: style, title: title, message: message, actionTitles: subjects, styles: styles, handler: handler, cancelTitle: "取消", cancel: nil)
        controller.present(alert, animated: true, completion: nil)
    }
    
    open class func alertController(style:UIAlertControllerStyle,title:String?,message:String?,actionTitles:[String]? = nil,styles:[NSNumber]? = nil,handler:((UIAlertAction) -> Swift.Void)? = nil,cancelTitle:String,cancel:((UIAlertAction) -> Swift.Void)? = nil) -> UIAlertController {
        var count = 0;
        if actionTitles != nil && styles != nil {
            count = min(actionTitles!.count, styles!.count)
        }
        let controller = UIAlertController(title: title, message: message, preferredStyle: style)
        if count > 0 {
            for x in 0...count - 1 {
                let aType = styles![x]
                let actionType = UIAlertActionStyle(rawValue: Int(truncating: aType ))!
                let action = UIAlertAction(title: actionTitles?[x], style: actionType, handler: { (action) in
                    if handler != nil {
                        handler!(action)
                    }
                })
                controller.addAction(action)
            }
        }
        
        let archAction = UIAlertAction(title: cancelTitle, style: .cancel) { (action) in
            if cancel != nil {
                cancel!(action)
            }
        }
        controller.addAction(archAction)
        return controller;
    }
}
