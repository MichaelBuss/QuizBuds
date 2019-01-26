//
//  CategoriesModel.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 05/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

struct Category {
    var name: String?
    var isActive: Bool?
    var gradient: Gradient
}

extension Category: Decodable {
    enum CategoryKeys: String, CodingKey {
        case name
        case isActive
        case gradient
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CategoryKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        gradient = try container.decode(Gradient.self, forKey: .gradient)
        
        let storedIsActive = UserDefaults.standard.object(forKey: name!) as! Bool?
        let decoded = try container.decode(Bool.self, forKey: .isActive)
        isActive = storedIsActive ?? decoded
    }
}
