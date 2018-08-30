//
//  Constants.swift
//  ObninskName
//
//  Created by Artyom Vlasov on 23.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import Foundation
import UIKit

class Constants: NSObject {
    
    static let newsTitle: String = "Новости"
    static let noticeTitle: String = "Афиша"
    static let evalPublicate: String = "Оцените публикацию"
    static let publicAuthor: String = "Автор публикации"
    static let colorBlack: UIColor = UIColor(named: "black")!
    static let colorWhite: UIColor = UIColor(named: "white")!
    static let colorGray: UIColor = UIColor(named: "gray")!
    static let colorBlue: UIColor = UIColor(named: "blue")!
    static let tintColorGray: UIColor = UIColor(named: "tintcolorgray")!
    static let tintColorGreen: UIColor = UIColor(named: "tintcolorgreen")!
    static let tintColorRed: UIColor = UIColor(named: "tintcolorred")!
    static let SFSemibold: String = "SFProText-Semibold"
    static let SFRegular: String = "SFProText-Regular"
    static let SFMedium: String = "SFProText-Medium"
    static let newsURL: String = "http://obninsk.name/api.php?get=news"
    static let tagsUrl: String = "http://obninsk.name/api.php?get=head"
    static let navBarView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "bar_logo"))

    static let blueBackTag: UIColor = UIColor(named: "blue")!
    static let blueTextTag: UIColor = UIColor(named: "white")!
    static let redBackTag: UIColor = UIColor(named: "tagitemredback")!
    static let redTextTag: UIColor = UIColor(named: "tagitemredtext")!
    static let grayBackTag: UIColor = UIColor(named: "tagitemgrayback")!
    static let grayTextTag: UIColor = UIColor(named: "tagitemgraytext")!
}
