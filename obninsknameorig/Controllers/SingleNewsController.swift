//
//  SingleNewsController.swift
//  ObninskName
//
//  Created by Artyom Vlasov on 23.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import UIKit

class SingleNewsController: UIViewController {
    var news: NewsModel = NewsModel()
    var server = ServerRequest()
    let systemBarHeight = UIApplication.shared.statusBarFrame.height
    
    var scrollView: UIScrollView = {
        var view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.contentSize.width = UIScreen.main.bounds.width
        view.contentSize.height = 2000
        view.autoresizingMask = UIViewAutoresizing.flexibleHeight
        view.backgroundColor = UIColor.white
        return view
    }()

    var imageDot: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = #imageLiteral(resourceName: "oval")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var postImage: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    var timeView: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: Constants.SFMedium, size: 15)
        view.textColor = Constants.colorGray
        view.numberOfLines = 0
        return view
    }()
    
    var categoryView: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Constants.colorGray
        view.numberOfLines = 0
        view.font = UIFont(name: Constants.SFMedium, size: 15)
        return view
    }()
    
    var titleView: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.textColor = Constants.colorBlack
        view.font = UIFont(name: Constants.SFSemibold, size: 21)
        return view
    }()

    var subTitle: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor.black
        view.numberOfLines = 0
        view.font = UIFont(name: Constants.SFRegular, size: 15)
        return view
    }()

    var pubEvaluation: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "bckgrnd")
        view.layer.cornerRadius = 8
        return view
    }()

    var evaluateText: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Constants.colorBlack
        view.font = UIFont(name: Constants.SFSemibold, size: 17)
        view.text = Constants.evalPublicate
        return view
    }()

    var likeImage: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = #imageLiteral(resourceName: "like")
        view.contentMode = .scaleAspectFit
        view.tintColor = Constants.tintColorGray
        return view
    }()

    var dislikeImage: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = #imageLiteral(resourceName: "dislike")
        view.contentMode = .scaleAspectFit
        view.tintColor = Constants.tintColorGray
        return view
    }()

    var dislikes: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: Constants.SFSemibold, size: 17)
        return view
    }()

    var likes: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: Constants.SFSemibold, size: 17)
        return view
    }()

    var authorTitle: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Constants.colorBlack
        view.font = UIFont(name: Constants.SFRegular, size: 17)
        view.text = Constants.publicAuthor
        return view
    }()

    var authorName: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Constants.colorBlack
        view.font = UIFont(name: Constants.SFMedium, size: 17)
        return view
    }()

    var viewersImage: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = #imageLiteral(resourceName: "views")
        view.contentMode = .scaleAspectFit
        return view
    }()

    var viewers: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Constants.colorBlack
        view.font = UIFont(name: Constants.SFMedium, size: 17)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setupConstraints()
        addContent()
    }
    
    func addViews() {
        let bar = self.navigationController?.navigationBar
        self.view.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.addSubview(postImage)
        scrollView.addSubview(subTitle)
        scrollView.addSubview(timeView)
        scrollView.addSubview(categoryView)
        scrollView.addSubview(titleView)
        scrollView.addSubview(imageDot)
        scrollView.addSubview(pubEvaluation)
        pubEvaluation.addSubview(evaluateText)
        pubEvaluation.addSubview(likes)
        pubEvaluation.addSubview(likeImage)
        pubEvaluation.addSubview(dislikes)
        pubEvaluation.addSubview(dislikeImage)
        scrollView.addSubview(authorTitle)
        scrollView.addSubview(authorName)
        scrollView.addSubview(viewersImage)
        scrollView.addSubview(viewers)
        bar?.tintColor = UIColor.white
        bar?.setBackgroundImage(UIImage(), for: .default)
        bar?.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back_icon"), style: .plain, target: self, action: #selector(self.btnBackClicked))
    }
    
    func setupConstraints() {
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        postImage.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: -44 - systemBarHeight).isActive = true
        postImage.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        postImage.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        postImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.73).isActive = true

        timeView.leftAnchor.constraint(equalTo: self.postImage.leftAnchor, constant: 16).isActive = true
        timeView.topAnchor.constraint(equalTo: self.postImage.bottomAnchor, constant: 16).isActive = true
        timeView.rightAnchor.constraint(equalTo: self.imageDot.leftAnchor, constant: -8).isActive = true

        imageDot.rightAnchor.constraint(equalTo: self.categoryView.leftAnchor).isActive = true
        imageDot.leftAnchor.constraint(equalTo: self.timeView.rightAnchor).isActive = true
        imageDot.rightAnchor.constraint(equalTo: self.categoryView.leftAnchor, constant: -8).isActive = true
        imageDot.widthAnchor.constraint(equalToConstant: 4).isActive = true
        imageDot.centerYAnchor.constraint(equalTo: self.timeView.centerYAnchor).isActive = true

        categoryView.topAnchor.constraint(equalTo: self.timeView.topAnchor).isActive = true
        categoryView.leftAnchor.constraint(equalTo: self.imageDot.rightAnchor).isActive = true

        titleView.leftAnchor.constraint(equalTo: self.timeView.leftAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: self.timeView.bottomAnchor, constant: 12).isActive = true
        titleView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
 
        subTitle.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 16).isActive = true
        subTitle.rightAnchor.constraint(equalTo: self.titleView.rightAnchor).isActive = true
        subTitle.leftAnchor.constraint(equalTo: self.titleView.leftAnchor).isActive = true

        pubEvaluation.topAnchor.constraint(equalTo: self.subTitle.bottomAnchor, constant: 0).isActive = true
        pubEvaluation.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        pubEvaluation.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        pubEvaluation.heightAnchor.constraint(equalToConstant: 102).isActive = true

        evaluateText.topAnchor.constraint(equalTo: self.pubEvaluation.topAnchor, constant: 20).isActive = true
        evaluateText.centerXAnchor.constraint(equalTo: self.pubEvaluation.centerXAnchor).isActive = true

        likes.topAnchor.constraint(equalTo: self.evaluateText.bottomAnchor).isActive = true
        likes.centerXAnchor.constraint(equalTo: self.pubEvaluation.centerXAnchor, constant: -26).isActive = true
        likes.centerYAnchor.constraint(equalTo: likeImage.centerYAnchor).isActive = true

        likeImage.topAnchor.constraint(equalTo: self.evaluateText.bottomAnchor, constant: 16).isActive = true
        likeImage.rightAnchor.constraint(equalTo: self.likes.leftAnchor, constant: -12).isActive = true
        likeImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        likeImage.tintColor = Constants.tintColorGray

        dislikes.topAnchor.constraint(equalTo: self.likes.topAnchor).isActive = true
        dislikes.centerXAnchor.constraint(equalTo: self.pubEvaluation.centerXAnchor, constant: 26).isActive = true
        dislikes.centerYAnchor.constraint(equalTo: self.dislikeImage.centerYAnchor).isActive = true

        dislikeImage.topAnchor.constraint(equalTo: self.evaluateText.bottomAnchor, constant: 16).isActive = true
        dislikeImage.leftAnchor.constraint(equalTo: self.dislikes.rightAnchor, constant: 12).isActive = true
        dislikeImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        dislikeImage.tintColor = Constants.tintColorGray

        authorTitle.topAnchor.constraint(equalTo: self.pubEvaluation.bottomAnchor, constant: 20).isActive = true
        authorTitle.leftAnchor.constraint(equalTo: self.pubEvaluation.leftAnchor).isActive = true

        authorName.topAnchor.constraint(equalTo: self.authorTitle.bottomAnchor).isActive = true
        authorName.leftAnchor.constraint(equalTo: self.authorTitle.leftAnchor).isActive = true

        viewers.rightAnchor.constraint(equalTo: self.pubEvaluation.rightAnchor).isActive = true
        viewers.bottomAnchor.constraint(equalTo: self.authorName.bottomAnchor).isActive = true

        viewersImage.rightAnchor.constraint(equalTo: self.viewers.leftAnchor, constant: -12).isActive = true
        viewersImage.centerYAnchor.constraint(equalTo: self.viewers.centerYAnchor).isActive = true

    }
    
    func addContent() {
        server.getImage(img: news.images?.original, view: postImage)
        timeView.text = server.dateDef(post: Date(timeIntervalSince1970: news.date!))
        categoryView.text = news.tag
        titleView.text = news.title
        subTitle.text = news.text?.html2String
        likes.text = news.plus
        dislikes.text = news.minus
        authorName.text = news.author
        viewers.text = news.reviewCount
    }
    
    @objc func btnBackClicked() {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SingleNewsController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y/(UIScreen.main.bounds.width * 0.73 - (44 + systemBarHeight)*2)
        //print(offset)
        let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
        let bar = self.navigationController?.navigationBar
        if offset > 1 {
            offset = 1
            bar?.tintColor = UIColor(hue: 213/360, saturation: 82/100, brightness: 64/100, alpha: 1)
            bar?.backgroundColor = color
            UIApplication.shared.statusBarView?.backgroundColor = color
        } else {
            bar?.tintColor = UIColor(hue: 213/360, saturation: 82/100*offset, brightness: 1 - 0.36*offset, alpha: 1)
            bar?.backgroundColor = color
            UIApplication.shared.statusBarView?.backgroundColor = color
            
        }
    }
}
