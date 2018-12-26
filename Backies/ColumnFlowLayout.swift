//
//  ColumnFlowLayout.swift
//  Backies
//
//  Created by Michael Buss Andersen on 26/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare(){
        super.prepare()
        
        guard let cv = collectionView else { return }
        
        self.itemSize = CGSize(width: cv.bounds.inset(by: cv.layoutMargins).size.width, height: 90)
        
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        self.sectionInsetReference = .fromSafeArea
    }

}
