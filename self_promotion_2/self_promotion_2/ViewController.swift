//
//  ViewController.swift
//  self_promotion_2
//
//  Created by ryota-ko on 2015/10/13.
//  Copyright © 2015年 ryota-ko. All rights reserved.
//

import UIKit

class ViewController: UIViewController,SideMenuDelegate {

    var sideMenu : SideMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenu = SideMenu(sourceView: self.view, menuData: ["概要","自己紹介", "これまでの自分", "これからの自分","まとめ"])
        sideMenu!.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func sideMenuDidSelectItemAtIndex(index: Int) {
        sideMenu?.toggleMenu()
    }
    
    @IBAction func toggleSideMenu(sender: AnyObject) {
        sideMenu?.toggleMenu()
    }

}

