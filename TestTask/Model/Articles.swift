//
//  Articles.swift
//  TestTask
//
//  Created by Macbook Pro on 11.09.2020.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import Foundation
class Articles{
    var publishedDate: String? = ""
    var byline: String = ""
    var title: String = ""
    var abstract: String = ""
    
    init(publishedDate: String,byline: String,title: String, abstract: String ) {
        self.publishedDate = publishedDate
        self.byline = byline
        self.title = title
        self.abstract = abstract
    }
}
