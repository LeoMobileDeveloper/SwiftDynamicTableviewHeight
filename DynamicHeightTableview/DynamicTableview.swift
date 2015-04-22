//
//  DynamicTableview.swift
//  DynamicHeightTableview
//
//  Created by huangwenchen on 15/4/22.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

import Foundation
import UIKit
class DynamicTableviewController:UITableViewController{
    
    var titleArray = ["Author","Email","Note"]
    var subtitleArray = ["Wenchen Huang",
    "njuhwc@163.com",
        "this is a big cell.And I want to add some information to make this cell long enough.But I do not know what to say.It is 21:46,and I am a little tired.I decide to write this demo.Because, a person asked me today,and I decide to write a Demo project to show how to do it"];
    override func viewDidLoad() {
        var tblview = UIView(frame: CGRectZero)
        tblview.hidden = true
        self.tableView.tableFooterView = tblview
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        cell?.textLabel?.text = titleArray[indexPath.row];
        cell?.textLabel?.backgroundColor = UIColor.blackColor()
        cell?.detailTextLabel?.text = subtitleArray[indexPath.row]
        cell?.detailTextLabel?.backgroundColor = UIColor.blackColor()
        return cell!
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var  title = titleArray[indexPath.row] as NSString
        var titleSize = getTitleSize(title)
        var detail = subtitleArray[indexPath.row] as NSString
        var detailSize = getDetailSize(detail)
        var height = detailSize.height + titleSize.height + 30
        println(height)
        return height
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subtitleArray.count
    }
    func getTitleSize(cellTitle:NSString)->CGSize{
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        var font = cell?.textLabel?.font;
        var attribute = NSMutableDictionary()
        attribute.setObject(font!, forKey: NSFontAttributeName)
        var rect =  cellTitle.boundingRectWithSize(CGSizeMake(tableView.bounds.size.width,CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attribute as [NSObject : AnyObject], context:nil)
        return rect.size
    }
    func getDetailSize(cellDetail:NSString)->CGSize{
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        var font = UIFont.systemFontOfSize(14);
        var attribute = NSMutableDictionary()
        attribute.setObject(font, forKey: NSFontAttributeName)
        var rect = cellDetail.boundingRectWithSize(CGSizeMake(tableView.bounds.size.width,CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attribute as [NSObject : AnyObject], context:nil)
        return rect.size
    }
}