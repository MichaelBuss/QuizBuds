//
//  ColumnFlowLayout.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 26/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare(){
        super.prepare()
//        self.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        guard let cv = collectionView else { return }
        
        let avaibleWidth = cv.bounds.inset(by: cv.layoutMargins).size.width
        
        let minColumnWidth = CGFloat(300.0)
        let maxNumColumns = Int(avaibleWidth / minColumnWidth)
        let cellWidth = (avaibleWidth / CGFloat(maxNumColumns)).rounded(.down)
        
        self.itemSize = CGSize(width: cellWidth, height: 90.0)
        
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        self.sectionInsetReference = .fromSafeArea
    }
    
    

}
