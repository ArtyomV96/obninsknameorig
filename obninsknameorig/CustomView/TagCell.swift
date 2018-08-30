//
//  TagCell.swift
//  obninsknameorig
//
//  Created by Artyom Vlasov on 29.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import UIKit

class TagCell: UICollectionViewCell {

    var tagView: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: Constants.SFRegular, size: 15)
        view.textColor = Constants.colorWhite
        //view.widthAnchor.constraint(equalToConstant: 70).isActive = true
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tagView)
        self.backgroundColor = Constants.colorBlack
        self.layer.cornerRadius = 18
        tagView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tagView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        tagView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        tagView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        tagView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
    }

    func setColors(back: UIColor, text: UIColor) {
        tagView.textColor = text
        self.backgroundColor = back
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
}
