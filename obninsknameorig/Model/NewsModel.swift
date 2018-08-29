//
//  NewsModel.swift
//  ObninskName
//
//  Created by Artyom Vlasov on 23.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import Foundation

struct NewsModel {
    var id: String?
    var date: Double?
    var text: String?
    var author: String?
    var tag: String?
    var title: String?
    var images: Images?
    var plus: String?
    var minus: String?
    var reviewCount: String?
}

struct Images {
    let small: String?
    let original: String?
}
