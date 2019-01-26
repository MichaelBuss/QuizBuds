//
//  CategoriesData.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 05/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit


//let data = try decoder.decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)

class CategoryData {
    static func getCategories() -> [Category]{
        
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {return []}
        do {
            let jsonString = try String(contentsOfFile: path)
            let data = jsonString.data(using: .utf8)!
            let decoder = JSONDecoder()
            let categories = try decoder.decode([Category].self, from: data)
            return categories
        } catch _ as NSError {
            return []
        }

    }
}
