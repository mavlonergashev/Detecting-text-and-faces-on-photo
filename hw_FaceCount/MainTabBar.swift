//
//  MainTabBar.swift
//  hw_FaceCount
//
//  Created by Mavlon on 29/03/22.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let vc1 = TextPhotoVC(nibName: "TextPhotoVC", bundle: nil)
        let navVC1 = UINavigationController(rootViewController: vc1)
        let tabBarItem1 = UITabBarItem(title: "Detect Text", image: UIImage(systemName: "pencil"), selectedImage: nil)
        navVC1.tabBarItem = tabBarItem1
        
        let vc2 = FaceCountVC(nibName: "FaceCountVC", bundle: nil)
        let navVC2 = UINavigationController(rootViewController: vc2)
        let tabBarItem2 = UITabBarItem(title: "Detect Face", image: UIImage(systemName: "person"), selectedImage: nil)
        navVC2.tabBarItem = tabBarItem2

        viewControllers = [navVC1,navVC2]
        
    }
    

}
