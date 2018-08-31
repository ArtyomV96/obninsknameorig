//
//  DayNewsTableController.swift
//  ObninskName
//
//  Created by Artyom Vlasov on 27.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DayNewsTableController: UITableViewController {
    
    var news: [NewsModel] = []
    var server = ServerRequest()
    var date: String?
    var skip = 0
    var limit = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        getNews(url: "\(Constants.newsURL)&limit=\(limit)&skip=\(skip)&date=\(date!)")
        print("\(Constants.newsURL)&limit=\(limit)&skip=\(skip)&date=\(date!))")
        setupTableView()
    }
    
    func setupTableView() {
        self.navigationItem.title = date!
        self.tableView.register(NewsViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 104
        self.tableView.reloadData()
    }
    
    func getNews(url: String) {
        guard URL(string: url) != nil else { return }
        Alamofire.request(url).responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print(json)
                for item in json.arrayValue {
                    print(item)
                    if item != JSON.null {
                        if !item["image"].isEmpty {
                            var images = item["image"].arrayValue[0]
                            let singleNews = NewsModel(id: item["id"].stringValue, date: item["date"].doubleValue, text: item["text"].stringValue, author: item["author"].stringValue,
                                                       tag: item["tag"].stringValue, title: item["title"].stringValue, images: Images(small: images["small"].stringValue, original: images["original"].stringValue), plus: item["plus"].stringValue, minus: item["minus"].stringValue, reviewCount: item["review_count"].stringValue)
                            self.news.append(singleNews)
                        }
                    } else {
                        print("nil")
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            print(self.news.count)
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
        return news.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let singleNewsController = SingleNewsController()
        let singleNews = UINavigationController(rootViewController: singleNewsController)
        singleNewsController.news = news[indexPath.row + 1]
        present(singleNews, animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row  == news.count - 2{   // when scrolling down, if our limit meets index path run
            skip = skip + 20               // adds '5' to skip
            getNews(url: "\(Constants.newsURL)&limit=\(limit)&skip=\(skip)&date=\(String(describing: date))")         // runs above method
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsViewCell
        let singleNews = news[indexPath.row]
        cell.title.text = singleNews.title
        cell.time.text = server.dateDef(post: Date(timeIntervalSince1970: singleNews.date!))
        server.getImage(img: singleNews.images?.small, view: cell.postImage)
        return cell
    }

}
