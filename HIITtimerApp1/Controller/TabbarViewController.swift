//
//  TabbarViewController.swift
//  HIITtimerApp1
//
//  Created by Keita Arai on 2020/05/29.
//  Copyright © 2020 Keita Arai. All rights reserved.
//

import UIKit


class TabbarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
            
        case 1: print("home")
            
        case 2: print("timer")
            
        case 3: print("set")
            
        default: break
            
        }
    }
    
    
}


