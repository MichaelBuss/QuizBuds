//
//  CategoriesData.swift
//  Backies
//
//  Created by Michael Buss Andersen on 05/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class CategoryData {
    static func getCategories() -> [Category]{
        let categories = [
            Category(name: "Random", isActive: true, color: [UIColor(named: "GradientOrangeA")]),
            Category(name: "Sex", isActive: true, color: [UIColor(named: "GradientOrangeA")]),
            Category(name: "Manners", isActive: true, color: [UIColor(named: "GradientOrangeA")]),
            Category(name: "At work", isActive: false, color: [UIColor(named: "GradientOrangeA")]),
            Category(name: "Family", isActive: false, color: [UIColor(named: "GradientOrangeA")]),
            Category(name: "Friends", isActive: true, color: [UIColor(named: "GradientOrangeA")])
        ]
        return categories
    }
}
