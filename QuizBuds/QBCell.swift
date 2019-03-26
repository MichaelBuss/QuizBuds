//
//  GradientCell.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 26/03/2019.
//  Copyright © 2019 NoobLabs. All rights reserved.
//

import UIKit

class QBCell<T>: UICollectionViewCell {
    var element: T!
    
    func populate(withElement element: T) {
        self.element = element
    }
}
