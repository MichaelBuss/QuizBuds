//
//  QuizFlowLayout.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 28/01/2019.
//  Copyright © 2019 NoobLabs. All rights reserved.
//

import UIKit

class QuizFlowLayout: UICollectionViewFlowLayout {
    override func prepare(){
        super.prepare()
        //        self.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        guard let cv = collectionView else { return }
        
        let avaibleWidth = cv.bounds.inset(by: cv.layoutMargins).size.width
        
        let minColumnWidth = 0.8 * avaibleWidth //CGFloat(300.0)
        let maxNumColumns = Int(avaibleWidth / minColumnWidth)
        let cellWidth = ((avaibleWidth - 70) / CGFloat(maxNumColumns)).rounded(.down)
        let cellHeight = (cv.frame.height-350).rounded(.down)
        self.itemSize = CGSize(width: cellWidth, height: cellHeight)
        self.scrollDirection = .horizontal
        
        self.sectionInset = UIEdgeInsets(
            top: 0,
            left: self.minimumInteritemSpacing,
            bottom: 0.0,
            right: self.minimumInteritemSpacing)
        self.sectionInsetReference = .fromSafeArea
    }
}
