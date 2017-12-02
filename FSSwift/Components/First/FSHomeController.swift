//
//  FSHomeController.swift
//  FSSwift
//
//  Created by Guazi on 2017/12/2.
//  Copyright © 2017年 china. All rights reserved.
//

import UIKit

class FSHomeController: FSBaseController {
    
    var _first : Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        homeDesignViews()
    }
    
    func homeDesignViews() -> Void {
        if _first == true {
            _first = false
            navigationItem.title = "中国"
            let leftBBI = UIBarButtonItem.init(title: "转移", style: .plain, target: self, action: #selector(leftBBIAction))
            navigationItem.leftBarButtonItem = leftBBI
            let rightBBI = UIBarButtonItem.init(title: "文件", style: .plain, target: self, action: #selector(rightBBIAction))
            navigationItem.rightBarButtonItem = rightBBI
            
            
        }
    }

    @objc func leftBBIAction() -> Void{
    
    }
    
    @objc func rightBBIAction() -> Void{
        let password = "密码"
        let diary = "日记"
        let contact = "通讯录"
        let database = "数据库"
        let number = NSNumber(value: Int8(UIAlertActionStyle.default.rawValue))
        let dNumber = NSNumber(value: Int8(UIAlertActionStyle.destructive.rawValue))
        
        FSKit.alert(controller: self, style: .actionSheet, title: "导出文件", message: "请把数据导出到安全的渠道，注意防止泄露", subjects: [password,diary,contact,database], styles: [number,number,number,dNumber], handler: { (action) in
                let text = action.title
                if text == password {

                }else if text == diary {

                }else if text == contact {

                }else if text == database {

                }
                FSKit.showAlert(msg: text!, controller: self)
        })
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
