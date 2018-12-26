//
//  CategoryCell.swift
//  Backies
//
//  Created by Michael Buss Andersen on 26/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let identifier = "categoryCellId"
    
    var category: Category!
    
    var cellView : UIView = {
        let view = UIView()
        return view
    }()
    
    var cellLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
        setupCellView()
        setupCellLabel()
        self.contentView.addSubview(cellView)
        self.contentView.addSubview(cellLabel)
    }
    
    func setupCellLabel() {
        cellLabel.text = category.name ?? "Name not found"
        cellLabel.font = UIFont.boldSystemFont(ofSize: 20)
        cellLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        translatesAutoresizingMaskIntoConstraints = false
        cellLabel.frame = CGRect(
            x: 0,
            y: 0,
            width: self.contentView.frame.width,
            height: self.contentView.frame.height
        )
        
    }
    
    func setupCellView() {
        let cellPadding: CGFloat = 16
        let cellCornerRadius = cellPadding //Same as padding to look good
        
        // Smoothly rounded corners
        self.layer.mask = cornerRadiusSmoothMask(radius: cellCornerRadius)
        self.layer.masksToBounds = true
        
        self.backgroundColor = category.color.first ?? #colorLiteral(red: 0.8754016757, green: 0, blue: 0.8273025155, alpha: 1)
        // second gradient color here
    }
    
    func populate(withCategory category: Category){
        self.category = category
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
