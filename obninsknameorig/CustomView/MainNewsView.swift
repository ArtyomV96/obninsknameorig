//
//  MainNewsView.swift
//  ObninskName
//
//  Created by Artyom Vlasov on 23.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import UIKit

class MainNewsView: UIView {

    var tags: [TagsModel] = []

    var collectionView: UICollectionView = {
        let cll = TagCell()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: cll.tagView.frame.width, height: 36)
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
        var view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    
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
        tags.append(TagsModel(tagID: "0001", tag: "Свежее"))
        tags.append(TagsModel(tagID: "0002", tag: "Важное"))
        self.backgroundColor = Constants.colorWhite
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(TagCell.self, forCellWithReuseIdentifier: "cell")
        addViews()
        setupConstraints()

    }
    
    func addViews() {
        self.addSubview(collectionView)
        self.addSubview(postImage)
        self.addSubview(title)
        self.addSubview(subTitle)
        self.addSubview(time)
    }
    
    func setupConstraints() {
        let screenWidth = UIScreen.main.bounds.width - 32

        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

        postImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        postImage.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor).isActive = true
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

extension MainNewsView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TagCell
        cell.tagView.text = tags[indexPath.row].tag
        switch indexPath.row {
        case 0:
            cell.setColors(back: Constants.blueBackTag, text: Constants.blueTextTag)
        case 1:
            cell.setColors(back: Constants.redBackTag, text: Constants.redTextTag)
        default:
            cell.setColors(back: Constants.grayBackTag, text: Constants.grayTextTag)
        }
        return cell
    }
}
