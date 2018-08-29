//
//  MainNewsView.swift
//  ObninskName
//
//  Created by Artyom Vlasov on 23.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import UIKit

class MainNewsView: UIView {
    
    var postImage: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    var title: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Constants.colorBlack
        view.numberOfLines = 0
        view.font = UIFont(name: Constants.SFSemibold, size: 17)
        return view
    }()
    
    var subTitle: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Constants.colorBlack
        view.numberOfLines = 3
        view.font = UIFont(name: Constants.SFRegular, size: 15)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Constants.colorWhite
        addViews()
        setupConstraints()

    }
    
    func addViews() {
        self.addSubview(postImage)
        self.addSubview(title)
        self.addSubview(subTitle)
        self.addSubview(time)
    }
    
    func setupConstraints() {
        let screenWidth = UIScreen.main.bounds.width - 32

        postImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        postImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        postImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        postImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        postImage.heightAnchor.constraint(equalToConstant: screenWidth/2).isActive = true
        postImage.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        
        title.topAnchor.constraint(equalTo: self.postImage.bottomAnchor, constant: 16).isActive = true
        title.leftAnchor.constraint(equalTo: self.postImage.leftAnchor).isActive = true
        title.rightAnchor.constraint(equalTo: self.postImage.rightAnchor).isActive = true
        
        subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 16).isActive = true
        subTitle.rightAnchor.constraint(equalTo: self.title.rightAnchor).isActive = true
        subTitle.leftAnchor.constraint(equalTo: self.title.leftAnchor).isActive = true
        
        time.topAnchor.constraint(equalTo: self.subTitle.bottomAnchor, constant: 8).isActive = true
        time.leftAnchor.constraint(equalTo: self.subTitle.leftAnchor).isActive = true
        time.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
