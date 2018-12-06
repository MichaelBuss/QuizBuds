//
//  CategoriesData.swift
//  Backies
//
//  Created by Michael Buss Andersen on 05/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import Foundation

class CategoryData {
    static func getCategories() -> [Category]{
        let categories = [
            Category(name: "Random", isActive: true),
            Category(name: "Sex", isActive: true),
            Category(name: "Manners", isActive: true),
            Category(name: "At work", isActive: false),
            Category(name: "Family", isActive: false),
            Category(name: "Friends", isActive: true)
        ]
        return categories
    }
}
