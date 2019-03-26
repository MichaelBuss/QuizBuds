//
//  QBCollectionViewController.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 26/03/2019.
//  Copyright © 2019 NoobLabs. All rights reserved.
//

import UIKit

class QBCollectionViewController<T>: UIViewController, UICollectionViewDataSource {
    
    init(elements: [T]) {
        self.elements = elements
    }
    
    var elements: [T]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! QBCell<T>
        cell.populate(withElement: elements[indexPath.row])
        cell.layoutSubviews()
        return cell
    }
    
    
    
}
