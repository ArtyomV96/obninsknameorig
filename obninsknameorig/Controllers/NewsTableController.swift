//
//  NewsTableController.swift
//  ObninskName
//
//  Created by Artyom Vlasov on 23.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class NewsTableController: UITableViewController {

    var news: [NewsModel] = []
    var tags: [TagsModel] = []
    var headerView = MainNewsView()
    var server = ServerRequest()
    var skip = 0
    var limit = 20
    
    override func viewDidLoad() {
        getNews()
        getTags()
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("didappear")
    }
    
    func setupTableView() {
        self.tableView = UITableView(frame: CGRect.zero, style: .grouped)
        self.navigationItem.titleView = Constants.navBarView
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "calendar"), style: .plain, target: self, action: #selector(self.btnCalendarClicked))
        self.tableView.register(NewsViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 104
        self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        self.tableView.estimatedSectionHeaderHeight = 306;
        self.tableView.reloadData()
    }
    
    @objc func btnCalendarClicked() {
        print("tap")
        let datePicker = BottomDatePicker()
    
        
        let window = UIApplication.shared.keyWindow
        window?.addSubview(datePicker)
    }
    
    func toDayNews(selectedDate: String) {
        let dayNews = DayNewsTableController()
        let newsVC = NavigationController(rootViewController: dayNews)
     //   showDetailViewController(day, sender: <#T##Any?#>)
        present(newsVC, animated: true, completion: nil)
    }
    
    
    func getNews() {
        guard URL(string: "\(Constants.newsURL)&limit=\(limit)&skip=\(skip)") != nil else { return }
        Alamofire.request("\(Constants.newsURL)&limit=\(limit)&skip=\(skip)").responseJSON(completionHandler: { (response) in
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

    func getTags() {
        guard URL(string: "\(Constants.tagsUrl)") != nil else { return }
        Alamofire.request("\(Constants.tagsUrl)").responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print(json)
                for item in json.arrayValue {
                    print(item)
                    if item != JSON.null {
                        let tags = TagsModel(tagID: item["tagID"].stringValue, tag: item["tag"].stringValue)
                        self.headerView.tags.append(tags)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
           // print(self.headerView.tags.count)
            self.headerView.collectionView.reloadData()
    })
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row  == news.count - 2{   // when scrolling down, if our limit meets index path run
            skip = skip + 20               // adds '5' to skip
            getNews()         // runs above method
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count - 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsViewCell
        let singleNews = news[indexPath.row + 1]
        cell.title.text = singleNews.title
        cell.time.text = server.dateDef(post: Date(timeIntervalSince1970: singleNews.date!))
        server.getImage(img: singleNews.images?.small, view: cell.postImage)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if news.count > 0 {
            let singleNews = news[0]
            headerView.title.text = singleNews.title
            headerView.subTitle.text = singleNews.text?.html2String
            headerView.time.text = server.dateDef(post: Date(timeIntervalSince1970: singleNews.date!))
            server.getImage(img: singleNews.images?.original, view: headerView.postImage)
        
        }
        return headerView
    }
    
    func reformatTime(time: Double) -> String {
        let date = NSDate(timeIntervalSince1970: time)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd.MMM.YYYY"
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let singleNewsController = SingleNewsController()
        let singleNews = UINavigationController(rootViewController: singleNewsController)
        singleNewsController.news = news[indexPath.row + 1]
        present(singleNews, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let action = UITapGestureRecognizer(target: self, action:  #selector (self.headerAction(_:)))
        view.addGestureRecognizer(action)
    }
    
    @objc func headerAction(_ sender:UITapGestureRecognizer){
        print("tapped")
        let singleNewsController = SingleNewsController()
        let singleNews = UINavigationController(rootViewController: singleNewsController)
        singleNewsController.news = news[0]
        showDetailViewController(singleNews, sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
