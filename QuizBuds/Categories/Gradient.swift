//
//  Gradient.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 29/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

struct Gradient {
    let color1: UIColor?
    let color2: UIColor?
}

extension Gradient: Decodable {
    enum GradientKeys: CodingKey {
        case color1
        case color2
    }
    
    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: GradientKeys.self)
        let color1Hex = try container.decode(String.self, forKey: .color1)
        let color2Hex = try container.decode(String.self, forKey: .color2)

        color1 = UIColor(fromHex: color1Hex)
        color2 = UIColor(fromHex: color2Hex)
    }
}
