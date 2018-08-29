//
//  TabBarController.swift
//  ObninskName
//
//  Created by Artyom Vlasov on 23.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTabBar() {
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = Constants.colorWhite
    }
    
    func setupControllers() {
        let news = NavigationController(rootViewController: NewsTableController())
        let notice = NavigationController(rootViewController: NoticeController())
        news.tabBarItem = UITabBarItem(title: Constants.newsTitle, image: #imageLiteral(resourceName: "news_icon"), tag: 0)
        notice.tabBarItem = UITabBarItem(title: Constants.noticeTitle, image: #imageLiteral(resourceName: "notice_icon"), tag: 1)
        viewControllers = [news, notice]
    }
}
