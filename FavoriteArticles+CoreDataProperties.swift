//
//  FavoriteArticles+CoreDataProperties.swift
//  TestTask
//
//  Created by Macbook Pro on 14.09.2020.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//
//

import Foundation
import CoreData


extension FavoriteArticles {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteArticles> {
        return NSFetchRequest<FavoriteArticles>(entityName: "FavoriteArticles")
    }

    @NSManaged public var title: String?
    @NSManaged public var abstract: String?
    @NSManaged public var byline: String?
    @NSManaged public var publishedDate: String?

}
