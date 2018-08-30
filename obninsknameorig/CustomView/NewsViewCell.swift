//
//  NewsViewCell.swift
//  ObninskName
//
//  Created by Artyom Vlasov on 23.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import UIKit

class NewsViewCell: UITableViewCell {
    
    var title: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Constants.colorBlack
        view.numberOfLines = 0
        view.font = UIFont(name: Constants.SFSemibold, size: 17)
        return view
    }()
    
    var time: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Constants.colorGray
        view.numberOfLines = 0
        view.font = UIFont(name: Constants.SFMedium, size: 13)
        return view
    }()
    
    var postImage: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupConstraints()
    }
    
    func addViews() {
        self.addSubview(title)
        self.addSubview(time)
        self.addSubview(postImage)
    }
    
    func setupConstraints() {
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        title.rightAnchor.constraint(equalTo: self.postImage.leftAnchor, constant: -16).isActive = true
        
        time.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        time.topAnchor.constraint(greaterThanOrEqualTo: self.title.bottomAnchor, constant: 8).isActive = true
        time.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        
        postImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        postImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        postImage.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -16).isActive = true
        postImage.heightAnchor.constraint(equalToConstant: 72).isActive = true
        postImage.widthAnchor.constraint(equalToConstant: 72).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

