//
//  CategoryCell.swift
//  obninsknameorig
//
//  Created by Artyom Vlasov on 30.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    var categoryView: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Constants.colorBlack
        view.font = UIFont(name: Constants.SFSemibold, size: 17)
        return view
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(categoryView)

        categoryView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        categoryView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
