//
//  MenuTableViewController.swift
//  self_promotion_2
//
//  Created by ryota-ko on 2015/10/13.
//  Copyright © 2015年 ryota-ko. All rights reserved.
//

import Foundation
import UIKit
import PagingMenuController

protocol MenuTableViewControllerDelegate {
    func menuControllerDidSelectRow(indexPath:NSIndexPath)
}

class MenuTableViewController: UITableViewController {
    
    var delegate : MenuTableViewControllerDelegate?
    var tableData : Array<String> = []
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL")
        
        if cell == nil{
        cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL")
        cell!.backgroundColor = UIColor.clearColor()
        cell!.textLabel!.textColor = UIColor.darkGrayColor()
        let selectedBackgroundView = UIView(frame: CGRectMake(0, 0, cell!.frame.size.width, cell!.frame.size.height))
        selectedBackgroundView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
        cell!.selectedBackgroundView = selectedBackgroundView
        }
        
        cell!.textLabel!.text = tableData[indexPath.row]
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.menuControllerDidSelectRow(indexPath)
        
    }
}