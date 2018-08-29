//
//  ServerRequest.swift
//  ObninskName
//
//  Created by Artyom Vlasov on 23.08.2018.
//  Copyright © 2018 midev. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import UIKit

class ServerRequest {
    
    func getImage(img: String?, view: UIImageView) {
        if let image = img {
            Alamofire.request(image).responseImage(completionHandler: { (response) in
                if let image = response.result.value {
                    DispatchQueue.main.async {
                        view.image = image
                    }
                }
            })
        }
    }
    
    func dateDef(post: Date) -> String{
        let current = Date()
        var def = String()
        let calendar = Calendar.current
        let formatter = DateFormatter()
        if calendar.component(.year, from: current) == calendar.component(.year, from: post) {
            formatter.dateFormat = "dd.MM.yyyy"
            def = formatter.string(from: post)
            if calendar.component(.month, from: current) == calendar.component(.month, from: post) {
                if calendar.component(.day, from: current) == calendar.component(.day, from: post) {
                    let hours = calendar.component(.hour, from: current) - calendar.component(.hour, from: post)
                    if hours < 2 {
                        def = "Недавно"
                    } else if hours == 21 || hours == 31 {
                        def = "\(hours) час назад"
                    } else if hours < 5 || hours < 25 && hours > 21 {
                        def = "\(hours) часа назад"
                    } else {
                        def = "\(hours) часов назад"
                    }
                } else if calendar.component(.day, from: current) - calendar.component(.day, from: post) == 1 {
                    def = "Вчера"
                } else {
                    let days = calendar.component(.day, from: current) - calendar.component(.day, from: post)
                    if days == 1 || days == 21 || days == 31 {
                        def = "\(days) день назад"
                    } else if days < 5 || days < 25 && days > 21 {
                        def = "\(days) дня назад"
                    } else {
                        def = "\(days) дней назад"
                    }
                }
            }
        }
        return def
    }
}
