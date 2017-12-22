//
//  FSMeController.swift
//  FSSwift
//
//  Created by Guazi on 2017/12/2.
//  Copyright © 2017年 china. All rights reserved.
//

import UIKit

class FSMeController: FSBaseController,UITableViewDelegate,UITableViewDataSource {

    var _tableView : UITableView!
    var _list : [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        meHandleDatas()
    }
    
    func meHandleDatas() -> Void {
        _list = ["反馈","锁屏","支持","去评分","清空粘贴板"]
        meDesignViews()
    }
    
    func meDesignViews() -> Void {
        if _tableView == nil {
            navigationItem.title = "我"
            let bbi = UIBarButtonItem.init(title: "设置", style: .plain, target: self, action: #selector(setAction))
            bbi.tintColor = AppColor_Red
            navigationItem.rightBarButtonItem = bbi
            
            _tableView = UITableView.init(frame: CGRect.zero, style: .plain)
            _tableView.delegate = self
            _tableView.dataSource = self
            _tableView.rowHeight = 60
            _tableView.tableFooterView = UIView()
            _tableView.backgroundColor = UIColor.clear
            view.addSubview(_tableView)
            _tableView.translatesAutoresizingMaskIntoConstraints = false
            
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[_tableView]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["_tableView":_tableView]))
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[_tableView]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["_tableView":_tableView]))
        }
    }
    
    @objc func setAction() -> Void {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = _list[indexPath.row] as String
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
