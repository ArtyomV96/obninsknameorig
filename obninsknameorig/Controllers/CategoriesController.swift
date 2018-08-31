//
//  CategoriesController.swift
//  obninsknameorig
//
//  Created by Artyom Vlasov on 30.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CategoriesController: UITableViewController {

    var categories:[TagsModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getTags()
        self.navigationItem.title = Constants.newsTitle
        let bar = self.navigationController?.navigationBar
        bar?.tintColor = Constants.colorBlue
        bar?.setBackgroundImage(UIImage(), for: .default)
        bar?.shadowImage = UIImage()
        bar?.backgroundColor = Constants.colorWhite
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back_icon"), style: .plain, target: self, action: #selector(self.btnBackClicked))
        self.tableView.register(CategoryCell.self, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 104
        UIApplication.shared.statusBarView?.backgroundColor = Constants.colorWhite
    }
    
    @objc func btnBackClicked() {
        dismiss(animated: true, completion: nil)
    }

    func getTags() {
        guard URL(string: "\(Constants.tagsUrl)") != nil else { return }
        Alamofire.request("\(Constants.tagsUrl)").responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                self.categories.append(TagsModel(tagID: "01", tag: "Все новости"))
                self.categories.append(TagsModel(tagID: "02", tag: "Свежее"))
                let json = JSON(value)
                //print(json)
                for item in json.arrayValue {
                    print(item)
                    if item != JSON.null {
                        let tags = TagsModel(tagID: item["tagID"].stringValue, tag: item["tag"].stringValue)
                        self.categories.append(tags)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            // print(self.headerView.tags.count)
            self.tableView.reloadData()

        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryCell
        cell.categoryView.text = categories[indexPath.row].tag
        return cell
    }
}
