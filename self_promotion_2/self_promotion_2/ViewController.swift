//
//  ViewController.swift
//  self_promotion_2
//
//  Created by ryota-ko on 2015/10/13.
//  Copyright © 2015年 ryota-ko. All rights reserved.
//

import UIKit
import PagingMenuController

class ViewController: UIViewController,SideMenuDelegate, PagingMenuControllerDelegate {

    var sideMenu: SideMenu?
    let options = PagingMenuOptions()
    var pagingMenuController: PagingMenuController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenu = SideMenu(sourceView: self.view, menuData: ["概要","自己紹介", "これまでの自分", "これからの自分","まとめ"])
        sideMenu!.delegate = self
        
        storyboardSet()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func storyboardSet(index: Int = 0){
        
        let selfFirstViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SelfFirstViewController") as! FirstViewController
        let selfSecondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SelfSecondViewController") as! SecondViewController
        
        let nowFirstViewController = self.storyboard?.instantiateViewControllerWithIdentifier("NowFirstViewController") as! FirstViewController
        let nowSecondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("NowSecondViewController") as! SecondViewController
        
        
        let selfViewControllers = [selfFirstViewController, selfSecondViewController]
        let nowViewControllers = [nowFirstViewController, nowSecondViewController]
        let viewControllers = [selfViewControllers, nowViewControllers]
        
        pagingMenuController = self.childViewControllers.first as? PagingMenuController
        
        options.menuHeight = 60
        options.menuDisplayMode = .Standard(widthMode: .Flexible, centerItem: true, scrollingMode: .PagingEnabled)
        pagingMenuController!.setup(viewControllers: viewControllers[index], options: options)
        
    }
    
    func sideMenuDidSelectItemAtIndex(index: Int) {
        sideMenu?.toggleMenu()
        storyboardSet(index)
        
    }
    
    @IBAction func toggleSideMenu(sender: AnyObject) {
        sideMenu?.toggleMenu()
    }

}

